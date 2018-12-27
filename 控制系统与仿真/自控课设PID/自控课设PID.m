s=tf('s');
G0=100/(s*(0.1*s+1)*(0.025*s+1));
[G,Gc,Kp,Ti,Td]=zn_ljzy(G0,3,[0.5,0.314]);         %构建PID校正装置
G=feedback(G,1);                                           %求校正后的系统闭环传函
step(G);
[y,t]=step(G);                                                 %求响应曲线的时间和幅值数组            
plot(t,y);                                                        %重新在坐标轴中显示时间和幅值的关系
pmap=max(y) ;                                               %求峰值
j=500;                                                            %设置检索数目
while y(j)<1.03&&y(j)>0.97                            %从后往前检索，查到第一个超出范围的值就返回
    j=j-1;
end
ts=t(j);                                                          %调节时间
%pamp=max(pamp);
while (pmap>=1.3 || ts>=0.5)                        %根据设置条件，自行调节直到满足
    if pmap>1.3                                              %超调量不满足调节积分时间
    Ti=Ti+0.02;
    end
    if  ts>=0.5                                                 %调节时间不满足调节微分时间
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