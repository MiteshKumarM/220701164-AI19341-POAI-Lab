% Facts 
male(john). 
male(joe). 
female(mary). 
female(susan). 
parent(john, mary). 
parent(mary, susan). 
parent(mary, joe). 
parent(susan, ann). 

% Rules 
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).  % X is grandparent of Y if X is parent of Z and Z is parent of Y 
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), X \= Y.  % X is a brother of Y if X is male and they share a parent Z 

% Initialization to automatically run queries
:- initialization(main).

main :-
    % Query 1: Check if John is a grandparent of Ann
    (grandparent(john, ann) -> 
        write('John is a grandparent of Ann.'), nl ; 
        write('John is not a grandparent of Ann.'), nl),

    % Query 2: Check if Joe is a brother of Susan
    (brother(joe, susan) -> 
        write('Joe is a brother of Susan.'), nl ; 
        write('Joe is not a brother of Susan.'), nl).
