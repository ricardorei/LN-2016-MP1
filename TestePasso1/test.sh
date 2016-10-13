#!/bin/bash
#criacao dos fsts referentes as palavras asa, exame, extra, carvalho e rei
for i in asa exame extra carvalho rei; do
	python word2fst.py $i > w-$i.txt
	fstcompile --isymbols=syms.txt --osymbols=syms.txt w-$i.txt | fstarcsort > w-$i.fst
done

###################################  passo 1 #################################################
#passagem do passo 1 para forma fst
python compact2fst.py 1_s-z.txt > ugly-1_s-z.txt
python compact2fst.py 1_x-s.txt > ugly-1_x-s.txt
python compact2fst.py 1_x-z.txt > ugly-1_x-z.txt

#compilacao dos mini passos para formato fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-1_s-z.txt | fstarcsort > 1_s-z.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-1_x-s.txt | fstarcsort > 1_x-s.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-1_x-z.txt | fstarcsort > 1_x-z.fst

#geracao das palavras atraves de compose
#ASA substituicao de S por Z = AZA
fstcompose w-asa.fst 1_s-z.fst > aza.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait aza.fst | dot -Tpdf > aza.pdf
#EXAME substituicao de X por Z = EZAME
fstcompose w-exame.fst 1_x-z.fst > ezame.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait ezame.fst | dot -Tpdf > ezame.pdf
#EXTRA substituicao de X por S = ESTRA
fstcompose w-extra.fst 1_x-s.fst > estra.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait estra.fst | dot -Tpdf > estra.pdf

#composicao do passo 1
fstcompose 1_s-z.fst 1_x-s.fst > 1_aux1.fst
fstcompose 1_aux1.fst 1_x-z.fst > passo1.fst 

#Teste para os nomes carvalho e rei
for i in carvalho rei; do
	fstcompose w-$i.fst passo1.fst > $i.fst
	fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait $i.fst | dot -Tpdf > $i.pdf
done 