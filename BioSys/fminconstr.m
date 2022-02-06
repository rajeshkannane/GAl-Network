function [c,ceq] = fminconstr(X,K)

c = []; % no nonlinear inequality
ceq = EnvOmp(X,K); % the fsolve objective is fmincon constraints
end