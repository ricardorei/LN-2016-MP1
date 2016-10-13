# LN-2016
1ª Parte Projecto de Lingua Natural - Professora Luisa Coheur

##Descrição:
  O projecto consistia na realização de um algoritmo fonético (estilo soundex). Como tal foram definidos diferentes trandutores
que implementam diferentes passos e que através de ferramentas de Composição vão originar o algoritmo final pretendido.

##Software necessario:
- http://www.graphviz.org/
- http://www.openfst.org/twiki/bin/view/FST/FstDownload

##Algoritmo:
  1º passo
  S → Z se entre vogais (ex: asa → aza)
  X → Z se precedido de "E" (que está no início de palavra) e seguido de uma vogal (ex: exame →
  ezame)
  X → S se precedido de "E" (que está no início de palavra) e seguido de uma consoante (ex: extra → estra)

  2º passo
  CH → X LH → 2 NH → 3 RR → 4 SS → S

  3º passo
  R → 4 H →∅
  (ex: acho → axo) (ex: galho → ga2o) (ex: ganho → ga3o) (ex: carro → ca4o) (ex: massa → masa)
  se no início da palavra (ex: rato → 4ato) (ex:hoje→oje)
  Q→K Z →S C→ S
  K G→ J K
  X → KS
  (ex: quanto → kuanto) senofimdapalavra(ex:paz→pas)
  se seguido de "E" ou "I" (ex: celofane → selofane) caso contrário (ex: calar → kalar)
  se seguido de "E" ou "I" (ex: gelo → jelo)
  caso contrário (ex: galo → kalo)
  se no fim da palavra (ex: xerox → xeroks)

  4º passo:
  Elimina todas as vogais que não se encontram no início da palavra (ex: aleluia→ all).

