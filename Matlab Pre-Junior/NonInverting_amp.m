t = 0:0.01:2*pi;
wave = sin(t);

R1 = 10000;
R2 = 1500;

B0 = 0;
B1 = 0.5;
B2 = 1;

% G = Vo/Vs;

Vo_0 = wave*(1+(R1*(1-B0))/((R1*B0)+R2));
Vo_1 = wave*(1+(R1*(1-B1))/((R1*B1)+R2));
Vo_2 = wave*(1+(R1*(1-B2))/((R1*B1)+R2));

figure 
plot(t,wave);
axis([0 2*pi -8 8])
figure 
plot(t,Vo_0);
axis([0 2*pi -8 8])
figure 
plot(t,Vo_1);
axis([0 2*pi -8 8])
figure 
plot(t,Vo_2);
axis([0 2*pi -8 8])