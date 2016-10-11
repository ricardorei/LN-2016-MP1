#!/bin/bash
for i in acho galho ganho carro massa carvalho rei; do
	python word2fst.py $i > w-$i.txt
	fstcompile --isymbols=syms.txt --osymbols=syms.txt w-$i.txt | fstarcsort > w-$i.fst
done
# Passo 2 #
python compact2fst.py 2_ch-x.txt > ugly-2_ch-x.txt
python compact2fst.py 2_lh-2.txt > ugly-2_lh-2.txt
python compact2fst.py 2_nh-3.txt > ugly-2_nh-3.txt
python compact2fst.py 2_rr-4.txt > ugly-2_rr-4.txt
python compact2fst.py 2_ss-s.txt > ugly-2_ss-s.txt

fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-2_ch-x.txt | fstarcsort > 2_ch-x.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-2_lh-2.txt | fstarcsort > 2_lh-2.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-2_nh-3.txt | fstarcsort > 2_nh-3.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-2_rr-4.txt | fstarcsort > 2_rr-4.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-2_ss-s.txt | fstarcsort > 2_ss-s.fst

#geracao das palavras atraves de compose
#ACHO substituicao de CH por X = AXO
fstcompose w-acho.fst 2_ch-x.fst > axo.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait axo.fst | dot -Tpdf > axo.pdf
#GALHO substituicao de LH por 2
fstcompose w-galho.fst 2_lh-2.fst > ga2o.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait ga2o.fst | dot -Tpdf > ga2o.pdf
#GANHO substituicao de NH por 3
fstcompose w-ganho.fst 2_nh-3.fst > ga3o.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait ga3o.fst | dot -Tpdf > ga3o.pdf
#CARRO substituicao de RR por 4
fstcompose w-carro.fst 2_rr-4.fst > ca4o.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait ca4o.fst | dot -Tpdf > ca4o.pdf
#MASSA substituicao de SS por S
fstcompose w-massa.fst 2_ss-s.fst > masa.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait masa.fst | dot -Tpdf > masa.pdf

#compose passo 2
fstcompose 2_ch-x.fst 2_lh-2.fst > 2_aux1.fst
fstcompose 2_aux1.fst 2_nh-3.fst > 2_aux2.fst
fstcompose 2_aux2.fst 2_rr-4.fst > 2_aux3.fst
fstcompose 2_aux3.fst 2_ss-s.fst > passo2.fst

#Teste ao passo 2 completo para os apelidos REI e CARVALHO
for i in carvalho rei; do
	fstcompose w-$i.fst passo2.fst > $i.fst
	fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait $i.fst | dot -Tpdf > $i.pdf
done 
