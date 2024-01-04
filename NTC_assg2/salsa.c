#include <stdint.h>
#include <stddef.h>
#include "salsa20.h"
#include <stdio.h>
#include "./salsa20.h"
#include <inttypes.h>
#include <string.h>
#include <stdlib.h>

// Implements DJB's definition of '<<<'
static uint32_t rotl(uint32_t value, int shift)
{
  return (value << shift) | (value >> (32 - shift));
}

static void s20_quarterround(uint32_t *y0, uint32_t *y1, uint32_t *y2, uint32_t *y3)
{
  *y1 = *y1 ^ rotl(*y0 + *y3, 7);
  *y2 = *y2 ^ rotl(*y1 + *y0, 9);
  *y3 = *y3 ^ rotl(*y2 + *y1, 13);
  *y0 = *y0 ^ rotl(*y3 + *y2, 18);
}

static void s20_rowround(uint32_t y[static 16])
{
  s20_quarterround(&y[0], &y[1], &y[2], &y[3]);
  s20_quarterround(&y[5], &y[6], &y[7], &y[4]);
  s20_quarterround(&y[10], &y[11], &y[8], &y[9]);
  s20_quarterround(&y[15], &y[12], &y[13], &y[14]);
}

static void s20_columnround(uint32_t x[static 16])
{
  s20_quarterround(&x[0], &x[4], &x[8], &x[12]);
  s20_quarterround(&x[5], &x[9], &x[13], &x[1]);
  s20_quarterround(&x[10], &x[14], &x[2], &x[6]);
  s20_quarterround(&x[15], &x[3], &x[7], &x[11]);
}

static void s20_doubleround(uint32_t x[static 16])
{
  s20_columnround(x);
  s20_rowround(x);
}

// Creates a little-endian word from 4 bytes pointed to by b
static uint32_t s20_littleendian(uint8_t *b)
{
  return b[0] +
         ((uint_fast16_t) b[1] << 8) +
         ((uint_fast32_t) b[2] << 16) +
         ((uint_fast32_t) b[3] << 24);
}

// Moves the little-endian word into the 4 bytes pointed to by b
static void s20_rev_littleendian(uint8_t *b, uint32_t w)
{
  b[0] = w;
  b[1] = w >> 8;
  b[2] = w >> 16;
  b[3] = w >> 24;
}

// The core function of Salsa20
static void s20_hash(uint8_t seq[static 64])
{
  int i;
  uint32_t x[16];
  uint32_t z[16];

  // Create two copies of the state in little-endian format
  // First copy is hashed together
  // Second copy is added to first, word-by-word
  for (i = 0; i < 16; ++i)
    x[i] = z[i] = s20_littleendian(seq + (4 * i));

  for (i = 0; i < 20; ++i)
    s20_doubleround(z);

  for (i = 0; i < 16; ++i) {
    z[i] += x[i];
    s20_rev_littleendian(seq + (4 * i), z[i]);
  }
}

// The 16-byte (128-bit) key expansion function
static void s20_expand16(uint8_t *k,
                         uint8_t n[static 16],
                         uint8_t keystream[static 64])
{
  int i, j;
  // The constants specified by the Salsa20 specification, 'tau'
  // "expand 16-byte k"
  uint8_t t[4][4] = {
    { 'e', 'x', 'p', 'a' },
    { 'n', 'd', ' ', '1' },
    { '6', '-', 'b', 'y' },
    { 't', 'e', ' ', 'k' }
  };

  // Copy all of 'tau' into the correct spots in our keystream block
  for (i = 0; i < 64; i += 20)
    for (j = 0; j < 4; ++j)
      keystream[i + j] = t[i / 20][j];

  // Copy the key and the nonce into the keystream block
  for (i = 0; i < 16; ++i) {
    keystream[4+i]  = k[i];
    keystream[44+i] = k[i];
    keystream[24+i] = n[i];
  }

  s20_hash(keystream);
}


// The 32-byte (256-bit) key expansion function
static void s20_expand32(uint8_t *k,
                         uint8_t n[static 16],
                         uint8_t keystream[static 64])
{
  int i, j;
  // The constants specified by the Salsa20 specification, 'sigma'
  // "expand 32-byte k"
  uint8_t o[4][4] = {
    { 'e', 'x', 'p', 'a' },
    { 'n', 'd', ' ', '3' },
    { '2', '-', 'b', 'y' },
    { 't', 'e', ' ', 'k' }
  };

  // Copy all of 'sigma' into the correct spots in our keystream block
  for (i = 0; i < 64; i += 20)
    for (j = 0; j < 4; ++j)
      keystream[i + j] = o[i / 20][j];

  // Copy the key and the nonce into the keystream block
  for (i = 0; i < 16; ++i) {
    keystream[4+i]  = k[i];
    keystream[44+i] = k[i+16];
    keystream[24+i] = n[i];
  }

  s20_hash(keystream);
}


// Performs up to 2^32-1 bytes of encryption or decryption under a
// 128- or 256-bit key and 64-byte nonce.
enum s20_status_t s20_crypt(uint8_t *key,
                            enum s20_keylen_t keylen,
                            uint8_t nonce[static 8],
                            uint32_t si,
                            uint8_t *buf,
                            uint32_t buflen)
{
  uint8_t keystream[64];
  // 'n' is the 8-byte nonce (unique message number) concatenated
  // with the per-block 'counter' value (4 bytes in our case, 8 bytes
  // in the standard). We leave the high 4 bytes set to zero because
  // we permit only a 32-bit integer for stream index and length.
  uint8_t n[16] = { 0 };
  uint32_t i;

  // Pick an expansion function based on key size
  void (*expand)(uint8_t *, uint8_t *, uint8_t *) = NULL;
  if (keylen == S20_KEYLEN_256)
    expand = s20_expand32;
  if (keylen == S20_KEYLEN_128)
    expand = s20_expand16;

  // If any of the parameters we received are invalid
  if (expand == NULL || key == NULL || nonce == NULL || buf == NULL)
    return S20_FAILURE;

  // Set up the low 8 bytes of n with the unique message number
  for (i = 0; i < 8; ++i)
    n[i] = nonce[i];

  // If we're not on a block boundary, compute the first keystream
  // block. This will make the primary loop (below) cleaner
  if (si % 64 != 0) {
    // Set the second-to-highest 4 bytes of n to the block number
    s20_rev_littleendian(n+8, si / 64);
    // Expand the key with n and hash to produce a keystream block
    (*expand)(key, n, keystream);
  }

  // Walk over the plaintext byte-by-byte, xoring the keystream with
  // the plaintext and producing new keystream blocks as needed
  for (i = 0; i < buflen; ++i) {
    // If we've used up our entire keystream block (or have just begun
    // and happen to be on a block boundary), produce keystream block
    if ((si + i) % 64 == 0) {
      s20_rev_littleendian(n+8, ((si + i) / 64));
      (*expand)(key, n, keystream);
    }
    // xor one byte of plaintext with one byte of keystream
    buf[i] ^= keystream[(si + i) % 64];
  }
  
  return S20_SUCCESS;
}


void Decryption(uint8_t *key256, uint8_t nonce[static 8], uint32_t si) {
  printf("\n**********You are in Decryption part************\n");
  printf("Enter the text to be Decrypted:\n");
  char cipher_string[1024];
  scanf(" %[^\n]", cipher_string);
  
  // Calculate the size of the ciphertext array based on the input length
  size_t ciphertext_size = strlen(cipher_string) / 2;
  
  uint8_t ciphertext[ciphertext_size];
  
  for (int i = 0; i < ciphertext_size; i++) {
    sscanf(cipher_string + i * 2, "%2hhx", &ciphertext[i]);
  }

  s20_crypt(key256, S20_KEYLEN_256, nonce, si, ciphertext, sizeof(ciphertext));
  printf("\nPROCESSING....\nDONE.\n");
  printf("The Decrypted text is: \n");
  for (int i = 0; i < sizeof(ciphertext); i++) {
    printf("%c", ciphertext[i]);
  }
  printf("\n\n");
  printf("Decryption done Successfully....\n");
}


void Encryption(
                uint8_t *key256,
                uint8_t nonce[static 8],
                uint32_t si
)
{
  printf("\n**********You are in Encryption part************\n");
  printf("Enter the text to be Encrypted:\n");
  
  // Declare a buffer to read user input
  char input_buffer[512];
  
  // Read user input
  scanf(" %[^\n]", input_buffer);
  
  // Calculate the size of the plaintext array based on the input length
  size_t plaintext_size = strlen(input_buffer);
  
  // Dynamically allocate memory for the plaintext array
  uint8_t *plaintext = malloc(plaintext_size);
  if (plaintext == NULL) {
    printf("Memory allocation failed.\n");
    return;
  }

  // Copy the input string to the plaintext array
  memcpy(plaintext, input_buffer, plaintext_size);

  // Encrypt the plaintext
  s20_crypt(key256, S20_KEYLEN_256, nonce, si, plaintext, plaintext_size);

  printf("\nPROCESSING....\nDONE.\n");
  printf("The Encrypted text is: \n");
  for (size_t i = 0; i < plaintext_size; i++) {
      printf("%02x", plaintext[i]);
  }
  printf("\n\n");
  printf("Encryption done Successfully....\n");

  // Free the dynamically allocated memory
  free(plaintext);
}




int main() {
  /* ************** code for syntaxing********************* */
  printf("-------------------Welcome To The Salsa20 Cryptography---------------------\n");
  printf("Enter the 256bit key as in Hexadecimal form:\n");
  char hex_string[64];
  scanf(" %[^\n]",hex_string);
  uint8_t key256[32];
  for (int i = 0; i < 32; i++) {
        sscanf(hex_string + i * 2, "%2hhx", &key256[i]);
  }
  printf("Enter the 64bit nonce key as in Hexadecimal from:\n");
  char nonce_string[16];
  scanf(" %[^\n]",nonce_string);
  uint8_t nonce[8];
  for (int i = 0; i < 8; i++) {
        sscanf(nonce_string + i * 2, "%2hhx", &nonce[i]);
  }
  printf("Enter The Stream Index:\n");
  uint32_t si;
  scanf("%" SCNu32, &si);
  /* *************************************** */

  int choice;
  while(1)
  {
      printf("\nMenu:\n");
      printf("1. Encryption\n");
      printf("2. Decryption\n");
      printf("3. Quit\n");
      printf("Enter the number of your choice: ");
      scanf("%d", &choice);
      switch (choice) {
            case 1:
                Encryption(key256,nonce,si);
                break;
            case 2:
                Decryption(key256,nonce,si);
                break;
            case 3:
                printf("Goodbye!\n");
                return 0;
            default:
                printf("Invalid choice. Please enter a valid option.\n");
        }
    }
    return 0;
  }


// 000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f

// 0001020304050607

// 0

//hello world

// 46c8633377775ea1a41ed7a9d69b54f7

// FÈc3ww^¡¤^×©)åT÷


// **********You are in Encryption part************
// Enter the text to be Encrypted:
// A step-by-step implementation roadmap of the project guides you through various stages of implementation of the RDBMS. The documentation of the project includes tutorials that help you to assimilate the concepts as well as the data structures and design details that you need to understand at each phase of the project. The complete design and specification of the RDBMS and its various component subsystems are also documented and made available

// PROCESSING....
// DONE.
// The Encrypted text is: 
// 6f8d7c2b7d2704acaf5fc0dd4d94749e42ab28cd16f9b6a67890857bc0d9b4d316db681e2679b813183c90b6de06eeca97bd660966551cf9819445c285d8ce5cd5525936ac6313adc8d84cadd8f99285e8b67103766beca10f6d5992f1beca8ad89bd7b4f8dd96cacd3d21a24a7c04af54982382b796c2eeeb02a3d6ef8c98a7e22ecb86a656f36a12ad3f23e811321ad252af184e67e2039acffdf0a4d52681e3186f88bb6b4e6e0ab358ee9ec8040d45c18a06c3acc23f4257209394b799daed20012ca7b608bb590f31b15adbe51e8c1aac32965e3f8e3c959edc904cd833955bcae7fa618090fc5f3e28e96fe61742b3ce54c29c709a4e170c6634437b1a5321d66bd0c41dc246a42878eda1080f5d7b87d33fed57be677cd001827643dc85face315df640e746956405ee47cbe9569e11c16c027624df2479d690857ab977431dfe311f6848763dd8bddc150b3de9577851bad818491984477758ed06a3ebed4e518aa36c21b1a2612bab3634ae9ba4e9d8d051912d8d4b35fce18ce8553ae926cf04b1d48c8e2961bd7d548395d81f083cb00151fdcebe8d8613a1ac8b3b5cefcde42c14825589eeb7546e7623644f276c2143b8dc40f38951a14e
