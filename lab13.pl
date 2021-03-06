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
%7
sleva(_,_,[_]):-fail.
sleva(A,B,[B|[A|_]]).
sleva(A,B,[_|T]):-sleva(A,B,T).

sprava(_,_,[_]):-fail.
sprava(A,B,[A|[B|_]]).
sprava(A,B,[_|T]):-sprava(A,B,T).

okolo(A,B,List):-sleva(A,B,List).
okolo(A,B,List):-sprava(A,B,List).

%бутылка, стакан, кувшин, банка. Молоко,лимонад,квас,вода
steklotara:-
    List = [_,_,_,_],
    contains(List,[bottle,_]),
    contains(List,[glass,_]),
    contains(List,[jug,_]),
    contains(List,[jar,_]),
    contains(List,[_,moloko]),
    contains(List,[_,lemonade]),
    contains(List,[_,kvas]),
    contains(List,[_,water]),
    not(contains(List,[bottle,water])),
    not(contains(List,[bottle,moloko])),
    sprava([jug,_],[_,lemonade],List),
    sprava([_,lemonade],[_,kvas],List),
    not(contains(List,[jar,water])),
    not(contains(List,[jar,lemonade])),
    okolo([glass,_],[jar,_],List),
    okolo([glass,_],[_,moloko],List),
    write_list(List),!.

%8
people:-
    List =[_,_,_,_],
    contains(List,[voronov,_]),
    contains(List,[pavlov,_]),
    contains(List,[levitskiy,_]),
    contains(List,[saharov,_]),
    contains(List,[_,dancer]),
    contains(List,[_,artist]),
    contains(List,[_,singer]),
    contains(List,[_,writer]),
    not(contains(List,[voronov,singer])),
    not(contains(List,[levitskiy,singer])),
    not(contains(List,[pavlov,artist])),
    not(contains(List,[pavlov,writer])),
    not(contains(List,[saharov,writer])),
    not(contains(List,[voronov,writer])),
    write_list(List),!.
%9
zaruba:-
    List = [_,_,_],
    contains(List,[_,_,cricket,1]),
    contains(List,[_,_,_,2]),
    contains(List,[_,_,_,3]),
    contains(List,[israel,simon,_,A]),
    contains(List,[_,michael,basket,B]),
    contains(List,[_,richard,_,_]),
    contains(List,[australian,_,_,_]),
    contains(List,[american,_,_,C]),
    contains(List,[_,_,tennis,D]),
    not(contains(List,[american,michael,_,_])),
    not(contains(List,[_,simon,tennis,_])),
    contains(List,[_,_,cricket,1]),
    A<D,
    B<C,
    write_list(List),!.
%10
%имя велик родина
velik:-
    List = [_,_,_,_,_],
    contains(List,[_,_,kharkov]),
    contains(List,[_,_,moscow]),
    contains(List,[_,lvov,_]),
    contains(List,[sergey,riga,_]),
    contains(List,[boris,penza,riga]),
    contains(List,[leonid,_,X]),
    contains(List,[_,X,penza]),
    contains(List,[gregory,kharkov,_]),
    contains(List,[victor,moscow,lvov]),
    not(contains(List,[_,A,A])),
    write_list(List),!.    






