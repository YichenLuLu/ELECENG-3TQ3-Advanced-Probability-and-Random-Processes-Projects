%Yichen Lu luy191 400247938
clc;
clear;

p=0.5;
tau=0.5;
variance=[0.1,1,10,100];
N=1000;
error=zeros(1,4);
s=randi([0,1],[1,1000]);

for i= 1:4
    e = randn(1,1000)*sqrt(variance(i));
    r = s+e;
    for j = 1:N
        if(s(j)==0 && r(j)>=tau) || (s(j)==1 && r(j)<tau)
            error(i) = error(i)+1;
        end
    end
end

figure
plot(variance,error/N,'LineWidth',2,'Marker','*')
title('Yichen Lu 400247938')
xlabel('noise variance')
ylabel('probability of error')

