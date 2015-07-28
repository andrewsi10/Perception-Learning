function [ factorial ] = dummyfunction( number )
%DUMMYFUNCTION IGNORE THIS FUNCTION. 
%   Returns the factorial of a number
if number<1
    factorial=1;
else
    factorial = prod(1:number);
end
end

