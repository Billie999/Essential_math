function[output] = visualrank(A)

% Define A and removing negative values
A(A<0) = 0;
% Remove the loop edge from the similarity marix
A = A-diag(diag(A));
% Create the hyperlink matrix H by making the sum of each row equal to 1
H = normalize(A, 2, 'norm', 1) 
% Create the Jump matrix 
J = ones(size (H))/length(H);
% Creating Htitlde matrix 
d = 0.85;
Htilde = d*H + (1-d)*J;
% Create the initial vector
r = zeros(1,length(A));
r(1) = 1;
% Using a for loop to determine r
nmax = 50
for n=1:nmax
        r = r * Htilde
output = r * Htilde        
end