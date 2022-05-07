%1.1
%nod(+A,+B,?C)
nod(A,0,A) :-!.
nod(A,0,_):-!,fail.
nod(A,B,C):- Ost is A mod B, nod(B,Ost,C).

kolvo_vp_del(N,Count):- rec1(N,1,Count).
rec1(N,I,0):-I is N+1,!.
rec1(N,I,Count):-0 is I mod 2,not(nod(N,I,1)), I1 is I+1,rec1(N,I1,Count1), Count is Count1+1,!;
    I1 is I+1, rec1(N,I1,Count),!.
