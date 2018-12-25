clc;
clear all;
Array=csvread('GLCM.csv');
sum = 0;
for i=1:1000
    sum = sum + (knn_dynamic(Array, 60, 40));
end
sum = sum/1000;
sum