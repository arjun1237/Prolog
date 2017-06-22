% Login name: ak750
% Last name: Krishna Prasad
% First name: Arjun

%-------------------------------------------------------------------------------------------
% Q1.

contain(X,[X|_]):- !.
contain(X,[H|T]):- X =\= H, contain(X,T).

same_content([],_).
same_content([XH|XT],Y):- contain(XH, Y), same_content(XT,Y).

%--------------------------------------------------------------------------------------------
% Q2.

relative_prime(1,X):- X>0, !.
relative_prime(X,Y):- Y<X, X>0, gcd(X,Y) =:= 1.

totatives(0,[]):- !.
totatives(1,[1]):- !.
totatives(P,X):- P>1, totatives(P,1,X).
totatives(P,P,[]):- !.
totatives(P,X,[X|RT]):- X<P, relative_prime(P,X), XX is X+1,  totatives(P,XX,RT),!.
totatives(P,X,R):- X<P, \+ relative_prime(P,X), XX is X+1, totatives(P,XX,R),!.

%---------------------------------------------------------------------------------------------
% Q3.

aNatural(X) :- nonvar(X), X>=0, integer(X), !.
aNatural(X) :- var(X), nextInt(X,0).
nextInt(X,X).
nextInt(X,Y):- XX is Y+1, nextInt(X, XX).

%---------------------------------------------------------------------------------------------
% Q4.

anInteger(X):- (integer(X), !); (var(X),nextInteger(X,0)).
nextInteger(X,X). 
nextInteger((-X),X):- X > 0. 
nextInteger(X,Y):- Z is (Y+1), nextInteger(X,Z).

%----------------------------------------------------------------------------------------------
% Q5.

eval(X+Y,Z) :- var(Z), integer(X), integer(Y), Z is X+Y,!.
eval(X+Y,Z) :- var(Y), integer(X), anInteger(Y), Y =:= Z-X,!.
eval(X+Y,Z) :- var(X), integer(Y), anInteger(X), X =:= Z-Y,!.

eval(X-Y,Z) :- var(Z), integer(X), integer(Y), Z is X-Y,!.
eval(X-Y,Z) :- var(Y), integer(X), anInteger(Y), Y =:= X-Z,!.
eval(X-Y,Z) :- var(X), integer(Y), anInteger(X), X =:= Z+Y,!.

eval(X*Y,Z) :- var(Z), integer(X), integer(Y), Z is X*Y,!.
eval(X*Y,Z) :- var(Y), integer(X), anInteger(Y), Y =:= div(Z,X),!.
eval(X*Y,Z) :- var(X), integer(Y), anInteger(X), X =:= div(Z,Y),!.

eval(div(X,Y),Z) :- var(Z), integer(X), integer(Y), Z is X / Y,!.
eval(div(X,Y),Z) :- var(Y), integer(X), anInteger(Y), Y =:= div(X,Z),!.
eval(div(X,Y),Z) :- var(X), integer(Y), anInteger(X), X =:= Z*Y,!.

eval(mod(X,Y),Z) :- var(Z), integer(X), integer(Y), Z is X mod Y,!.
eval(mod(X,Y),Z) :- var(Y), integer(X), anInteger(Y), Y =:= X-Z,!.
eval(mod(X,Y),Z) :- var(X), integer(Y), anInteger(X), X =:= Y+Z,!.

%---------------------------------------------------------------------------------------------

