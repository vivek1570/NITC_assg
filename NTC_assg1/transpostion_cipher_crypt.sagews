︠e32bc100-3683-459b-9dff-3288d03459b7s︠

plain_text=raw_input("Enter the known plain_text: ")
cipher_text=raw_input("Enter known the cipher text: ")
messa=raw_input("Enter the message to decrypted: ")

print("The known plain text is: "+plain_text)
print("The known cipher text is: "+cipher_text)

print("The message to be decrypted : "+messa)

message=""

for i in plain_text:
    if i!=" ":
        message+=i

plain_text=message.upper()


col=5
row=len(cipher_text)/col
matrix_p=Matrix(row,col,0)

padd=row*col-(len(plain_text))
for i in range(padd):
    plain_text=plain_text+'X'
print(plain_text)

cnt=0
for i in range(row):
    for j in range(col):
        matrix_p[i,j]=ord(plain_text[cnt])-ord('A')
        cnt=cnt+1
matrix_c=Matrix(row,col,0)
cnt=0

for i in range(col):
    for j in range(row):
        matrix_c[j,i]=ord(cipher_text[cnt])-ord('A')
        cnt=cnt+1

list_ans=[]
for i in range(col):
    for j in range(col):
        if matrix_c[:,i]==matrix_p[:,j]:
            list_ans.append(j+1)
            break

def trans_cipher(cipher_text,input_list):
    x=len(input_list)
    rows=math.ceil((len(cipher_text))/x)
    matrix = Matrix(rows, x, 0)
    cnt=0
    for i in range(x):
        for j in range(rows):
            matrix[j,i]=ord(cipher_text[cnt])-ord('A')
            cnt=cnt+1
    key_matrix=Matrix(x,x,0)
    for i in range(x):
        key_matrix[i,input_list[i]-1]=1

#     reslut=matrix.matrix_multiply(key_matrix)
    cipher_matrix=matrix*key_matrix

    plain_text=""
    for i in range(rows):
        for j in range(x):
            plain_text+=chr(cipher_matrix[i,j]+ord('A'))
    print("\nThe Encrypted text is:"+ plain_text)


trans_cipher(messa,list_ans)

print("\n")
print("The key list is :",list_ans)

# ETTHEAKIMAOTYCNXNTSG
# Enemy attacks tonight
# ENEMYATTACKSTONIGHTX
︡8af0f92f-4108-40d3-a4c1-8b1d94a4ed9f︡{"raw_input":{"prompt":"Enter the known plain_text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the known plain_text: ","submitted":true,"value":"Enemy attacks tonight"}}︡{"raw_input":{"prompt":"Enter known the cipher text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter known the cipher text: ","submitted":true,"value":"ETTHEAKIMAOTYCNXNTSG"}}︡{"raw_input":{"prompt":"Enter the message to decrypted: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the message to decrypted: ","submitted":true,"value":"ETTHEAKIMAOTYCNXNTSG"}}︡{"stdout":"The known plain text is: Enemy attacks tonight\n"}︡{"stdout":"The known cipher text is: ETTHEAKIMAOTYCNXNTSG\n"}︡{"stdout":"The message to be decrypted : ETTHEAKIMAOTYCNXNTSG\n"}︡{"stdout":"ENEMYATTACKSTONIGHTX\n"}︡{"stdout":"\nThe Encrypted text is:ENEMYATTACKSTONIGHTX\n"}︡{"stdout":"\n\n"}︡{"stdout":"The key list is : [3, 1, 4, 5, 2]\n"}︡{"done":true}










