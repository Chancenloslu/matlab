function [ output_args ] = discrete_stable_decide( g )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
pzmap(g);
if abs(eig(g))<1
    display('controllable')
else display('uncontrollable')

end

