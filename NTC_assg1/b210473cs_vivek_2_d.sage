## hill cipher decryption
import math
cipher_text=raw_input("Enter the cipher text: ")

y=raw_input("Enter the matrix size: ")
size=int(y)
matrix=Matrix(size,size,0)

input_str = raw_input("Enter matrix separated by spaces: ")

input_list = [int(x) for x in input_str.split()]

print(input_list)
cnt=0

for i in range(size):
    for j in range(size):
        matrix[i,j]=input_list[cnt]
        cnt+=1


print("The cipher text is: "+cipher_text)
print("The key matrix is: ")
print(matrix)
print("\n")

def hill_cipher(cipher_text,size,matrix):
    rows=math.ceil((len(cipher_text))/size)
    padd=rows*size-(len(cipher_text))
    cipher_text+='Z'*padd
    matrix_p = Matrix(rows,size, 0)
    cnt=0
    for i in range(rows):
        for j in range(size):
            matrix_p[i,j]=ord(cipher_text[cnt])-ord('A')
            cnt=cnt+1
    inverse_matrix=matrix.inverse()
    result=(matrix_p*inverse_matrix)%26
    plain_text=""
    for i in range(rows):
        for j in range(size):
            plain_text+=chr((result[i,j])%26+ord('A'))
    print("The cipher text is: "+plain_text)


message=""
for x in cipher_text:
    if x!=" ":
        message+=x
det=matrix.determinant()
f=1
if det!=0:
    hill_cipher(message.upper(),size,matrix)
    f=0

if f:
    print("The key matrix is not acceptable!")
# 9 7 11 13 4 7 5 6 2 21 14 9 3 23 21 8
#OHKNIHGHFISS