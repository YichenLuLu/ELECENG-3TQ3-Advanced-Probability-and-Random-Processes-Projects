%Yichen Lu luy191 400247938
clc;
clear;
word='YichenLuisthebest';
l=length(word);
binary=dec2bin(word,8);   %transfer the words into ASSCLL form
tempholder=zeros(l,8);
%constant
t = [0.25 0.5 0.75];
variance=[0.1 1 10];
error= zeros(length(t),length(variance));
times =5000;

%transfer string into integer
for i=1:l
    for j=1:8
        if binary(i,j)=='0'
            tempholder(i,j)=0;
        end
        if binary(i,j)=='1'
            tempholder(i,j)=1;
        end 
    end
end 



%main part
for i =1:length(t)            %go through tau
    for j=1:length(variance)  %go through variance
        wrong=0;          %incorrect numbers holder
        for x=1:times
            e=randn(1,8)*sqrt(variance(j));   %noise function
            for k = 1:l
                eachletter=tempholder(k,:);       %for each row 
                r=eachletter+e;
                wrongbit=false;
                for n=1:8                    %run through every bit of the letters
                    if(eachletter(n)==0&&r(n)>=t(i)||eachletter(n)==1&&r(n)<t(i))
                        wrongbit=true;
                    end 
                end
                if wrongbit                
                    wrong=wrong+1;  
                end
            end
        end
        error(i,j)=wrong/times;          %get average error
        fprintf("when tau=%.2f and variance=%.1f, the average number of incorrect words is %.1f out of %d. \n",t(i),variance(j),error(i,j),l);
    end
end
