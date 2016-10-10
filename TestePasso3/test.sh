#!/bin/bash
for i in rato hoje quando paz celofane calar gelo xerox; do
	python word2fst.py $i > w-$i.txt
	fstcompile --isymbols=syms.txt --osymbols=syms.txt w-$i.txt | fstarcsort > w-$i.fst
done

python compact2fst.py 3_c-s.txt > ugly-3_c-s.txt
python compact2fst.py 3_g-j.txt > ugly-3_g-j.txt
python compact2fst.py 3_h-0.txt > ugly-3_h-0.txt
python compact2fst.py 3_q-k.txt > ugly-3_q-k.txt
python compact2fst.py 3_r-4.txt > ugly-3_r-4.txt
python compact2fst.py 3_x-ks.txt > ugly-3_x-ks.txt
python compact2fst.py 3_z-s.txt > ugly-3_z-s.txt

fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-3_c-s.txt | fstarcsort > 3_c-s.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-3_g-j.txt | fstarcsort > 3_g-j.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-3_h-0.txt | fstarcsort > 3_h-0.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-3_q-k.txt | fstarcsort > 3_q-k.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-3_r-4.txt | fstarcsort > 3_r-4.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-3_x-ks.txt | fstarcsort > 3_x-ks.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-3_z-s.txt | fstarcsort > 3_z-s.fst

#geracao das palavras atraves de compose
#CELOFANE substituicao de C por S = SELOFANE
fstcompose w-celofane.fst 3_c-s.fst > selofane.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait selofane.fst | dot -Tpdf > selofane.pdf

#GELO substituicao de G por J = JELO
fstcompose w-gelo.fst 3_g-j.fst > jelo.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait jelo.fst | dot -Tpdf > jelo.pdf

#HOJE substituicao de H por EPS
fstcompose w-hoje.fst 3_h-0.fst > oje.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait oje.fst | dot -Tpdf > oje.pdf

#QUANDO substituicao de Q por K
fstcompose w-quando.fst 3_q-k.fst > kuando.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait kuando.fst | dot -Tpdf > kuando.pdf

#RATO substituicao de R por 4
fstcompose w-rato.fst 3_r-4.fst > 4ato.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait 4ato.fst | dot -Tpdf > 4ato.pdf

#XEROX substituicao de X (ultimo x) por KS
fstcompose w-xerox.fst 3_x-ks.fst > xeroks.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait xeroks.fst | dot -Tpdf > xeroks.pdf

#PAZ substituicao de Z por s
fstcompose w-paz.fst 3_z-s.fst > pas.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait pas.fst | dot -Tpdf > pas.pdf