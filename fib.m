function [ a ] = fib( n )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

