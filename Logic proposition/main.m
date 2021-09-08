% Proposition in logic



% 1. To begin with, we need to implement some of the logical connectives that MATLAB is missing.
% Consider the IF-THEN connective. Using the implication law:

% Write an ifthen function that defines IF-THEN in terms of NOT and OR, both of which MATLAB knows
% by default

ifthen = @(p,q) ~p|q;

% ~ is MATLAB NOT operator and | is MATLAB OR operator

% 2. Next, we need an IF-AND-ONLY-IF connective function iff. Use the relevant law of logic to
% write this function in terms of ifthen.

iff = @(p,q) ifthen(p,q) & ifthen (q,p);

% & (AND) is required here to satisfy the equivalence law

% 3. To make it easier to evaluate the proposition
% use the ifthen and iff functions to define a proposition function that does this for a given p
% and q.

% iff and ifthen in is evaluated in MATLAB as iff(ifthen(p,q)&~q,p|q)

Proposition = @(p,q) iff(ifthen(p,q)&~q,p|q);


% 4. Use this proposition function to determine whether the above proposition is a tautology,
% contradiction or neither.

% the outputs
FF = Proposition(0,0);
FT = Proposition(0,1);
TF = Proposition(1,0);
TT = Proposition(1,1);


% The the proposition is a contradiction as all outputs return 0 indicating
% the proposition is always false.
% Please, delete the semicolons and press RUN