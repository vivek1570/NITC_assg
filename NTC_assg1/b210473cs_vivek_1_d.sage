## affine cipher decryption
inverse_pairs = [(1, 1),(3, 9),(5, 21),(7, 15),(9, 3),(11, 19),(15, 7),(17, 23),
                 (19, 11),(21, 5),(23, 17),(25, 25)]

cipher_text=raw_input("Enter the text: ")

key1=raw_input("Enter the multiplicative key: ")

key2=raw_input("Enter the additive key: ")

print("The cipher text is: "+cipher_text)

print("The multiplicative key is: "+key1)

print("The additive key is: "+key2)

def affine_cipher(cipher_text,k2,k):
    plain_text=""
    for p in cipher_text:
            t=((ord(p)-ord('A'))-k2)%26
            p=(t*k)%26
            plain_text+=chr(ord('A')+p)
    print("The plain_text is: "+plain_text)

k1=int(key1)
k2=int(key2)
text=""
for p in cipher_text:
    if p!=" ":
        text+=p
f=1;
for i in range(12):
    if inverse_pairs[i][0]==k1:
        affine_cipher(text.upper(),k2,inverse_pairs[i][1])
        f=0
        break
if f==1:
    print("The multiplicative key is not valid")

