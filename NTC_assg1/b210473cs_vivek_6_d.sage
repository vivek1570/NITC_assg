## vigenere cipher decryption

cipher_text=raw_input("Enter your cipher text: ")

secret_key=raw_input("Enter your secret key: ")

print("The cipher text is: "+cipher_text)

print("The secret key is: "+secret_key)

def vigenere_cipher(cipher_text,text):
    lp=len(cipher_text)
    lt=len(text)
    list1=[]
    list2=[]
    for i in range(lp):
        x=i%lt
        list1.append(ord(text[x])-ord('A'))
        list2.append(ord(cipher_text[i])-ord('A'))
    plain_text=""
    for i in range(lp):
        if list2[i] < list1[i]:
            plain_text += chr(ord('A')+26 + list2[i] - list1[i])
        else:
            plain_text += chr(list2[i] - list1[i]+ord('A'))
    print("The decrypted text is: " + plain_text)


text=""
for p in cipher_text:
    if p!=" ":
        text+=p
text_s=""
for p in secret_key:
    if p!=" ":
        text_s+=p
vigenere_cipher(text.upper(),text_s.upper())

## HHWKSWXSLGNTCG
## pascal