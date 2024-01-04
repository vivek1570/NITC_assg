︠d906d255-4b72-41ee-b319-62d89bd5a019r︠
## shift_cipher crypt analysis

list_inverse=['E','T','A','O','I','N','S','H','R','D','L','C','U','M','W','F','G','Y','P','B','V','K','J','Q','X','Z']

cipher_text=raw_input("Enter the cipher text: ")

print("The cipher_text is: "+cipher_text)

gf=cipher_text.upper()
cipher_text=gf

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

print(list_my)

a=list_my[0][1]
key=(a-ord('E')-ord('A'))%26

print("The key is: ",key)

def shift_cipher(message,shift):
  out_put=""
  x=message.upper()
  y=""
  for char in x:
    if char!=" ":
      y+=char
  for char in y:
    out_put+=chr((ord(char)-ord('A')-shift)%26+ord('A'))
  print("Encrypted text is:  "+out_put)

shift_cipher(cipher_text,key)

# UVACLYFZLJBYL

︡6fdcc8fd-1985-41a5-b71d-902e47d7d83f︡{"raw_input":{"prompt":"Enter the cipher text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the cipher text: ","submitted":true,"value":"PUHOBNLTLAYVWVSPZAOLSPCPUNWHJLVMTPSSPVUZVMMVSRZPAZALLTZDPAOSPMLIBZASLZDPAOLEBILYHUALULYNFHUKLJOVLZDPAOJPAFZVBUKZFLAHTPKZAAOLYBZOHUKOBZASLVMKHPSFSPMLAOLYLZHWSHJLMVYWLHJLHUKZLYLUPAFJLUAYHSWHYRHUBYIHUVHZPZVMUHABYLZLYCLZHZHIYLHAOAHRPUNYLAYLHAPAZSBZONYLLULYFVMMLYZHCPCPKJVUAYHZAAVAOLJVUJYLALQBUNSLHAPUFLABUMVYNLAAHISLLZJHWLDOLYLVULJHUYLSHEIFAOLDHALYMLLKAOLKBJRZVYZAYVSSBUKLYAOLJHUVWFVMHUJPLUAAYLLZPAZHOPKKLUNLTPUAOLJPAFAOHAULCLYZSLLWZHDLSJVTLZVBYSHUKMYPLUKZHUKMHTPSPLZAOLPTTLUZLWHYRDPAOTHUPJBYLKNHYKLUZWVUKZHUKDPSKSPMLHIVBUKZWYVCPKPUNHWSHJLAVYLJOHYNLHOHCLUVMAYHUXBPSPAFDPAOHIHJRKYVWVUOVURPUNOVYUZHUKZPYLUZZVTLAOPUNMVYHUFVULZLHYJOPUNMVYHZHUJABHYFPUAOLTLAYVWVSPZ"}}︡{"stdout":"The cipher_text is: PUHOBNLTLAYVWVSPZAOLSPCPUNWHJLVMTPSSPVUZVMMVSRZPAZALLTZDPAOSPMLIBZASLZDPAOLEBILYHUALULYNFHUKLJOVLZDPAOJPAFZVBUKZFLAHTPKZAAOLYBZOHUKOBZASLVMKHPSFSPMLAOLYLZHWSHJLMVYWLHJLHUKZLYLUPAFJLUAYHSWHYRHUBYIHUVHZPZVMUHABYLZLYCLZHZHIYLHAOAHRPUNYLAYLHAPAZSBZONYLLULYFVMMLYZHCPCPKJVUAYHZAAVAOLJVUJYLALQBUNSLHAPUFLABUMVYNLAAHISLLZJHWLDOLYLVULJHUYLSHEIFAOLDHALYMLLKAOLKBJRZVYZAYVSSBUKLYAOLJHUVWFVMHUJPLUAAYLLZPAZHOPKKLUNLTPUAOLJPAFAOHAULCLYZSLLWZHDLSJVTLZVBYSHUKMYPLUKZHUKMHTPSPLZAOLPTTLUZLWHYRDPAOTHUPJBYLKNHYKLUZWVUKZHUKDPSKSPMLHIVBUKZWYVCPKPUNHWSHJLAVYLJOHYNLHOHCLUVMAYHUXBPSPAFDPAOHIHJRKYVWVUOVURPUNOVYUZHUKZPYLUZZVTLAOPUNMVYHUFVULZLHYJOPUNMVYHZHUJABHYFPUAOLTLAYVWVSPZ\n"}︡{"stdout":"[[86, 11], [57, 7], [54, 0], [54, 20], [46, 15], [46, 24], [45, 25], [39, 21], [30, 14], [27, 18], [24, 10], [22, 9], [19, 12], [18, 1], [14, 13], [14, 22], [13, 5], [12, 19], [9, 3], [8, 8], [7, 2], [7, 17], [2, 4], [1, 16], [1, 23], [0, 6]]\n"}︡{"stdout":"The key is:  7\n"}︡{"stdout":"Encrypted text is:  INAHUGEMETROPOLISTHELIVINGPACEOFMILLIONSOFFOLKSITSTEEMSWITHLIFEBUSTLESWITHEXUBERANTENERGYANDECHOESWITHCITYSOUNDSYETAMIDSTTHERUSHANDHUSTLEOFDAILYLIFETHERESAPLACEFORPEACEANDSERENITYCENTRALPARKANURBANOASISOFNATURESERVESASABREATHTAKINGRETREATITSLUSHGREENERYOFFERSAVIVIDCONTRASTTOTHECONCRETEJUNGLEATINYETUNFORGETTABLEESCAPEWHEREONECANRELAXBYTHEWATERFEEDTHEDUCKSORSTROLLUNDERTHECANOPYOFANCIENTTREESITSAHIDDENGEMINTHECITYTHATNEVERSLEEPSAWELCOMESOURLANDFRIENDSANDFAMILIESTHEIMMENSEPARKWITHMANICUREDGARDENSPONDSANDWILDLIFEABOUNDSPROVIDINGAPLACETORECHARGEAHAVENOFTRANQUILITYWITHABACKDROPONHONKINGHORNSANDSIRENSSOMETHINGFORANYONESEARCHINGFORASANCTUARYINTHEMETROPOLIS\n"}









