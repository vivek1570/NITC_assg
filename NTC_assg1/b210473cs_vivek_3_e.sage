plain_text=raw_input("Enter the message:")
print("The plain_text to be converted is:"+plain_text+"\n")
shift=raw_input("Enter the shift value:")
print("The shift value is"+shift+"\n")

x=int(shift)

def shift_cipher(message,shift):
  out_put=""
  x=message.upper()
  y=""
  for char in x:
    if char!=" ":
      y+=char
  for char in y:
    out_put+=chr((ord(char)-ord('A')+shift)%26+ord('A'))
  print("Encrypted text is:  "+out_put)

shift_cipher(plain_text,x)