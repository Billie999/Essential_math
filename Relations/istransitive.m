
% function istransitive

% to find transitvity matrix
function [output] = istransitive(r)
% r=input('R.mat');
sum2=0;
[m,n]=size(r);
for i=1:m
for j=1:n
for k=n:1
lambda1=r(i,j);
lambda2=r(j,k);
lambda3=r(i,k);
p=min(lambda1,lambda2);
if(lambda3 <= p)
output=false;
sum2=1;
break;
end
end
if(sum2==1)
break;
end
end
if(sum2==1)
break;
end
end
if(sum2~=2)
output=true;
end