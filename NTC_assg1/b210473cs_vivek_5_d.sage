## transposition_cipher_decryption
import math
cipher_text=raw_input("Enter the text to be decrypted:")

print("The cipher text is:")
print(cipher_text)

input_str = raw_input("Enter permutation key separated by spaces: ")

input_list = [int(x) for x in input_str.split()]

print("The key list is:")
print(input_list)


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

message=""
for x in cipher_text:
    if x!=" ":
        message+=x
trans_cipher(message.upper(),input_list)

