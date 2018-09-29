function [ Exf ] = Ex(x)
%The expected value of a funtion
% Takes an array of numbers as input and outputs the expected value.
% x is the array


[r,c] = size(x)

totalx = 0;
for j = 1:r
totalx = totalx +  x(j)
end
Exf = totalx/r


end
