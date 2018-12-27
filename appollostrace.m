x0=[1.2;0;0;-1.04935751];%x0(i)对应与xi的初值 
options=odeset('reltol',1e-8);%该命令的另一种写法是options=odeset;options.reltol=1e-8; 
tic
[t,y]=ode45(@appollo,[0,20],x0,options);%t是时间点，y的第i列对应xi的值，t和y的行数相同 
toc 
plot(y(:,1),y(:,3))%绘制x1和x3，也就是x和y的图形 
% title('Appollo卫星运动轨迹') 
% xlabel('X') 
% ylabel('Y')