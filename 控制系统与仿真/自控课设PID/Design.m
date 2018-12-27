%自控课设系统校正
% 形象点：比例跟偏差成正比,决定响应速度；积分的作用是使系统稳定后没有静差
%（如：你要得到输出是10,积分就能使最后结果是10,静差为0也即没有静差）；
% 微分的作用使输出快速的跟定输入,也就是说你输入偏差变大,我“立刻”变化是你变小,抑制你.
s=tf('s');
k=100;     %k>=100
G0=k/(s*(0.1*s+1)*(0.025*s+1));
% margin(G0)
% figure;
% hold on;
Kp=0.3;Td=0.1;Ti=1.57;
Gc=Kp*[1+1/(Ti*s)+Td*s];
% jiaozheng(1,G0,48)
% a=306.49;
% T=1/(85.74*sqrt(a));
% Gc=(1+a*T*s)/(1+T*s);
% margin(Gc);
% hold on;
G=Gc*G0; 
margin(G);
% hold off;
figure;
step(feedback(G,1))
% % rlocus(G)
grid