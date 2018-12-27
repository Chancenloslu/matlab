s=tf('s');
G0=100/(s*(0.1*s+1)*(0.025*s+1));
[G,Gc,Kp,Ti,Td]=zn_ljzy(G0,3,[0.5,0.314]);         %����PIDУ��װ��
G=feedback(G,1);                                           %��У�����ϵͳ�ջ�����
step(G);
[y,t]=step(G);                                                 %����Ӧ���ߵ�ʱ��ͷ�ֵ����            
plot(t,y);                                                        %����������������ʾʱ��ͷ�ֵ�Ĺ�ϵ
pmap=max(y) ;                                               %���ֵ
j=500;                                                            %���ü�����Ŀ
while y(j)<1.03&&y(j)>0.97                            %�Ӻ���ǰ�������鵽��һ��������Χ��ֵ�ͷ���
    j=j-1;
end
ts=t(j);                                                          %����ʱ��
%pamp=max(pamp);
while (pmap>=1.3 || ts>=0.5)                        %�����������������е���ֱ������
    if pmap>1.3                                              %��������������ڻ���ʱ��
    Ti=Ti+0.02;
    end
    if  ts>=0.5                                                 %����ʱ�䲻�������΢��ʱ��
    Td=Td+0.02;
    end
    Gc=(Kp*Ti*Td*s^2+Kp*Ti*s+Kp)/(Ti*s);
    G=G0*Gc;
    G=feedback(G,1);
    [y,t]=step(G);   
    plot(t,y);
    pmap=max(y);
    j=130;
    while y(j)<1.03&&y(j)>0.97
        j=j-1;
    end
    ts=t(j);
end
step(G)
Kp
Td
Ti
Gc
G