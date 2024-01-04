## affine cipher encryption
inverse_pairs = [(1, 1),(3, 9),(5, 21),(7, 15),(9, 3),(11, 19),(15, 7),(17, 23),
                 (19, 11),(21, 5),(23, 17),(25, 25)]

plain_text=raw_input("Enter the text: ")

key1=raw_input("Enter the multiplicative key: ")

key2=raw_input("Enter the additive key: ")

print("The plain text is: "+plain_text)

print("The multiplicative key is: "+key1)

print("The additive key is: "+key2)


def affine_cipher(plain_text,k1,k2):
    cipher_text=""
    for p in plain_text:
            t=((ord(p)-ord('A'))*k1)%26
            c=(t+k2)%26
            cipher_text+=chr(ord('A')+c)
    print("The cipher text is: "+cipher_text)

k1=int(key1)
k2=int(key2)
text=""
for p in plain_text:
    if p!=" ":
        text+=p
f=1;
for i in range(12):
    if inverse_pairs[i][0]==k1:
        affine_cipher(text.upper(),k1,k2)
        f=0
        break
if f==1:
    print("The multiplicative key is not valid")

