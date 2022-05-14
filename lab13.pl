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