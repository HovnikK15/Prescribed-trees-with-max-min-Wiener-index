︠7fbb3455-71d9-42a9-a05b-704331b1cfb1︠
t7 = graphs.trees(7)   #graf na 7 vozliščih
T = next(t7)  #to nevem ka je 
#T.order()  #Vrne število vozlišč

#T.degree_sequence() #vrne število povezav za posamezno vozlišče v padajočem vrstnem redu
#T.diameter() #Premer grafa - največja razdalja med dvema vozliščema (število povezav)
#T.wiener_index()
min_index = T.wiener_index()
max_index = T.wiener_index()
graf1 = T
graf2 = T
y1 = T.degree_sequence()
y11 = T.diameter()
y2 = T.degree_sequence()
y22 = T.diameter()
for T in t7:  #vsa možna drevesa našega grafa 
    P = T.plot()
    x = T.wiener_index()
    #print("padajoce zaporedje povezav:")
    #print( T.degree_sequence())
    #print("Premer grafa:")
    #print(T.diameter())
    #print("Wiener index:")
    #print(T.wiener_index())
    #P.show()
    #do tu nam zanka izpiše lastnosti za vsako možno drevo
    if min_index > x: #Zanima me drevo z najmanjšim Wiener indexom, ko ga najde, se to drevo shrani in se zapiše na koncu zanke
        min_index = x
        graf1 = T
        y1 = T.degree_sequence()
        y11 = T.diameter()
    if max_index < x:
        max_index = x
        graf2 = T
        y2 = T.degree_sequence()
        y22 = T.diameter()
print("Minimalni Wiener index:")
min_index
print("padajoce zaporedje povezav:")
y1
print("Premer grafa:")
y11
print("Graf:")
graf1.show()

print("Maksimalni Wiener index:")
max_index
print("padajoce zaporedje povezav:")
y2
print("Premer grafa:")
y22
print("Graf:")
graf2.show()

#Opazim, da je za grafe z minimalnim W. indexom značilno, da so zvezdaste oblike s središčem, pri čemer ima središče stopnjo n-1, vsa zunanja vozlišča pa stopnjo 1 
#medtemko je za grafe z maksimalnim W. indeksom značinlo, da gre za drevesa z zelo dolgo potjo, vsa notranja vozlišča pa imajo enako stopnjo = 2, zunanja pa 1 
︡95cfaae7-ee6d-485c-a5b4-f9a265df8f3c︡{"stdout":"Minimalni Wiener index:\n"}︡{"stdout":"36\n"}︡{"stdout":"padajoce zaporedje povezav:\n"}︡{"stdout":"[6, 1, 1, 1, 1, 1, 1]\n"}︡{"stdout":"Premer grafa:\n"}︡{"stdout":"2\n"}︡{"stdout":"Graf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_aPLP9Z.svg","show":true,"text":null,"uuid":"4124b2d6-222d-4ed0-97bd-c68e36b5589f"},"once":false}︡{"stdout":"Maksimalni Wiener index:\n"}︡{"stdout":"56\n"}︡{"stdout":"padajoce zaporedje povezav:\n"}︡{"stdout":"[2, 2, 2, 2, 2, 1, 1]\n"}︡{"stdout":"Premer grafa:\n"}︡{"stdout":"6\n"}︡{"stdout":"Graf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_ZCOZdU.svg","show":true,"text":null,"uuid":"ba245104-e352-45c3-8946-5988618c2e3c"},"once":false}︡{"done":true}︡
︠dca55ff0-2f58-4948-a717-0423d3a301fes︠
n = 10
for i in IntegerRange(2,n+1,1):#funkcija, ki mi izriše vse grafe, z min in max W. indeksom, ki imajo število vozlišč od 2 do n
    t = graphs.trees(i)
    T = next(t)
    min_index = T.wiener_index()
    max_index = T.wiener_index()
    graf1 = T
    graf2 = T
    st = T.order()
    y1 = T.degree_sequence()
    y11 = T.diameter()
    y2 = T.degree_sequence()
    y22 = T.diameter()
    for T in t:
        P = T.plot()
        x = T.wiener_index()
        if min_index > x:
            min_index = x
            graf1 = T
            y1 = T.degree_sequence()
            y11 = T.diameter()
            st = T.order()
            if max_index < x:
                max_index = x
                graf2 = T
                y2 = T.degree_sequence()
                y22 = T.diameter()
                st = T.order()
    print("število vozlišč:")
    st
    print("Minimalni Wiener index:")
    min_index
    print("padajoce zaporedje povezav:")
    y1
    print("Premer grafa:")
    y11
    print("Graf:")
    graf1.show()

    print("Maksimalen Wiener index:")
    max_index
    print("padajoce zaporedje povezav:")
    y2
    print("Premer grafa:")
    y22
    print("Graf:")
    graf2.show()


︡239a9d04-de94-4415-b4f7-f48a3973db05︡{"stdout":"število vozlišč:\n2\nMinimalni Wiener index:\n1\npadajoce zaporedje povezav:\n[1, 1]\nPremer grafa:\n1\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_ZMoIqr.svg","show":true,"text":null,"uuid":"3b4d59a4-4fb3-4545-9387-40276fbbefb0"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n1\npadajoce zaporedje povezav:\n[1, 1]\nPremer grafa:\n1\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_y3yylZ.svg","show":true,"text":null,"uuid":"25e90e2e-3229-4290-9195-5ef4ec5c44b1"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n3\nMinimalni Wiener index:\n4\npadajoce zaporedje povezav:\n[2, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_oLC6wB.svg","show":true,"text":null,"uuid":"2f1461ae-8770-488c-93d2-4d851ec4c3a7"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n4\npadajoce zaporedje povezav:\n[2, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_JexJaH.svg","show":true,"text":null,"uuid":"8f0644e8-a088-43ce-9ecf-d9087ce5209f"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n4\nMinimalni Wiener index:\n9\npadajoce zaporedje povezav:\n[3, 1, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_WkES6c.svg","show":true,"text":null,"uuid":"f750a9a2-0d93-4be5-8ba0-165dadf585a6"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n10\npadajoce zaporedje povezav:\n[2, 2, 1, 1]\nPremer grafa:\n3\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_DvYooe.svg","show":true,"text":null,"uuid":"d516d1d9-e500-4c70-937a-6eccf23d73c3"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n5\nMinimalni Wiener index:\n16\npadajoce zaporedje povezav:\n[4, 1, 1, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp__ArkXR.svg","show":true,"text":null,"uuid":"d34d7854-fa76-43e2-aee8-f29ba23e1176"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n20\npadajoce zaporedje povezav:\n[2, 2, 2, 1, 1]\nPremer grafa:\n4\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_UTsv1q.svg","show":true,"text":null,"uuid":"741b8068-61bb-4b7e-a302-b6fa91dc83bf"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n6\nMinimalni Wiener index:\n25\npadajoce zaporedje povezav:\n[5, 1, 1, 1, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_Xo9sky.svg","show":true,"text":null,"uuid":"730b0e94-06f7-4a23-ab1e-772f492a65e5"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n35\npadajoce zaporedje povezav:\n[2, 2, 2, 2, 1, 1]\nPremer grafa:\n5\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_wEroNe.svg","show":true,"text":null,"uuid":"a01a51e0-2a3a-4288-8ae2-ac8fec791ce6"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n7\nMinimalni Wiener index:\n36\npadajoce zaporedje povezav:\n[6, 1, 1, 1, 1, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_m7MTLX.svg","show":true,"text":null,"uuid":"2e7a4d96-c291-4a8c-b665-f8f869f5f394"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n56\npadajoce zaporedje povezav:\n[2, 2, 2, 2, 2, 1, 1]\nPremer grafa:\n6\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_38X6fK.svg","show":true,"text":null,"uuid":"97fa0b6c-c8f7-4ad3-93ed-83efac839ba9"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n8\nMinimalni Wiener index:\n49\npadajoce zaporedje povezav:\n[7, 1, 1, 1, 1, 1, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_k7XRel.svg","show":true,"text":null,"uuid":"3201ff61-a31c-48d6-858d-8aad92fcc51d"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n84\npadajoce zaporedje povezav:\n[2, 2, 2, 2, 2, 2, 1, 1]\nPremer grafa:\n7\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_UPRfcf.svg","show":true,"text":null,"uuid":"4e7eafed-4d7e-44db-87bc-6289d59c8cec"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n9\nMinimalni Wiener index:\n64\npadajoce zaporedje povezav:\n[8, 1, 1, 1, 1, 1, 1, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_A__7_s.svg","show":true,"text":null,"uuid":"4e823eac-b623-4692-831d-e7082c092945"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n120\npadajoce zaporedje povezav:\n[2, 2, 2, 2, 2, 2, 2, 1, 1]\nPremer grafa:\n8\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_39QO4M.svg","show":true,"text":null,"uuid":"af737b69-2139-4572-b5f0-d5707f8ea572"},"once":false}︡{"stdout":"število vozlišč:"}︡{"stdout":"\n10\nMinimalni Wiener index:\n81\npadajoce zaporedje povezav:\n[9, 1, 1, 1, 1, 1, 1, 1, 1, 1]\nPremer grafa:\n2\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_ngGTZ3.svg","show":true,"text":null,"uuid":"df3313c9-fb96-4438-982d-531ec31d7b10"},"once":false}︡{"stdout":"Maksimalen Wiener index:"}︡{"stdout":"\n165\npadajoce zaporedje povezav:\n[2, 2, 2, 2, 2, 2, 2, 2, 1, 1]\nPremer grafa:\n9\nGraf:\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/128/tmp_LCUcEf.svg","show":true,"text":null,"uuid":"694ec402-22e7-4cb6-a19e-7a295d9742f4"},"once":false}︡{"done":true}︡
︠c9891629-043a-465f-ba93-b1bf439d560a︠









