x0=[1.2;0;0;-1.04935751];%x0(i)��Ӧ��xi�ĳ�ֵ 
options=odeset('reltol',1e-8);%���������һ��д����options=odeset;options.reltol=1e-8; 
tic
[t,y]=ode45(@appollo,[0,20],x0,options);%t��ʱ��㣬y�ĵ�i�ж�Ӧxi��ֵ��t��y��������ͬ 
toc 
plot(y(:,1),y(:,3))%����x1��x3��Ҳ����x��y��ͼ�� 
% title('Appollo�����˶��켣') 
% xlabel('X') 
% ylabel('Y')