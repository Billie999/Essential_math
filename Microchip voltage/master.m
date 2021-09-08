%% Microchip Voltage


    % We need to investigate a complex microchip as a circuit with many
    % different components.Changes of the  voltage in the circuit  with time is shown as a set of equations: 
    % Vn+1 = AVn
    % where Vn is a vector of voltages at millisecond n. The elements of the vector 
    % correspond to different important locations in the chip, of which there are 21. 
    % The first of these has some obvious meaning: it is the input voltage. 
    % The remaining 20 locations are certain junctions in the microchip.

%% Initialisation

    % commands for clearing Command Window
    clc; close all;

    % edit command opens a blank file named master.m
    edit master;
    
    % command 'csvread'for reading comma-separated value(CSV)file into matrix A. 
    % The file must contain only numeric values.
    
    A = csvread("voltage_evolve.csv");
    
%% Initial condition that we shall specify is Vo=[1,0,0,0,..]T. That is, at the 0th millisecond, 
% the voltage is 1 at the input and 0 everywhere else.

    % Assigning the voltage vector Vo as a column vector with first element as 1.
    
Vo = [1;zeros(20,1)];

    
%% Voltage V at 0th millisecond is Vo and according to the formula we continue to calculate until 120th milisecond. 
% Voltage at 1st milllisecond V1 is:
    % Vo+1 = A*Vo
    % V1 = A*Vo;
    % Voltage V2 at 2nd millisecond is:
    % V1+1 = A*Vo+1
    % V2 = A*V1;
    % Voltage V3 at 3rd millisecond is:
    % V2+1 = A*V2
    % V3 = A*V2;
    % Voltage V4 at forth millisecond is:
    % V4 = A*V3;
     % ............
    % % Continue like this until 120th milisecond.
    % This is tedious. Instead, we can use a for loop and find the voltage up to the 120 millisecond.
%% The voltages of the circuit at all locations for all milliseconds up to the 120th millisecond.
V = Vo;
N=120;
nodes = 21;
V120 = zeros(21,120);
for i=1:120
V120(:,i)= A*V;
V = V120(:,i);
end
V = V120;
% Command 'disp' for executing the values of the columns in matrix V.
disp(V);
% (V and V120 newly created matrices do not contain zero column)
%% 3. GOAL 1: With this information calculated, create a plot of the voltage at the first 5 locations for 0<n<120. 

   
    % Creating a plotof the first 5 locations: command plot(X,Y) creates a 2-D line plot of the data in Y versus 
    % the corresponding values in X. Additional matrix is created named V120p that conatins 119 columns that represent voltages from 1st
    % milisecond to 119th miliseconds.
 
V120p = V120(1:21,1:119);
figure;
hold on;
plot(V120p(1,:),'r','linewidth',1);
plot(V120p(2,:),'b', 'linewidth',1);
plot(V120p(3,:),'m', 'linewidth',1);
plot(V120p(4,:),'g', 'linewidth',1);
plot(V120p(5,:),'k', 'linewidth',1);
xlabel('Time (millisecond)');
ylabel('Voltage (V)');
title('Voltages at First 5 Locations');
legend('1sth location', '2nd location', '3rd location', '4th location', '5th location');

    % Saving the image of the line plot as a Goal 1.png file with 'saveas' command. 
saveas(gcf,'Goal 1.png');
    
    % Creating a plot of all 21 locations:
N = 119   
figure;
hold on;
plot(1:N, V120p, 'linewidth',1);
xlabel('Time (millisecond)');
ylabel('Voltage (V)');
title('Voltages at All 21 Locations');

% Saving the image of the line plot as a Goal 1a.png file with 'saveas' command. 
saveas(gcf,'Goal 1a.png');

%% 4. GOAL 2: Save a text file with all 21 voltages corresponding to the 120th millisecond after the voltage spike (V120).
    
    % Command csvwrite('Goal_2.csv',V) writes homogeneous matrix V120 to a comma delimited text file.
csvwrite('Goal 2.csv',V);

%% 5. Now calculate the eigenvalues and eigenvectors of the matrix.

     % Command 'eig'returns a column vector containing the eigenvalues of square matrix A.
 
   e = eig(A);

    % The code [V,D] = eig(A) returns diagonal matrix D of eigenvalues and matrix V whose columns are the corresponding right eigenvectors, 
    % so that A*V = V*D.
 
  [V,D] = eig(A);
 
    % The code below is providing sorted eigenvalues and corresponding vector in descending order.

  eig_A = diag(D);

    % The eigenvalues of A are on the diagonal of D. This code also provides extracting eigenvalues from the diagonal of D using diag(D), 
    %  and sort the resulting vector in ascending order. The second output from sort returns a permutation vector of indices.
   
  [evals,ind] = sort(diag(D));
  
  eigenvalues = sort(abs(diag(D)));
  
    % Extraction of the corresponding eigenvectors:
  eigenvectors = abs(V(:,1));

    % The code [V,D,W] = eig(A) also returns full matrix W whose columns are
    % the corresponding left eigenvectors, so that W'*A = D*W'.
 
  [~,D,W] = eig(A);

    % The code below makes sure these are in order from smallest to largest eigenvalue:

  [evals,ind] = sort(diag(D));

  eigenvalues = sort(abs(diag(D)));

%% 6. Identify the largest eigenvalue. You should find that this eigenvalue is one or very close to 1.

    %The code below returns the largest magnitude eigenvalue of matrix A. 

    max(eigs(A));

    % This code returns a vector of the six largest magnitude eigenvalues of matrix A and confirms our observation again. 

    eigs(A);

%% 7. GOAL 3: Compare the values of the eigenvector that corresponds to the largest eigenvalue, with the result from the time evolution. 
% What is the same?

    
[V,D] = eig(A);
eigenvalues = sort(abs(diag(D)));
eigenvectors = abs(V(:,1));


% Plotting the eigenvalues for the matrix A.
figure;
plot(d, '+');
hold on;
la = eigs(A,6,'largestabs');
plot(la,'ro');
sa = eigs(A,6,'smallestabs');
plot(sa,'go');
hold off;
legend('All eigenvalues','Largest magnitude','Smallest magnitude');
xlabel('Real axis');
ylabel('Imaginary axis');

    % Saving the image of the dot plot as a Goal_3.png file with 'saveas' command 
saveas(gcf,'Goal_3.png');

 
    
    %% 8. Now let?s pretend that this is not a simulation, but that we are measuring a set of voltages at the 120th millisecond after a voltage spike 
    % into a real circuit. We would like to use this measurement to simulate a backtrack to earlier times. This would be useful for us to identify 
    % what caused a potential problem in a circuit. To do this, we should invert the equation to obtain:
    % Vn=A-1Vn+1. You can obtain the matrix A-1 in MATLAB by running the command inv(A). We write this equation with tildes (the '~' on the Vs) to 
    % indicate that the result has been calculated a different way.

    % Calculating inverse of A with the code 'inv(A)'.
    
A_I = inv(A);

    %% 9. Using A-1, work backwards from V120('~')=V120 that you found in step 2 to obtain the previous 22 values. That is, backtrack until the vector 
    % V(~)98. 
    
 V98 = V;
 
for i = 1:120
    V98 = A_I*V98;
end


    %% 10. GOAL 4: On a new figure, plot the values of ~Vn as circles, on top of the values of Vn as lines.
    
hold on;;
plot(1:21, V98, 'linewidth',1)
hold off;

% Saving the image as a Goal 4.png file with 'saveas' command.

saveas(gcf,'Goal 4.png');

%% 11. GOAL 5: Comment on the similarities and differences between the normal calculation forwards in time for the voltages and the backtracked values.

%% 12. You should see that there is a problem backtracking just does not work very well. This is because the problem is ill-posed.
%% 13. GOAL 6: Calculate the condition numbers for A and A120.

% This code returns the 2-norm condition number of matrix A and A120.

cond(A);
cond(A_I);

%% 14. GOAL 7: Calculate the largest eigenvalue for A and the largest eigenvalue for A-1. Comment on the difference.

%The code below returns the largest magnitude eigenvalues of matrix A and matrix A-1, respectively

emax_A = max(abs(eig(A)));
emaxA_I = max(abs(eig(A_I)));

% Comments about differences between largest eigenvalues of A and A-1 are provided in the Word document "Assessment_3_B_Simonovikj'. 
%% 15. GOAL 8: Write out the values of Vn and (~)Vn to a file called 'Voltages.csv'.  
% Vn = V120 - forward voltages
% (~)V = V_120 - backtrack voltages

V_120 = V;
N = 120;

for i = 1:120
    V_120 = A_I*V_120;
end

% Code for re-ordering the columns:

A(:,(120:1:1));

V_total =[V120;V_120];

csvwrite('voltages.csv', V_total);

