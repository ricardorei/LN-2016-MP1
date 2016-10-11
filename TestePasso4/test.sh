#!/bin/bash
#geracao das palavras
for i in  aleluia carvalho rei; do
	python word2fst.py $i > w-$i.txt
	fstcompile --isymbols=syms.txt --osymbols=syms.txt w-$i.txt | fstarcsort > w-$i.fst
done

#geracao do passo 4
python compact2fst.py 4_vogais.txt > ugly-4_vogais.txt
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-4_vogais.txt | fstarcsort > passo4.fst

#teste das palavras
for i in  aleluia carvalho rei; do
	fstcompose w-$i.fst passo4.fst > $i.fst
	fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait $i.fst | dot -Tpdf > $i.pdf
done
