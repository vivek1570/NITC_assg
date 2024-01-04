︠eb2bb7f7-7266-46be-a92d-df493d043b7b︠
## affine cipher crypt analysis
# import enchant
# from nltk.corpus import words
inverse_pairs = [(1, 1),(3, 9),(5, 21),(7, 15),(9, 3),(11, 19),(15, 7),(17, 23),
                 (19, 11),(21, 5),(23, 17),(25, 25)]


cipher_text=raw_input("Enter the text: ")

# key1=raw_input("Enter the multiplicative key: ")

# key2=raw_input("Enter the additive key: ")

print("The cipher text is: "+cipher_text)

# print("The multiplicative key is: "+key1)

# print("The additive key is: "+key2)
list_plain_text=[]
def affine_cipher(cipher_text,k2,k):
    plain_text=""
    for p in cipher_text:
            t=((ord(p)-ord('A'))-k2)%26
            p=(t*k)%26
            plain_text+=chr(ord('A')+p)
    list_plain_text.append(plain_text)

text=""
for p in cipher_text:
    if p!=" ":
        text+=p
f=1;

list_i=[1,3,5,7,9,11,15,17,19,21,23,25]

print("The possible plain_texts are: ")

cnt=0

for i in range(26):
    for j in list_i:
        cnt=cnt+1
        affine_cipher(cipher_text,i,j)
# print(list_plain_text)
words=list_plain_text
import enchant

# Create an Enchant dictionary for a specific language (e.g., English)
dictionary = enchant.Dict("en_US")

# List of words  # Your list of words here

# Find and print the correct dictionary words
correct_words = [word for word in words if dictionary.check(word)]
print(correct_words)






︡51b6920e-cc2d-49da-bc42-5de7d914927b︡{"raw_input":{"prompt":"Enter the text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the text: ","submitted":true,"value":"ZEBBW"}}︡{"stdout":"The cipher text is: ZEBBW\n"}︡{"stdout":"The possible plain_texts are: \n"}︡{"stderr":"Error in lines 27-27\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\nModuleNotFoundError: No module named 'enchant'\n"}︡{"done":true}









