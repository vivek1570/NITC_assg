︠00ae41ba-a62d-474d-9761-076ec84b428bs︠
import math
cipher_text=raw_input("Enter the cipher text: ")
print("The cipher text is: "+cipher_text)

main_list={}
text=cipher_text
for i in range(len(cipher_text)-2):
#     temp_list=[]
    word_to_find=cipher_text[i:i+3]
    start_positions = []
    index = 0
    while index < len(text):
        index = text.find(word_to_find, index)
        if index == -1:
            break
        start_positions.append(index)
        index += 1
    if len(start_positions)>1:
        fg=start_positions[1]-start_positions[0]
        if word_to_find not in main_list:
            main_list[word_to_find]=fg

# print(main_list)
gcd_list=[]
for word,diff in main_list.items():
    if diff not in gcd_list:
        gcd_list.append(diff)
# print(gcd_list)

gcd_result= math.gcd(*gcd_list)
# print(gcd_result)
list_text=[]
for i in range(gcd_result):
    list_text.append("")
for i in range(len(text)):
    x=i%gcd_result
    for j in range(gcd_result):
        if x==j:
            list_text[j]=list_text[j]+text[i]
# print(list_text)

def freq_func(cipher_text):
    char_freq =[0]*26
    for x in cipher_text:
        char_freq[ord(x)-ord('A')]+=1
    list_map=[]
    for i in range(26):
        list_1=[]
        list_1.append(char_freq[i])
        list_1.append(i)
        list_map.append(list_1)
    def custom_sort_key(item):
        return (-item[0], item[1])

    # Sort the list using the custom key function
    list_my = sorted(list_map, key=custom_sort_key)
    return list_my
lett= {
    'A': 0.08167, 'B': 0.01492, 'C': 0.02782, 'D': 0.04253,
    'E': 0.12702, 'F': 0.02228, 'G': 0.02015, 'H': 0.06094,
    'I': 0.06966, 'J': 0.00153, 'K': 0.00772, 'L': 0.04025,
    'M': 0.02406, 'N': 0.06749, 'O': 0.07507, 'P': 0.01929,
    'Q': 0.00095, 'R': 0.05987, 'S': 0.06327, 'T': 0.09056,
    'U': 0.02758, 'V': 0.00978, 'W': 0.02360, 'X': 0.00150,
    'Y': 0.01974, 'Z': 0.00074
}

def funi(list_of_arrays):
    result_map = {}
    for array in list_of_arrays:
        if len(array) == 2:
            key, value = array
            result_map[value] = key



list_freq=[]
keys=[]
for i in list_text:
    list_fr=freq_func(i)
    mappi=funi(list_fr)
    leng=len(i)
    o=1
    int_max = float('inf')
    for k in range(26):
        mic=0
        for j in range(26):
            v=mappi[j]/leng
            mic+=(lett[j+ord('A')]+v)
        ansi=mic-(0.067)
        if(ansi<int_max):
            int_max=ansi
            o=k
    keys.append(o)

print(keys)



︡9a59ce95-73cc-4ed6-a40c-876cb600d6ae︡{"raw_input":{"prompt":"Enter the cipher text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the cipher text: ","submitted":true,"value":"LIOMWGFEGGDVWGHHCQUCRHRWAGWIOWQLKGZETKKMEVLWPCZVGTHVTSGXQOVGCSVETQLTJSUMVWVEUVLXEWSLGFZMVVWLGYHCUSWXQHKVGSHEEVFLCFDGVSUMPHKIRZDMPHHBVWVWJWIXGFWLTSHGJOUEEHHVUCFVGOWICQLTJSUXGLW"}}︡{"stdout":"The cipher text is: LIOMWGFEGGDVWGHHCQUCRHRWAGWIOWQLKGZETKKMEVLWPCZVGTHVTSGXQOVGCSVETQLTJSUMVWVEUVLXEWSLGFZMVVWLGYHCUSWXQHKVGSHEEVFLCFDGVSUMPHKIRZDMPHHBVWVWJWIXGFWLTSHGJOUEEHHVUCFVGOWICQLTJSUXGLW\n"}︡{"stderr":"Error in lines 64-79\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 10, in <module>\nTypeError: 'NoneType' object is not subscriptable\n"}︡{"done":true}
︠a9f16ab9-e55d-471d-a569-07b72e9e32bd︠
text = "LIOMWGFEGGDVWGHHCQUCRHRWAGWIOWQLKGZETKKMEVLWPCZVGTHVTSGXQOVGCSVETQLTJSUMVWVEUVLXEWSLGFZMVVWLGYHCUSWXQHKVGSHEEVFLCFDGVSUMPHKIRZDMPHHBVWVWJWIXGFWLTSHGJOUEEHHVUCFVGOWICQLTJSUXGLW"
word_to_find = "JSU"
start_positions = []
index = 0

while index < len(text):
    index = text.find(word_to_find, index)
    if index == -1:
        break
    start_positions.append(index)
    index += 1

for position in start_positions:
    print(f"Word '{word_to_find}' starts at position: {position}")
︡fd54523d-2ec4-4670-9262-f82166c0f5a5︡{"stdout":"Word 'JSU' starts at position: 68\nWord 'JSU' starts at position: 168\n"}︡{"done":true}
︠89c5938b-1c5f-4eed-add7-e796376c9f9as︠
cipher_text=raw_input("Enter the cipher text: ")
print("The cipher text is: "+cipher_text)

word="CODE"
print("the keys are: ")
for i in range(len(word)):
    print(ord(word[i])-ord('A'))

print("The key word is: ",word)

︡c0c25d19-1aea-4f3a-bb0e-51581f222ebd︡{"raw_input":{"prompt":"Enter the cipher text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the cipher text: ","submitted":true,"value":"LIOMWGFEGGDVWGHHCQUCRHRWAGWIOWQLKGZETKKMEVLWPCZVGTHVTSGXQOVGCSVETQLTJSUMVWVEUVLXEWSLGFZMVVWLGYHCUSWXQHKVGSHEEVFLCFDGVSUMPHKIRZDMPHHBVWVWJWIXGFWLTSHGJOUEEHHVUCFVGOWICQLTJSUXGLW"}}︡{"stdout":"The cipher text is: LIOMWGFEGGDVWGHHCQUCRHRWAGWIOWQLKGZETKKMEVLWPCZVGTHVTSGXQOVGCSVETQLTJSUMVWVEUVLXEWSLGFZMVVWLGYHCUSWXQHKVGSHEEVFLCFDGVSUMPHKIRZDMPHHBVWVWJWIXGFWLTSHGJOUEEHHVUCFVGOWICQLTJSUXGLW\n"}︡{"stdout":"the keys are: \n"}︡{"stdout":"2\n14\n3\n4\n"}︡{"stdout":"The key word is:  CODE\n"}︡{"done":true}










