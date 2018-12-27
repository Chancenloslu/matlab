s=tf('s');
G0=100/(s*(0.1*s+1)*(0.025*s+1));	% 原系统开环传递函数[mag,phase,w]=bode(G0);	% 返回系统 Bode图参数
[Gm,Pm]=margin(G0);	% 返回系统稳定裕量参数
wc1=31.62;	% 试凑频率值
K=100;	% 系统分子
d1=conv(conv([1 0],[0.1 1]),[0.025 1]);	% 系统分母na=polyval(K,j*wc1);	% 计算分子多项式
da=polyval(d1,j*wc1);	% 计算分母多项式
G=d1/da;	% 计算 G 的值
g1=abs(G);	% 求取幅值
L=20*log10(g1);	% 进行幅值的单位转换
beta=10^(L/20);	% 求滞后部分的的参数	beta
T=1/(0.1*wc1);	% 求滞后部分的参数	T betat=beta*T;
Gc1=tf([T 1],[betat 1])	% 得到滞后部分的传递函数
expPm=60;	% 期望相位裕度
phim=expPm-Pm+6;	% 达到期望相位裕度应补偿的相位值phim=phim*pi/180;
alfa=(1-sin(phim))/(1+sin(phim));	% 求超前部分的参数	alfa wc2=20;	% 试凑频率值
T=1/(wc2*sqrt(alfa));	% 求超前部分的参数	T alfat=alfa*T;
Gc2=tf([T 1],[alfat 1])	% 求超前部分的传递函数figure(1)
G3=G0*Gc2*Gc1	% 求取校正后系统开环传递数
% 求取带稳定裕度的	Bode 图

margin(G3),grid figure(2)
step(feedback(G3,1))	% 求取系统时域响应
