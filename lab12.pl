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

%3

digitDeg(0,0):- !.
digitDeg(A,X):- A1 is A div 10,digitDeg(A1,X1),X is X1 +1.

solve13(N,X):-digitDeg(N,L),1 is L,!,solve13(N,X,0).
solve13(0,XX,XX):-!.
solve13(N,X,SUM):-N1 is N-1, !, pow(10, N1, Y),
    NEWSUM is (N*Y+SUM), solve13(N1,X,NEWSUM).

%4
lenght([],0).
lenght([_|Tail],X) :- lenght(Tail,V), X is V + 1.
concat([],B,B):-!.
concat([H|T],B,[H|Tail]):- concat(T,B,Tail).
%5
listMin([],X,Z) :- X is Z.
listMin([H|T],X,Z) :- 
    NewZ is min(H,Z),
    listMin(T,X,NewZ).
listMin([H|T],X) :- listMin([H|T],X,H).

revList([],Dest,Source):-Dest = Source.
revList([H|T],Dest,Source):-
    revList(T,Dest,[H|Source]).
revList(List,RevList):-revList(List, RevList, []).

countDigits([],_,0):-!.
countDigits([H|T],X,C):- H is X,!,
    countDigits(T,X,C1),C is C1 +1.
countDigits([_|T],X,C):- countDigits(T,X,C).

countDigitsInInt(_,_,X,B,A,B):- X is 0,!.
countDigitsInInt([H|T],X,C,Ind,A,B):- H is X, Ind>A , Ind<B,Ind1 is Ind+1,!,
    countDigitsInInt(T,X,C1,Ind1,A,B),C is C1 +1.
countDigitsInInt([_|T],X,C,Ind,A,B):- Ind1 is Ind+1, countDigitsInInt(T,X,C,Ind1,A,B).

solve15([H|_],[],Min,Count):- Count is 1, H is Min,!.
solve15([H|T],[H|Tn],Min,Count):-H is Min,!,
    Count1 is Count-1, solve15(T,Tn,Min,Count1).
solve15([H|T],[H|Tn],Min,Count):-solve15(T,Tn,Min,Count).
solve15(List,Newlist):-listMin(List,Min),countDigits(List,Min,Count),solve15(List,Newlist,Min,Count).

%7
countMinInInt(List,A,B,X):-listMin(List,Min),countDigitsInInt(List,Min,X,0,A,B).

%8
listMax2([],X,Y,Z,Z2) :- Y is Z2, X is Z.
listMax2([H|T],X,Y,Z,Z2) :- 
    NewZ is max(H, Z),
    NewZ2 is Z,
    listMax2(T,X,Y,NewZ,NewZ2).
listMax2([H|T],X,Y) :- listMax2([H|T],X,Y,H,H).
%9
solve19([],0):-!.
solve19([H|T],X):-0 is H mod 2,!,
    solve19(T,X1), X is X1+1.
solve19([_|T],Count):-solve19(T,Count).