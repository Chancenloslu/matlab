function [ a ] = fib( n )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
if n==1
    a=[1];
else if n==2
        a=[1 1];
    else if n>2
            b=fib(n-1);
            a=[b,b(end)+b(end-1)];
        end
    end
end
end

