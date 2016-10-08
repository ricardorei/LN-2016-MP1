#!/bin/bash

python compact2fst.py 1_s-z.txt > ugly-1_s-z.txt
python compact2fst.py 1_x-s.txt > ugly-1_x-s.txt
python compact2fst.py 1_x-z.txt > ugly-1_x-z.txt

# Passo 1 #
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-1_s-z.txt | fstarcsort > 1_s-z.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-1_x-s.txt | fstarcsort > 1_x-s.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-1_x-z.txt | fstarcsort > 1_x-z.fst

fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait 1_s-z.fst | dot -Tpdf > 1_s-z.pdf
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait 1_x-s.fst | dot -Tpdf > 1_x-s.pdf
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait 1_x-z.fst | dot -Tpdf > 1_x-z.pdf

fstcompose 1_s-z.fst 1_x-s.fst > 1_aux1.fst
fstcompose 1_aux1.fst 1_x-z.fst > passo1.fst 

fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait passo1.fst | dot -Tpdf > passo1.pdf

