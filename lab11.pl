man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%11
isFather(X,Y):-parent(X,Y),man(X).
fatherFor(X):-parent(Y,X),man(Y),write(Y),!.
%12
wife(X,Y):-parent(X, Z),parent(Y, Z),man(X),woman(Y).
wifeOf(X):-wife(X,Y),write(Y),nl.
%13
grand_da(X,Y):-parent(Y,Z),parent(Z,X),woman(X).
grand_daOf(X):-grand_da(Y,X),write(Y),nl,fail.
%14
grand_ma_and_son(X,Y):-parent(X,Z),parent(Z,Y),woman(X),man(Y);parent(Y,Z),parent(Z,X),woman(Y),man(Z).
%15
multDig(X,_):-X<0, write("NO"),!.
multDig(0,1):-!.
multDig(X,RES):-
    NEWX is X div 10,
    DIGIT is X mod 10,
    multDig(NEWX, NEWRES),
    RES is NEWRES*DIGIT.
%16
mult_digit(X,_):- X>0,!,mult_digit(X,_,1),!.
mult_digit(X,Y,Z):- X > 0,!,
    X1 is X div 10, Z1 is Z*(X mod 10),
    mult_digit(X1,Y,Z1).
mult_digit(_,Y,Z):- Y is Z.
