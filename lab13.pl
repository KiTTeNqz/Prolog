:- ['lab12'].
del_el([],_,[]):-!.
del_el([El|Tail],El,NewList) :- del_el(Tail,El,NewList),!.
del_el([H|Tail],El,[H|NewTail]) :- del_el(Tail,El,NewTail).

listExclude([El|T],El,T).
listExclude([H|T],El,[H|Tail]):-listExclude(T,El,Tail).

in_list(El,[El|_]):-!.
in_list(El,[_|Tail]) :- in_list(El,Tail).

contains([El|_],El).
contains([_|T],El):-contains(T,El).

%1(40)
isEvenInList([H|T]):-
    0 is H mod 2,!;
    isEvenInList(T).

firstEven([H|T], X):-
    0 is H mod 2,
    X is H,!;
    firstEven(T,X).

listMinEven2(List,_):-not(isEvenInList(List)),!,write("No Even Nums"),fail.
listMinEven2(List,X):-
    listMin(List,X), 0 is X mod 2,!;
    del_el(List,X,List2),listMinEven(List2,Y).

%2(46)
solve_46([H|T],X,[H|Tn],ListPos):-H<0,!,solve_46(T,X,Tn,ListPos).
solve_46([H|T],X,ListNeg,[H|Tn]):-H>=0,!,solve_46(T,X,ListNeg,Tn).
solve_46([],X,[],[]):-!.
solve_46([H|T],X):-solve_46([H|T],X,ListNeg,ListPos),concat(ListPos,ListNeg,X).

%3(58)
%берём элемент
in_list1([El|_],El).
in_list1([_|T],El):-in_list1(T,El).

isSumOf2(List,El):-
    in_list1(List,A),
    in_list1(List,B),
    El is A+B,!.

solve58([],C,C,_):-!.  
solve58([H|T],C,Count,BL):-isSumOf2(BL,H), C1 is C+1, solve58(T,C1,Count,BL),!;
    solve58(T,C,Count,BL).
solve58(List,Count):-solve58(List,0,Count,List).

%4
hairStyle:-
    List = [_,_,_],
    contains(List,[belocurov,_]),
    contains(List,[rizhov,_]),
    contains(List,[chernov,_]),
    contains(List,[_,rizhiy]),
    contains(List,[_,blondin]),
    contains(List,[_,brunet]),
    not(contains(List,[rizhov,rizhiy])),
    not(contains(List,[chernov,brunet])),
    write_list(List),!.

%5
%имя платье туфли
triDevici:-
    List=[_,_,_],
    contains(List,[_,white,_]),
    contains(List,[_,blue,_]),
    contains(List,[_,green,_]),
    contains(List,[_,_,white]),
    contains(List,[_,_,blue]),
    contains(List,[_,_,green]),
    contains(List,[ann,_,_]),
    contains(List,[valya,_,_]),
    contains(List,[natasha,_,_]),
    contains(List,[ann,A,A]),
    not(contains(List,[valya,white,white])),
    not(contains(List,[valya,B,B])),
    not(contains(List,[natasha,C,C])),
    contains(List,[natasha,_,green]),
    write_list(List),!.
%6
zavod:-
    List=[_,_,_],
    contains(List,[1,_,_]),
    contains(List,[2,_,_]),
    contains(List,[0,_,slesar]),
    contains(List,[A,_,tokar]),
    contains(List,[_,_,svarshik]),
    contains(List,[_,borisov,_]),
    contains(List,[_,ivanov,_]),
    contains(List,[B,semenov,_]),
    B>A,
    write_list(List),!.


    






