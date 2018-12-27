function [ output_args ] = stable_decide( g )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
pzmap(g);
if real(eig(g))<0
    display('stable')
else display('unstable')

end

