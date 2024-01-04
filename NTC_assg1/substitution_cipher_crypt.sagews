︠122b79e7-7a75-4650-9edd-fccfb974a4c5︠
## substitution cipher crypt analysis using stastical attack

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

for i in range(26):
    mapp[chr(ord('A')+list_my[i][1])]=list_inverse[i]

plain_text=""
for x in cipher_text:
    plain_text+=mapp[x]

print("The result after crypt analysis: "+plain_text)




︡ba87c462-c258-4ba3-98e8-04324c6942be︡{"raw_input":{"prompt":"Enter the cipher text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the cipher text: ","submitted":true,"value":"kioybppsxmdbpgoqwtoplbpexxpbnzxjzgxsdeelpjtkptspsxoeijeqoqwpekoqbtjnnxxbsjzbnoggropspsxkejikjnnexbsglmexrxytjnnxxnkqygkdwspxextsjxbnejiqxkemltknxbjqpsxzkeamxqtsnkqxgyxegltjdzgxbskexbbpjeoxbjnpsxoeljdpsnpsxoegjvxxqydeoqwgoaxpsxbxkbjqbtsogyexqektxpsejdwspsxzgklwejdqynpsxoegkdwspxekblizsjqljnujloqpsxsxkepjnpsxnjexbpnmoeybjqwnoggbpsxkoekbbdqgowspnogpxebpsejdwspsxgxkvxbpsxeovxeixkqyxebzxktxndgglnexngxtpoqwpsxkfdexbalsoaxebximkeajqkujdeqxlpsejdwsedwwxypxeekoqnbxxaoqwpsxmxkdpljndqpjdtsxyrogyxeqxbb"}}︡{"stdout":"The cipher_text is: kioybppsxmdbpgoqwtoplbpexxpbnzxjzgxsdeelpjtkptspsxoeijeqoqwpekoqbtjnnxxbsjzbnoggropspsxkejikjnnexbsglmexrxytjnnxxnkqygkdwspxextsjxbnejiqxkemltknxbjqpsxzkeamxqtsnkqxgyxegltjdzgxbskexbbpjeoxbjnpsxoeljdpsnpsxoegjvxxqydeoqwgoaxpsxbxkbjqbtsogyexqektxpsejdwspsxzgklwejdqynpsxoegkdwspxekblizsjqljnujloqpsxsxkepjnpsxnjexbpnmoeybjqwnoggbpsxkoekbbdqgowspnogpxebpsejdwspsxgxkvxbpsxeovxeixkqyxebzxktxndgglnexngxtpoqwpsxkfdexbalsoaxebximkeajqkujdeqxlpsejdwsedwwxypxeekoqnbxxaoqwpsxmxkdpljndqpjdtsxyrogyxeqxbb\n"}︡{"stdout":"The result after crypt analysis: SYHFIAAOEPCIALHDUWHAMIATEEAIRGENGLEOCTTMANWSAWOAOEHTYNTDHDUATSHDIWNRREEIONGIRHLLVHAOAOESTNYSNRRTEIOLMPTEVEFWNRREERSDFLSCUOAETEWONEIRTNYDESTPMWSREINDAOEGSTBPEDWORSDELFETLMWNCGLEIOSTEIIANTHEINRAOEHTMNCAORAOEHTLNKEEDFCTHDULHBEAOEIESINDIWOHLFTEDTSWEAOTNCUOAOEGLSMUTNCDFRAOEHTLSCUOAETSIMYGONDMNRJNMHDAOEOESTANRAOERNTEIARPHTFINDURHLLIAOESHTSIICDLHUOARHLAETIAOTNCUOAOELESKEIAOETHKETYESDFETIGESWERCLLMRTERLEWAHDUAOESQCTEIBMOHBETIEYPSTBNDSJNCTDEMAOTNCUOTCUUEFAETTSHDRIEEBHDUAOEPESCAMNRCDANCWOEFVHLFETDEII\n"}︡{"done":true}
︠430fe407-e09a-49dd-adad-63ee0193677cs︠


## we can do the known plain text attack
# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# input_string = 'kmtyxnwsouagiqjzhebpdvrclf'
# sxggjsxexrxwj
# hello here we go

plain_text=raw_input("Enter the known plain text: ")
cipher_text=raw_input("Enter the known cipher text: ")

print("The known plain text is: "+plain_text)
print("The known cipher text is: "+cipher_text)

text=raw_input("Enter the text to be decrypted: ")

print("The text to be decrypted is : "+text)

mapp={}
for i in range(len(plain_text)):
    mapp[cipher_text[i]]=plain_text[i]


plain_text=""
for x in text:
    plain_text+=mapp[x]

print("The result after crypt analysis: "+plain_text)



︡cbed0d4a-cee6-4b0c-a493-9644705e6440︡{"raw_input":{"prompt":"Enter the known plain text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the known plain text: ","submitted":true,"value":"abcdefghijklmnopqrstuvwxyz"}}︡{"raw_input":{"prompt":"Enter the known cipher text: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the known cipher text: ","submitted":true,"value":"kmtyxnwsouagiqjzhebpdvrclf"}}︡{"stdout":"The known plain text is: abcdefghijklmnopqrstuvwxyz\n"}︡{"stdout":"The known cipher text is: kmtyxnwsouagiqjzhebpdvrclf\n"}︡{"raw_input":{"prompt":"Enter the text to be decrypted: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the text to be decrypted: ","submitted":true,"value":"kioybppsxmdbpgoqwtoplbpexxpbnzxjzgxsdeelpjtkptspsxoeijeqoqwpekoqbtjnnxxbsjzbnoggropspsxkejikjnnexbsglmexrxytjnnxxnkqygkdwspxextsjxbnejiqxkemltknxbjqpsxzkeamxqtsnkqxgyxegltjdzgxbskexbbpjeoxbjnpsxoeljdpsnpsxoegjvxxqydeoqwgoaxpsxbxkbjqbtsogyexqektxpsejdwspsxzgklwejdqynpsxoegkdwspxekblizsjqljnujloqpsxsxkepjnpsxnjexbpnmoeybjqwnoggbpsxkoekbbdqgowspnogpxebpsejdwspsxgxkvxbpsxeovxeixkqyxebzxktxndgglnexngxtpoqwpsxkfdexbalsoaxebximkeajqkujdeqxlpsejdwsedwwxypxeekoqnbxxaoqwpsxmxkdpljndqpjdtsxyrogyxeqxbb"}}︡{"stdout":"The text to be decrypted is : kioybppsxmdbpgoqwtoplbpexxpbnzxjzgxsdeelpjtkptspsxoeijeqoqwpekoqbtjnnxxbsjzbnoggropspsxkejikjnnexbsglmexrxytjnnxxnkqygkdwspxextsjxbnejiqxkemltknxbjqpsxzkeamxqtsnkqxgyxegltjdzgxbskexbbpjeoxbjnpsxoeljdpsnpsxoegjvxxqydeoqwgoaxpsxbxkbjqbtsogyexqektxpsejdwspsxzgklwejdqynpsxoegkdwspxekblizsjqljnujloqpsxsxkepjnpsxnjexbpnmoeybjqwnoggbpsxkoekbbdqgowspnogpxebpsejdwspsxgxkvxbpsxeovxeixkqyxebzxktxndgglnexngxtpoqwpsxkfdexbalsoaxebximkeajqkujdeqxlpsejdwsedwwxypxeekoqnbxxaoqwpsxmxkdpljndqpjdtsxyrogyxeqxbb\n"}︡{"stdout":"The result after crypt analysis: amidstthebustlingcitystreetsfpeoplehurrytocatchtheirmorningtrainscoffeeshopsfillwiththearomaoffreshlybrewedcoffeefandlaughterechoesfromnearbycafesontheparkbenchfanelderlycouplesharesstoriesoftheiryouthftheirloveenduringliketheseasonschildrenracethroughtheplaygroundftheirlaughterasymphonyofjoyintheheartoftheforestfbirdsongfillstheairassunlightfiltersthroughtheleavestherivermeanderspeacefullyfreflectingtheazureskyhikersembarkonajourneythroughruggedterrainfseekingthebeautyofuntouchedwilderness\n"}︡{"done":true}









