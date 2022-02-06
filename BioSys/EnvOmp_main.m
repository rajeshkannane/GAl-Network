%main function

clc;
clear all;
%parameters
K=[0.1;0.001;0.5;0.5;1.5;0.5;0.5;0.05;0.05;0.025;0.5;0.5;0.5;0.5;0.025];
%parameter Study
K1=0:0.01:0.4;
for i=1:1:length(K1)
K(1)=K1(i);
%initial condition
X0=[0.17;0;6;0;0;0;0;0;0];
%time
tspan=[0:500];
%opts.Algorithm='levenberg-marquardt';
[t,Y]=ode15s(@(t,X) EnvOmpode(t,X,K),tspan,X0);

plot(t,Y(:,4))
hold on
end

