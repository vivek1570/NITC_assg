##  substitution cipher encryption
alphabet = 'abcdefghijklmnopqrstuvwxyz'
# input_string = 'kmtyxnwsouagiqjzhebpdvrclf'

plain_text=raw_input("Message to be encrypted:")
print("The plain text is: "+plain_text)

input_string=raw_input("Input alphabet string:")
print("The input alphabet string is: "+input_string)

def sub_cipher(message,input_string):
    message=message.upper()
    out_put=""
    y=""
    for x in message:
        if x!=" ":
            y+=x
    for x in y:
        ind=ord(x)-ord('A')
        out_put+=input_string[ind]
    print("\nThe decrypted text is: "+out_put)

sub_cipher(plain_text,input_string)