clc;
clear all;
Array=csvread('HOG1.csv');
sum = 0;
for i=1:1000
    sum = sum + (nb(Array, 60, 40));
end
sum = sum/1000;
sum