︠8c13480f-0b31-4a1b-816f-a1f302ac836a︠
## vigenere cipher

plain_text=raw_input("Enter your plain text: ")

secret_key=raw_input("Enter your secret key: ")

print("The plain text is: "+plain_text)

print("The secret key is: "+secret_key)

def vigenere_cipher(plain_text,text):
    lp=len(plain_text)
    lt=len(text)
    list1=[]
    list2=[]
    for i in range(lp):
        x=i%lt
        list1.append(ord(text[x])-ord('A'))
        list2.append(ord(plain_text[i])-ord('A'))
    cipher_text=""
    for i in range(lp):
        x=(list1[i]+list2[i])%26
        cipher_text+=chr(x+ord('A'))
    print("The cipher text is: "+cipher_text)



text=""
for p in plain_text:
    if p!=" ":
        text+=p
text_s=""
for p in secret_key:
    if p!=" ":
        text_s+=p
vigenere_cipher(text.upper(),text_s.upper())