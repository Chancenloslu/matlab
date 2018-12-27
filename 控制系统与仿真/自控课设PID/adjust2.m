s=tf('s');
G0=100/(s*(0.1*s+1)*(0.025*s+1));            %ԭϵͳ�������ݺ���
[mag,phase,w]=bode(G0);                      %����ϵͳ��bodeͼ����
[Gm,Pm]=margin(G0);                          %����ϵͳ�ȶ�ԣ������
wc1=10;                                      %�Դ�Ƶ��ֵ
K=100;                                      %ϵͳ����
d1=conv(conv([1 0],[0.1 1]),[0.025 1]);    %ϵͳ��ĸ
na=polyval(K,j*wc1);                       %������Ӷ���ʽ
da=polyval(d1,j*wc1);                      %�����ĸ����ʽ
G=na/da;                                   %����G��ֵ
g1=abs(G);                                 %��ȡ��ֵ
L=20*log10(g1);                            %��ȡ��ֵ�ĵ�λת��
beta=10^(L/20);                            %���ͺ�Ĳ���beta
T=1/(0.1*wc1);                             %���ͺ����T
betat=beta*T;
Gc1=tf([T 1],[betat 1]);                   %�õ��ͺ󲿷ִ��ݺ���
expPm=60;                                  %������λԣ��
phim=expPm-Pm+6;                           %�ﵽ������λԣ��Ӧ��������Ӧֵ
phim=phim*pi/180;
alfa=(1-sin(phim))/(1+sin(phim));            %��ǰ���ֵĲ���alfa
wc2=30;                                      %�Դ�Ƶ��ֵ
T=1/(wc2*sqrt(alfa));                        %��ȡ��ǰ���ֵĲ���T
alfat=alfa*T;
Gc2=tf([T 1],[alfat 1]);                     %��ǰ���ֵĴ��ݺ���
figure(1)
G3=G0*Gc2*Gc1;                            %��У����Ŀ������ݺ���
margin(G3),grid
figure(2)
step(feedback(G3,1))                      %��ȡϵͳʱ����Ӧ
Gc1=tf([T 1],[betat 1])
Gc2=tf([T 1],[alfat 1])
