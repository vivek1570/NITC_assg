## transposition_cipher
import math
plain_text=raw_input("Enter the plain text:")

print("The Plain text is:")
print(plain_text)

input_str = raw_input("Enter permutation key separated by spaces: ")

input_list = [int(x) for x in input_str.split()]

print("The key list is:")
print(input_list)


def trans_cipher(plain_text,input_list):
    x=len(input_list)
    rows=math.ceil((len(plain_text))/x)
    padd=rows*x-(len(plain_text))
    plain_text+='X'*padd
    matrix = Matrix(rows, x, 0)
    cnt=0
    for i in range(rows):
        for j in range(x):
            matrix[i,j]=ord(plain_text[cnt])-ord('A')
            cnt=cnt+1
    key_matrix=Matrix(x,x,0)
    for i in range(x):
        key_matrix[input_list[i]-1,i]=1

#     reslut=matrix.matrix_multiply(key_matrix)
    cipher_matrix=matrix*key_matrix

    cipher_text=""
    for i in range(x):
        for j in range(rows):
            cipher_text+=chr(cipher_matrix[j,i]+ord('A'))
    print("\nThe Encrypted text is:"+ cipher_text)

message=""
for x in plain_text:
    if x!=" ":
        message+=x
trans_cipher(message.upper(),input_list)