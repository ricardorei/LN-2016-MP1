#!/bin/bash
#criacao dos fsts referentes as palavras aleluia, karva2o e 4ei
for i in  aleluia karva2o 4ei; do
	python word2fst.py $i > w-$i.txt
	fstcompile --isymbols=syms.txt --osymbols=syms.txt w-$i.txt | fstarcsort > w-$i.fst
done

###################################  passo 4 ##################################################
#geracao do passo 4
python compact2fst.py 4_vogais.txt > ugly-4_vogais.txt
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-4_vogais.txt | fstarcsort > passo4.fst

#teste das palavras aleluia karva2o 4ei
#NOTA: as palavras carvalho e rei vem no formato devolvido apos correr os passos 1, 2 e 3, ou seja
#		karva2o e 4ei
for i in aleluia karva2o 4ei; do
	fstcompose w-$i.fst passo4.fst | fstproject --project_output | fstrmepsilon > $i.fst
	fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait $i.fst | dot -Tpdf > $i.pdf
done
