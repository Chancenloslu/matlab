function [ output_args ] = stable_decide( g )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
pzmap(g);
if real(eig(g))<0
    display('stable')
else display('unstable')

end

