% Relations

%%
load R.mat 


%%
% A relation R is called as an equivalence relation if it satisfies the following
% properties. They are (a) reflexivity, (b) symmetry, and (c) transitivity.

% a) When a relation satisfies symmetric property then in the graph for every edge
% pointing from vertex x to vertex y there is a edge pointing from vertex y
% to vertex x, as well. In other words, if there is an arc from vertex x to vertex y, then there is also an arc from vertex y to vertex x.
% For matrix, symmetry is shown by:
% if (x,y) belong to R then (y,x) belong to R. That is, R is symmetric if xRy implies yRx,
% for all x,y that belong to the set A.

% When a relation satisfies the reflexive property then every vertex in the graph
% originates a single loop. There is an arc from every vertex to itself. For matrix, reflexivity is shown by:
%  (xi,xj) belong to R for all xi that belong to the set  A. That is, R is reflexive if xRx for all xi that belong to A.

% When a relation satisfies transitivity property then every pair of edges in the
% graph, one pointing from vertex x to vertex y and the other from vertex y to
% vertex z, where (x, y, z = 1, 2, 3), then there is an edge pointing from vertex x directly to
% vertex z. In general, if there is an arc from vertex x to vertex y, and an arc from vertex y to vertex z, then there is an arc from x to z.
% For matrix relation transitivity is given by: 
% if (x,y) belong to R and (y,z) belong to R, then (x, z) belong to R. A relation R over a set A is transitive if xRy and yRz imply xRz, for all x, y, z that belong to set A.

% Three functions are developed on three separate files to test the three matrices-relations:
% symmetry (issym), reflexivity (isreflexive) and transitivity (istransitive)

disp ('R1')
issymmetric(R1)         % true 
isreflexive(R1)   % true
istransitive(R1)  % also true, therefore R1 is an equivalence relation   
figure            
plot(digraph(R1)) % shows a graph made up of 5 disjoint graphs, therefore
%  R1 is an equivalence relation with 5 equivalence classes.
% As a consequence of the reflexive, symmetric, and transitive properties, any equivalence relation provides a partition into disjoint equivalence classes. 
% Two elements of the given matrix are equivalent to each other if and only if they belong to the same equivalence class.
figure
spy(R1)           % plots the sparsity pattern of matrix R1. A matrix is sparse if most of its entries are zero.
% The spy function stores the nonzero entries of a sparse matrix (entries for which the relation is true) together
% with their row and column indices.

disp ('R2')
issymmetric(R2)   % true     
isreflexive(R2)   % true   
istransitive(R2)  % also true, therefore R2 is an equivalence relation   
figure
plot(digraph(R2)) % shows a graph made up of 5 disjoint graphs, therefore
%  R2 is an equivalence relation with 5 equivalence classes.
figure
spy(R2)           % plots the sparsity pattern of matrix R2

disp ('R3')
issymmetric(R3)  % false, a relation R3 over a set A is not symmetric  and also it is not antisymmetric. 
isreflexive(R3)  % true   
istransitive(R3) % true, therefore  R3 is not equvalence relation. 
figure
plot(digraph(R3)) % shows a graph made up of 5 connected graphs, therefore R1 is not an equivalence relation
% For example, since there is  no arc between element 29 and element 17 in the digraph of R3 despite the existence of  an arc from 17 to 29, 
% relation R is not symmetric, hence is not equivalence relation.There are other pairs without an arc in the opposite direction, but also there 
% are pairs with arcs in both directions such as pair (14,2). 
figure
spy(R3)          % plots the sparsity pattern of matrix R3


