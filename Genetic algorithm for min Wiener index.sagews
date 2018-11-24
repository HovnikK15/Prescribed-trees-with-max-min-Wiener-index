︠d1a10654-45cd-49db-8209-2cccac3d7615s︠
import random

def nakljucni_graf(st_vozlisc, max_stopnja): #ustvarjamo naključne grafe z določenim številom vozlišč in max stopnjo
    zvezda = graphs.StarGraph(max_stopnja)
    i = max_stopnja
    while i < st_vozlisc:
        zvezda1 = Graph(zvezda)
        zvezda1.add_edge(random.randint(1, i), i + 1)
        if zvezda1.degree_sequence()[0] <= max_stopnja:
            zvezda = Graph(zvezda1)
            i = i + 1
    return zvezda

def zacetna_populacija(st_vozlisc, max_stopnja, stevilo_osebkov): #ustvari zacetno populacijo, ki jo bomo potem razvijali, da dobimo približek optimalnemu grafu
    zacetna_populacija = []
    i = 0
    while i < stevilo_osebkov:
        osebek = nakljucni_graf(st_vozlisc, max_stopnja)
        zacetna_populacija.append(osebek.to_dictionary())
        i = i + 1
    return zacetna_populacija

def fitness(seznam_dreves): #iscemo iskano optimalno lastnost, se pravi minimalen Wienerjev indeks
    index = 10000000000 #neko veliko število, da bojo naslednji indeksi zihr manjši
    for drevo in seznam_dreves:
        graf_drevesa = Graph(drevo)
        if graf_drevesa.wiener_index() < index:
            index = graf_drevesa.wiener_index()
            drevo_min_index = drevo
    return drevo_min_index

def mutate(drevo, verjetnost): #mutacija grafa (odstranimo listek in ga pripnemo drugam)
    kopija_drevo = Graph(drevo)
    listki = []
    if random.random() <= verjetnost:
        for i in range(0, len(kopija_drevo.degree())): #iščemo vse listke v grafu, katere lahko odstranimo
            if kopija_drevo.degree()[i] == 1:
                listki.append(i)
        izbrano_vozlisce_listka = random.choice(listki)
        kopija_drevo.delete_edge(izbrano_vozlisce_listka, kopija_drevo.neighbors(izbrano_vozlisce_listka)[0]) #izbrišemo naključen listek
        vozlisca_drevo = kopija_drevo.vertices()
        del vozlisca_drevo[izbrano_vozlisce_listka] #treba je izločit vozlišče, ki ga pripenjaš
        kopija_drevo.add_edge(izbrano_vozlisce_listka, random.choice(vozlisca_drevo)) #pripnemo listek drugemu vozlišču
        if kopija_drevo.degree_sequence()[0] == Graph(drevo).degree_sequence()[0]:
            return kopija_drevo.to_dictionary()
        else:
            return mutate(drevo, verjetnost)
    else:
        return drevo

def mutacije(drevo, verjetnost): # nepotrebna funkcija, uporabil sem jo le pri preverjanju, če naredim več mutacij, da res vedno pride različno (naključno)
    vse_mutacije = []
    for i in range(0, 100):
        vse_mutacije.append(mutate(drevo, verjetnost))
    return vse_mutacije

def crossover(drevo1, drevo2): #križanje dveh grafov, kjer dobimo ven dva nova (za naslednjo generacijo vzamemo le optimalnega)
    kopija_drevo1 = Graph(drevo1)
    kopija_drevo2 = Graph(drevo2)

    izbrano_vozlisce1 = random.randint(0, kopija_drevo1.order() - 1) #izberemo vozlišče kjer bomo razpolovili graf
    izbrano_vozlisce2 = random.randint(0, kopija_drevo2.order() - 1)
    sosed_vozlisca1 = random.choice(kopija_drevo1.neighbors(izbrano_vozlisce1)) #izberemo soseda vozlisca, kjer bomo razpolovili graf
    sosed_vozlisca2 = random.choice(kopija_drevo2.neighbors(izbrano_vozlisce2))

    kopija_drevo1.delete_edge(izbrano_vozlisce1, sosed_vozlisca1) #naključno odstranimo povezavo
    kopija_drevo2.delete_edge(izbrano_vozlisce2, sosed_vozlisca2)

    kopija_drevo1_a = kopija_drevo1.subgraph(kopija_drevo1.connected_component_containing_vertex(izbrano_vozlisce1)) #naredimo podgrafe
    kopija_drevo1_b = kopija_drevo1.subgraph(kopija_drevo1.connected_component_containing_vertex(sosed_vozlisca1))
    kopija_drevo2_a = kopija_drevo2.subgraph(kopija_drevo2.connected_component_containing_vertex(izbrano_vozlisce2))
    kopija_drevo2_b = kopija_drevo2.subgraph(kopija_drevo2.connected_component_containing_vertex(sosed_vozlisca2))

    novo_drevo1 = kopija_drevo1_a.disjoint_union(kopija_drevo2_b) #povezemo dva podgrafa v nov graf
    novo_drevo1.add_edge((0, izbrano_vozlisce1), (1, sosed_vozlisca2))
    novo_drevo1.relabel()

    novo_drevo2 = kopija_drevo2_a.disjoint_union(kopija_drevo1_b) #povezemo dva podgrafa v nov graf
    novo_drevo2.add_edge((0, izbrano_vozlisce2), (1, sosed_vozlisca1))
    novo_drevo2.relabel()

    if novo_drevo1.degree_sequence()[0] == novo_drevo2.degree_sequence()[0] and novo_drevo1.degree_sequence()[0] == Graph(drevo1).degree_sequence()[0] and novo_drevo1.order() == novo_drevo2.order():
        #preverimo, če se max stopnja in število vozlišč ohrani
        return [novo_drevo1.to_dictionary(), novo_drevo1.to_dictionary()]
    else:
        return crossover(drevo1, drevo2)

def nova_generacija(zacetna_generacija, verjetnost): #definira novo generacijo osebkov
    nova_generacija = []
    i = 0
    while i < len(zacetna_generacija):

        drevo1 = random.choice(zacetna_generacija)
        drevo2 = random.choice(zacetna_generacija)
        mutirano_drevo1 = mutate(drevo1, verjetnost)
        mutirano_drevo2 = mutate(drevo2, verjetnost)
        novi_drevesi = crossover(mutirano_drevo1, mutirano_drevo2)
        novo_drevo1 = novi_drevesi[0]
        novo_drevo2 = novi_drevesi[0]
        optimalno_drevo = fitness([novo_drevo1, novo_drevo2, mutirano_drevo1, mutirano_drevo2, drevo1, drevo2])
        
        nova_generacija.append(optimalno_drevo)

        i = i + 1

    return  nova_generacija

def simulacija(st_vozlisc, max_stopnja, stevilo_osebkov, stevilo_generacij, verjetnost): #požene program in išče graf z min wiener indeksom
    populacija = zacetna_populacija(st_vozlisc, max_stopnja, stevilo_osebkov)
    i = 0
    while i < stevilo_generacij:
        populacija = nova_generacija(populacija, verjetnost)
        i = i + 1
    return fitness(populacija), Graph(fitness(populacija)).wiener_index(), Graph(fitness(populacija)).show()

simulacija(50, 15, 100, 100, 0.05)
︡d034a30d-5c87-46f8-96e0-90e8f89a3543︡{"file":{"filename":"/home/user/.sage/temp/project-7876ec95-bf6e-4f85-982b-f53e8579fa5d/2848/tmp_CX3ppa.svg","show":true,"text":null,"uuid":"1b254e39-d8af-4300-9a10-1c2fac6a6a73"},"once":false}︡{"stdout":"({0: [40], 1: [36], 2: [33], 3: [40], 4: [29], 5: [32], 6: [34], 7: [29], 8: [29], 9: [31], 10: [13], 11: [37], 12: [33], 13: [10, 29], 14: [35], 15: [34], 16: [30], 17: [34], 18: [32], 19: [34], 20: [33], 21: [38], 22: [32], 23: [40], 24: [36], 25: [39], 26: [32], 27: [33], 28: [36], 29: [32, 33, 34, 35, 4, 36, 37, 38, 7, 39, 8, 40, 13, 30, 31], 30: [16, 29], 31: [9, 29, 45, 46], 32: [18, 5, 22, 26, 29], 33: [2, 20, 27, 12, 29], 34: [17, 19, 6, 41, 44, 29, 15, 47], 35: [29, 14], 36: [1, 49, 24, 28, 29], 37: [11, 29], 38: [21, 29], 39: [50, 25, 29], 40: [0, 3, 23, 42, 43, 29], 41: [34], 42: [40], 43: [40], 44: [34], 45: [31], 46: [31], 47: [48, 34], 48: [47], 49: [36], 50: [39]}, 4108, None)"}︡{"stdout":"\n"}︡{"done":true}︡









