#!/bin/bash
for i in  aleluia carvalho rei; do
	python word2fst.py $i > w-$i.txt
	fstcompile --isymbols=syms.txt --osymbols=syms.txt w-$i.txt | fstarcsort > w-$i.fst
done

python compact2fst.py 4_vogais.txt > ugly-4_vogais.txt
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-4_vogais.txt | fstarcsort > passo4.fst

#geracao das palavras atraves de compose

#ALELUI substituicao de VOGAIS (excepto a primeira) por EPS = ALL
fstcompose w-aleluia.fst passo4.fst > all.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait all.fst | dot -Tpdf > all.pdf

fstcompose w-carvalho.fst passo4.fst > carvalho.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait carvalho.fst | dot -Tpdf > carvalho.pdf

fstcompose w-rei.fst passo4.fst > rei.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait rei.fst | dot -Tpdf > rei.pdf
