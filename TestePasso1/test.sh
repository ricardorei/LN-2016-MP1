#!/bin/bash
for i in asa exame extra; do
	python word2fst.py $i > w-$i.txt
	fstcompile --isymbols=syms.txt --osymbols=syms.txt w-$i.txt | fstarcsort > w-$i.fst
done

# Passo 1 #
python compact2fst.py 1_s-z.txt > ugly-1_s-z.txt
python compact2fst.py 1_x-s.txt > ugly-1_x-s.txt
python compact2fst.py 1_x-z.txt > ugly-1_x-z.txt

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