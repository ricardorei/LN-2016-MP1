# LN-2016
1ª Parte Projecto de Lingua Natural - Professora Luisa Coheur

## Descrição:
  O projecto consistia na realização de um algoritmo fonético (estilo soundex). Como tal foram definidos diferentes trandutores
que implementam diferentes passos e que através de ferramentas de Composição vão originar o algoritmo final pretendido.

## Software necessário:
- http://www.graphviz.org/
- http://www.openfst.org/twiki/bin/view/FST/FstDownload

## Algoritmo:
  #### 1º passo:
  
  S → Z se entre vogais (ex: asa → aza);
  
  X → Z se precedido de "E" (que está no início de palavra) e seguido de uma vogal (ex: exame → ezame);
  
  X → S se precedido de "E" (que está no início de palavra) e seguido de uma consoante (ex: extra → estra);

  #### 2º passo:
  
  CH → X (ex: acho → axo);
  
  LH → 2 (ex: galho → ga2o);
  
  NH → 3 (ex: ganho → ga3o);
  
  RR → 4 (ex: carro → ca4o);
  
  SS → S (ex: massa → masa);

  #### 3º passo:
  
  R → 4 se no início da palavra (ex: rato → 4ato);
  
  H → ∅ (ex: hoje → oje);
  
  Q → K (ex: quanto → kuanto);
  
  Z → S se no fim da palavra ( ex: paz → pas);
  
  C→ S se seguido de "E" ou "I" (ex: celofane → selofane)
      K caso contrário (ex: calar → kalar);
  
  G→ J se seguido de "E" ou "I" (ex: gelo → jelo)
    K caso contrário (ex: galo → kalo);
  
  X → KS se no fim da palavra (ex: xerox → xeroks);
  
  #### 4º passo:
  
  Elimina todas as vogais que não se encontram no início da palavra (ex: aleluia→ all).
  
## Run:
Para correr existe um scrip run.sh que cria os ficheiros necessários. O scrip clean.sh limpa esses ficheiros.

