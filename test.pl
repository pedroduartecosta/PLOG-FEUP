homem(rui).
homem(andre).
mulher(peixe).
mulher(quina).

pai(rui,peixe).
pai(andre,rui).

mae(peixe,rui). %mae(Mae,Filho)
mae(peixe,quina).

pai(p):-pai(p,_).

filho(F,X):-homem(F),pai(X,F).
filho(F,X):-homem(F),mae(X,F).

filha(Fa,X):-mulher(Fa),pai(X,Fa).
filha(Fa,M):-mulher(Fa),mae(M,Fa).

irmao(I1,I2):-homem(I1),pai(P,I1),pai(P,I2),I1\=I2.
irmao(I1,I2):-homem(I1),mae(M,I1),mae(M,I2),I1\=I2.

irma(I1,I2):-mulher(I1),pai(P,I1),pai(P,I2),I1\=I2.
irma(I1,I2):-mulher(I1),mae(M,I1),mae(M,I2),I1\=I2.

meioirmao(I1,I2):-homem(I1),pai(P1,I1),pai(P2,I2),mae(M,I1),mae(M,I2),P2\=P1.
meioirmao(I1,I2):-homem(I1),pai(P,I1),pai(P,I2),mae(M1,I1),mae(M2,I2),M2\=M1.

meioirma(Ia1,I2):-homem(Ia1),pai(P1,Ia1),pai(P2,I2),mae(M,Ia1),mae(M,I2),P2\=P1.
meioirma(Ia1,I2):-homem(Ia1),pai(P,Ia1),pai(P,I2),mae(M1,Ia1),mae(M2,I2),M2\=M1.
