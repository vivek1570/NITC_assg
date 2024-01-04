︠0367fecc-df4b-4996-b3f5-cb8e8bbf4373s︠
## hill cipher crypt_analysis
import math

plain_text=raw_input("Enter plain text: ")
cipher_text=raw_input("Enter cipher text: ")

print("The plain text is: "+plain_text)
print("The cipher text is: "+cipher_text)
print("\n")

cnt=0
message=""
for x in plain_text:
    if x!=" ":
        message+=x
plain_text=message.upper()

size=math.sqrt(len(plain_text))

m=int(size)
print(m)
cnt=0
matrix_p=Matrix(m,m,0)
for i in range(m):
    for j in range(m):
        matrix_p[i,j]=ord(plain_text[cnt])-ord('A')
        cnt=cnt+1
cnt=0
matrix_c=Matrix(m,m,0)
for i in range(m):
    for j in range(m):
        matrix_c[i,j]=ord(cipher_text[cnt])-ord('A')
        cnt=cnt+1
matri=(matrix_p.inverse()*matrix_c)%26
print(matri)
# 9 7 11 13 4 7 5 6 2 21 14 9 3 23 21 8
#OHKNIHGHFISS
# code is ready

# WFSBMSSGTYDCGCIX
# my name is rahul gan
# my name is rahul gan

# The plain text is: VEFREWTWS
# The cipher text is: UCXPGDFMX
# 17 24 17 22  9 25 19 12 12
︡8f9fb8ec-ca87-4186-8e50-ccc9d8049d44︡{"raw_input":{"prompt":"Enter plain text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter plain text: ","submitted":true,"value":"VEFREWTWS"}}︡{"raw_input":{"prompt":"Enter cipher text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter cipher text: ","submitted":true,"value":"UCXPGDFMX"}}︡{"stdout":"The plain text is: VEFREWTWS\n"}︡{"stdout":"The cipher text is: UCXPGDFMX\n"}︡{"stdout":"\n\n"}︡{"stdout":"3\n"}︡{"stdout":"[17 24 17]\n[22  9 25]\n[19 12 12]\n"}︡{"done":true}









