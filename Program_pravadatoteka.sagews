︠904dd802-a748-48f5-b38e-619ef0b1e4e9︠
#Funkcija DREVESA nam izpiše seznam vseh dreves s številom vozlišč 'n'
︠3f57882c-e2f9-4f11-927f-ada3c02931f1s︠
def drevesa(n): # drevesa na n vozliščih
    t = graphs.trees(n)
    T= next(t)
    k= []
    k.append(T.edges())  #to je treba zato, ker naslednja funkcija deluje za vsako nasledno drevo in če tega ne naredimo, potem eno možnost izpustimo
    for T in t:
        m = T.edges()
        k.append(m)

    return k

#Funkcija, ki mi izriše vsa drevesa  (nepotrebna)
def graf_drevesa(n):
    k = drevesa(n)
    for i in range(len(k)):
        H = Graph(k[i])
        H.show()

#Funkcija, ki mi izpiše slovarje dreves in njihovih premerov
def drevesa_polmer(n):
    L = []
    k = drevesa(n)
    for i in range(len(k)):
        premer1 = Graph(k[i]).diameter()
        L.append([premer1, k[i]])
    from collections import defaultdict   #to je neka funkcija, ki mi iz seznama l generira slovar d
    #primer: l=[ [1, 'A'], [1, 'B'], [2, 'C'] ] ---> d = { 1:('A', 'B'), 2:('C',) }
    #v našem primeru nam generira slovar, kjer so ključi premeri drevesa, vrednosti pa so drevesa s tem premerom
    d1 = defaultdict(list)
    for l, v in L:
        d1[l].append(v)
    d = dict((l, tuple(v)) for l, v in d1.iteritems())
    return d

def graf_drevesa_polmer(n): #Funkcija, ki mi izriše vsa drevesa iz prejšnjega slovarja
    d = drevesa_polmer(n)
    for j in range(len(d)):
        m = d.keys()[j]   #d[2] nam vrne vrednosti od ključa 2
        print 'drevesa s premerom', m
        for i in range(len(d[m])):
            print Graph(d[m][0]).wiener_index() #da nam izpiše W. indexse za vse premere
            Graph(d[m][i]).show()



def max_Weinerindex(n,N): #zanima nas max W. index za drevesa s fiksnim polmerom 'N'. Premer mora biti manjši od števila vozlišč
    d = drevesa_polmer(n)
    x = []
    for i in range(len(d[N])):
        x.append(Graph(d[N][i]).wiener_index())
    print 'drevesa,  na ', n, 'vozliščih, s premerom', N, 'imajo maksimalni Wiener index:', max(x)
    for i in range(len(x)):
        if x[i] == max(x):
            Graph(d[N][i]).show()

def vsa_drevesa_do(n):  #funkcija, ki za vsa vozlišča do 'n' izpiše vsa drevesa z max w. indexom za vse premere
    for i in IntegerRange(2,n+1,1):
        d = drevesa_polmer(i)
        m = d.keys()
        x = []
        for j in range(len(m)):
            N = m[j]
            x = []
            for p in range(len(d[N])):
                x.append(Graph(d[N][p]).wiener_index())
                print 'drevesa,  na ', i, 'vozliščih, s premerom', N, 'imajo maksimalni Wiener index:', max(x)
                for l in range(len(x)):
                    if x[l] == max(x):
                        Graph(d[N][l]).show()

def vsa_z_max_stopnjo(n):  #iščemo minimalni W. index dreves z max stopnjo nekega vozlišča
    #ubistvo so drevesa z minimalnem w. indeksom ravno tista, ki imajo max stopnjo vozlišča. Izgledajo kot zvezda
    for i in IntegerRange(n,n+1,1):
            k = drevesa(i) #Min W. index nas zanima za drevesa s fiksno maksimalno stopnjo
            zaporedje = []
            for j in range(len(k)):
                zaporedje.append(Graph(k[j]).degree_sequence())
                #print 'w.index', Graph(k[j]).wiener_index()  #če bi hotel, da mi izpiše vse w. indexe za ta drevesa
            #print 'drevesa, na', i, 'vozliščih, imajo zaporedje:',zaporedje
            for l in range(len(zaporedje)):
                if zaporedje[l] == max(zaporedje):
                    zap = Graph(k[l]).degree_sequence()
                    w = Graph(k[l]).wiener_index()
                    print 'drevesa, na', i, 'vozliščih, imajo max zaporedje:',zap,' ter minimalni Wiener index:', w
                    Graph(k[l]).show()
︡5c61e51a-57d3-4371-a662-fa3cbc642552︡{"done":true}︡
︠523f156f-7af7-48cc-afca-7b9cbe682e13︠









