%main function

clc;
clear all;
%Case1
%parameters
K=[0.1;0.01;0.5;0.5;1.5;0.5;0.5;0.05;0.5;0.5;0.5;0.5;0.025];

%parameter Study
K1=0:0.001:0.4;
for i=1:1:length(K1)
K(1)=K1(i);
%initial condition
X0=[0.3,0.3,0.3,0.3,0.3,0.5,0.5,0.5,0.5];
opts.Algorithm='levenberg-marquardt';
Y(:,i)=fsolve(@(X) EnvOmpbi(X,K),X0);
end
figure
plot(K1,Y(4,:));
hold on
%Case 2
%parameters
K=[0.1;0.01;0.5;0.5;1.5;0.5;0.05;0;5;0.5;0.5;0.5;0.05];

K2=0:0.001:0.4;
for i=1:1:length(K2)
K(1)=K2(i);
%initial condition

X0=[0,0,0,0,0,0,0,0,0];

opts.Algorithm='levenberg-marquardt';

Y2(:,i)=fsolve(@(X) EnvOmp(X,K),X0,opts);

end

plot(K2,Y2(4,:));
hold on

%%
%Case 3
%parameters
K=[0.1;0.01;0.5;0.5;1.5;0.5;0.05;0;0.5;0.5;0.5;0.5;0.05];
%parameter Study

K3=0:0.001:0.4;
for i=1:1:length(K3)
K(1)=K3(i);
%initial condition
X0=[0.3,4,0.3,4,0.3,4,0,0.3,5];

opts.Algorithm='levenberg-marquardt';

Y3(:,i)=fsolve(@(X) EnvOmp(X,K),X0,opts);
end
hold on
plot(K3,Y3(4,:));

%Case 4
%parameters
K=[0.1;0.01;0.5;0.5;1.5;0.5;0.05;0;0.5;0.5;0.5;0.5;0.05];

%parameter Study
K4=0:0.001:0.4;
for i=1:1:length(K4)
K(1)=K4(i);
%initial condition

X0=[0,0,0,0,0,0,0,0,0];

opts.Algorithm='levenberg-marquardt';

Y4(:,i)=fsolve(@(X) EnvOmp(X,K),X0,opts);

end
hold on
plot(K4,Y4(4,:));
xlabel('kap s-1');
ylabel('RR-P muM');
legend('Bifunc','Monofunc(10fold)','Monofunc','Monofunc')
