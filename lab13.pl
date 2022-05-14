:- ['lab12'].
del_el([],_,[]):-!.
del_el([El|Tail],El,NewList) :- del_el(Tail,El,NewList),!.
del_el([H|Tail],El,[H|NewTail]) :- del_el(Tail,El,NewTail).

listExclude([El|T],El,T).
listExclude([H|T],El,[H|Tail]):-listExclude(T,El,Tail).

in_list(El,[El|_]):-!.
in_list(El,[_|Tail]) :- in_list(El,Tail).

%1(40)
isEvenInList([H|T]):-
    0 is H mod 2,!;
    isEvenInList(T).

firstEven([H|T], X):-
    0 is H mod 2,
    X is H,!;
    firstEven(T,X).

listMinEven2([H|T],_):-not(isEvenInList([H|T])),!,write("No Even Nums"),fail.
listMinEven2([H|T],X):-
    listMin([H|T],X), 0 is X mod 2,!;
    del_el([H|T],X,[H|Tn]),listMinEven([H|Tn],Y).



