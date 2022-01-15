%%Task 1
clc;
clear;

N=100;
L=25;
times=0;
theoreticalvalue=0.05;
X = L * rand(N,1);

for i=1:N
    if(X(i,1)>0.1*L&&X(i,1)<0.15*L)
    times=times+1;
    end
    
end
times%The experimental times result
experimentalvalue=times/100%The experimental value result
difference=(times/100)-theoreticalvalue;
difference %The difference between the experimental result and the theoretical value



M=100;
m=zeros(M,1);
average=0;
var=0;

for j=1:M
    times=0;
    X=L*rand(N,1);
    for i=1:N
        if(X(i,1)>0.1*L&&X(i,1)<0.15*L)
            times=times+1;
        end
    end
    m(j,1)= times;
    average = average+(1/M)*(m(j,1)/N-0.05); %The average error
    var = var+((1/M)*(m(j,1)/N-0.05)^(2)); %The Variance
end
 average %The average error
 var %The Variance
 
 
 

