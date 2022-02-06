clc;
clear all;
%parameters
%K=[0.15;0.001;0.5;0.5;1.5;0.5;0.05;0;0.5;0.5;0.5;0.5;0.05]; %monofun
K=[0.1;0.0005;0.5;0.5;1.5;0.5;0.5;0.05;0.5;0.5;0.5;0.5;0.025]; %bifun
%Xo=[0 0 0 0 0 0 ]'; % initial condition
%Xo=[0.3 6 0.3 0.3 0.3 0.3]'; % initial condition
Xo=[0.3 5.5 0.3 0.3 0.3 0.3]'; % initial condition

tspan = 0:0.05:5000;
k1=[0.05;0.1;0.15;0.2;0.25;0.3];
k2=[0.3;0.25;0.2;0.15;0.1;0.05];
for i=1:length(k1)
   K(1)=k2(i); 
[t1,Y1] = ode45(@(t,X) EnvOmp6(t,X,K),tspan,Xo);
hold on
plot(t1,Y1(:,2));
end
