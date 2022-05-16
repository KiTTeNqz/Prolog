%consult("lab14.pl").
:- ['lab12'].
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

readString(String) :- get0(X),inputString(String,[], X).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).
%1.1
povtor3:-	read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),
		write_str(A),write(', '),write(N).

wordsCount:-read_str(A,N),count_words(A,K),write(K).
%1.2
count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-
    skip_space(A,A1),
    get_word(A1,Word,A2),
    Word \=[],I1 is I+1,
    count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

getByIndex(A,I,X):-getByIndex(A,I,1,X).
getByIndex([H|_],I,I,H):-!.
getByIndex([_|T],I,K,X):-K1 is K+1,getByIndex(T,I,K1,X).

%1.3
maxCountInList:-read_str(A,N),get_words(A,Words,K),uniq_el(Words,Uniq_words),count_elems(Words,Uniq_words,Counts),
		max_in_list(Counts,Imax),getByIndex(Uniq_words,Imax,Word),write_str(Word).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Cur):-check(H,Cur,Cur,R), uniq_el(T,Res,R).
check(El,[El|_],Ref,Ref):-!.
check(El,[],Ref,R):-append(Ref,[El],R),!.
check(El,[_|T],Ref,R):-check(El,T,Ref,R).

count_elems(_,[],[]):-!.
count_elems(A,[H|T],[Cur|Tail]):-count_el(H,A,Cur),count_elems(A,T,Tail).

count_el(El,List,Count):-count_el(El,List,Count,0).
count_el(_,[],Count,Count):-!.
count_el(El,[El|T],Count,Cur):-Cur1 is Cur+1, count_el(El,T,Count,Cur1),!.
count_el(El,[_|T],Count,Cur):-count_el(El,T,Count,Cur).

max_in_list([H|T],Imax):-max_in_list(T,H,1,2,Imax).
max_in_list([],_,Cur,_,Cur):-!.
max_in_list([H|T],Max,Cur,Ind,Imax):-H>Max,Ind1 is Ind+1,max_in_list(T,H,Ind,Ind1,Imax),!.
max_in_list([_|T],Max,Cur,Ind,Imax):-Ind1 is Ind+1,max_in_list(T,Max,Cur,Ind1,Imax).

writeChar(_,0).
writeChar(Char,Count):-put(Char),NewCount is Count-1,writeChar(Char,NewCount).

copyList(L,L).
%1.4
triLastOrDie :- 
    read_str(X,L),
    (
        L =< 5,
        copyList(X,[H1|_]),
        writeChar(H1,L);


        copyList(X, [F1,F2,F3|_]),
        put(F1),put(F2),put(F3),

        revList(X, RevX),

        copyList(RevX, [L1,L2,L3|_]),
        put(L3),put(L2),put(L1)
    ),!.

printIndex([],_,_).
printIndex([H|T],Value,Index):-
    NewIndex is Index+1,
    (
        H is Value,
        write(Index),write(' '),
        printIndex(T,Value,NewIndex);
        printIndex(T,Value,NewIndex)
    ).
%1.5
printValuesLikeLast:-
    read_str(A,N),revList(A,RevA),copyList(RevA,[Last|_]),printIndex(A,Last,0).