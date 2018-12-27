%根据相角yudu设计超前校正装置

[gm,pm,wcg,wcp]=margin(kc*g);
phi=gamma-pm;
if phi<=0
    disp('phase margin is satisfied');
    alpha=0;
    T=0;
else
    phi=phi+10;
    alpha=(1+sin(phi*pi/180))/(1-sin(phi*pi/180));
    w=logspace(-1,3,10000);
    [mag,phi1]=bode(kc*g,w);
    mag_db=20*log10(mag);
    gr=-10*log10(alpha);
    %wm=spline(20*log10(mag),w,10*log10(alpha));
    wm=spline(mag_db,w,gr);
    T=1/(sqrt(alpha)*wm);
end
Gc=tf([alpha*T,1],[T,1]);
bode(kc*g),hold,margin(Gc*kc*g)
figure;gcl1=feedback(kc*g,1);gcl2=feedback(Gc*kc*g,1);
step(gcl1,gcl2)
Gc
    
    