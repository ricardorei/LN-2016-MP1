python word2fst.py aleluia > w-aleluia.txt
fstcompile --isymbols=syms.txt --osymbols=syms.txt w-aleluia.txt | fstarcsort > w-aleluia.fst

python compact2fst.py 4_vogais.txt > ugly-4_vogais.txt
fstcompile --isymbols=syms.txt --osymbols=syms.txt ugly-4_vogais.txt | fstarcsort > passo4.fst

#geracao das palavras atraves de compose

#ALELUI substituicao de VOGAIS (excepto a primeira) por EPS = ALL
fstcompose w-aleluia.fst passo4.fst > all.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt -portrait all.fst | dot -Tpdf > all.pdf
