clc;
clear all;
d=csvread('processed_glcm.csv');
d(1,:)=[];
x_train=size(290,20);
y_train=size(290,1);
x_test=size(29,20);
y_test=size(29,1);
a=1;b=1;c=1;
Predict = zeros(20,1);
A = zeros(3,0);

for i=1:319
    if i==39 || i==41 || i==43 || i==45 || i==47 || i==60 || i==65 || i==69 || i==158 || i==182 || i==187 || i==205 || i==234 || i==243 || i==262 || i==264 || i==274 || i==290 || i==302 || i==304 
        for j=1:20
            x_test(a,j) = d(i,j);
        end
        y_test(a,1) = d(i,21);
        a=a+1;
    else
        for j=1:20
            x_train(c,j) = d(i,j);
        end
        y_train(c,1) = d(i,21);
        c=c+1;
    end
end

for i1=1:20
    dist = zeros(299,1);
    index = [0,0,0,0,0];
    for i2=1:299
        dist1 = 0;
        for i3=1:20
            dist1 = dist1 + power((x_train(i2,i3)-x_test(i1,i3)),2);
        end
        dist(i2) = sqrt(dist1);
    end
    
    for k = 1:5
        min = 100;
        for j = 1:299
            if dist(j)<min
                index(k) = j;
                min = dist(j);
            end
        end
        dist(index(k))=100;
    end
    
    for i = 1: 5
        A(i) = y_train(index(i));
    end
    for i =1:5
        B=0;M=0;N=0;
        if A(i) == 1
            B=B+1;
        elseif A(i)==2
            M = M+1;
        else
            N = N+1;
        end
    end
    
    if B>=N && B>=M
        Predict(i1) = 1;
    elseif M>=N && M>=B
        Predict(i1) = 2;
    else
        Predict(i1) = 3;
    end
end

result=0;
for i=1:20
    if Predict(i) == y_test(i)
        result=result+1;
    end
end
result = result/20;
        