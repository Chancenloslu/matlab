function [ output_args ] = discrete_stable_decide( g )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
pzmap(g);
if abs(eig(g))<1
    display('controllable')
else display('uncontrollable')

end

