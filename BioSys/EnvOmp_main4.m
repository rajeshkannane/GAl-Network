%main function

clc;
clear all;
close all;
%parameters
K=[0.1;0.01;0.5;0.5;1.5;0.5;0.05;0;0.05;0.5;0.5;0.5;0.05];
lb = [0,0,0,0,0,0,0,0,0];
Aeq=[1,1,0,0,1,1,1,0,0;
    0,0,1,1,1,1,1,0,1;
    0,0,0,0,0,0,0,1,1];
beq=[0.17;6;0];
rng default
%x0 = 100*randn(2,1);
%[x,res] = lsqnonlin(@fbnd,x0,lb)
%parameter Study
%K1=0:0.001:0.4;
K1=0:0.001:0.4;
for i=1:1:length(K1)
K(1)=K1(i);
%initial condition
%X0 = 2*randn(9,1);
%X0=[0,1,0,1,1,1,1,1,1];
%X0=[1,1,1,1,1,1,1,1,1];
X0=[0,0,0,0,0,0,0,0,0];
%X0=[0.3,4,0.3,4,0.3,4,0,0.3,5];
%X0=[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5];
opts.Algorithm='levenberg-marquardt';
%opts.Algorithm = 'trust-region';
Y(:,i)=fsolve(@(X) EnvOmp(X,K),X0,opts);
%opts = optimoptions(@fmincon,'Algorithm','interior-point','Display','off');
%Y(:,i) = fmincon(@(X)0,X0,[],[],Aeq,beq,lb,[],@(X) fminconstr(X,K),opts);
%[Y(:,i),res(:,i)]=lsqnonlin(@(X) EnvOmp(X,K),X0,lb);
end

plot(K1,Y(4,:));
xlabel('kap s-1');
ylabel('RR-P muM');
