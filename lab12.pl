%1.1
%nod(+A,+B,?C)
nod(A,0,A) :-!.
nod(A,0,_):-!,fail.
nod(A,B,C):- Ost is A mod B, nod(B,Ost,C).

kolvo_vp_del(N,Count):- rec1(N,1,Count).
rec1(N,I,0):-I is N+1,!.
rec1(N,I,Count):-0 is I mod 2,not(nod(N,I,1)), I1 is I+1,rec1(N,I1,Count1), Count is Count1+1,!;
    I1 is I+1, rec1(N,I1,Count),!.
%1.2
kolvo_vp_delD(N,Count):-rec2(N,Count,N,0).
rec2(N,R,0,R):-!.
rec2(N,Count,I,R):- I1 is I-1,(0 is I mod 2,not(nod(N,I,1)),R1 is R+1,rec2(N,Count,I1,R1),!;rec2(N,Count,I1,R)),!.
%2
sumLess5(0,0):-!.
sumLess5(A,Sum):-(A mod 10)<5,!,
    A1 is A div 10,S is (A mod 10),sumLess5(A1,Sum1),Sum is Sum1+S.
sumLess5(A,Sum):-A1 is A div 10, sumLess5(A1,Sum).

minDel(_,_,0):-!.
minDel(A,Del,I):- 0 is A mod I,!,
    Del is I, minDel(A,Del,0).
minDel(A,Del,I):- I1 is I +1, minDel(A,Del,I1).
minDel(1,1):-!.
minDel(0,1):-!.
minDel(A,Del):- minDel(A,Del,2).

findNum(_,_,_,1):-!,fail.
findNum(A,X,Del,I):- not(nod(A,I,1)),not(0 is (I mod Del)),!,
    X is I.
findNum(A,X,Del,I):- I1 is I - 1, findNum(A,X,Del,I1).
findNum(A,X):- minDel(A,Del),I is A - 1,findNum(A,X1,Del,I),sumLess5(A,Y),X is X1 * Y.

