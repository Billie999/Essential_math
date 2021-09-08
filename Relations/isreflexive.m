
% function isreflexive

% to find reflexivity matrix
function [output] = isreflexive(r)
% r=input('R.mat');
sum1=0;
[m,n]=size(r);
if(m==n)
for i=1:m
%to find the reflexivity
if(r(1,1)==r(i,i))
else
output=false;
sum1=1;
break
end
end
if(sum1 ~= 1)
output=true;
end
end