% Copyright 2015, All Rights Reserved
% Code by Steven L. Brunton
% For Paper, "Discovering Governing Equations from Data: 
%        Sparse Identification of Nonlinear Dynamical Systems"
% by S. L. Brunton, J. L. Proctor, and J. N. Kutz

clear all, close all, clc
figpath = '../figures/';
addpath('./utils');

%% generate Data
polyorder = 1;  % search space up to fifth order polynomials
usesine = 0;   % no trig functions
n = 1;          % 2D system
A = [1];  % dynamics
rhs = @(x)A*((exp(-x./(1+x)).*(1./(1+(x.^(1.29)))))+x);   % ODE right hand side
tspan=[0:.01:25];   % time span
x0 = [1];        % initial conditions
options = odeset('RelTol',1e-10,'AbsTol',1e-10*ones(1,n));
[t,x]=ode45(@(t,x)rhs(x),tspan,x0,options);  % integrate

%% compute Derivative 
eps = .05;      % noise strength
for i=1:length(x)
    dx(i,:) = A*((exp(-x(i,:)./(1+x(i,:))).*(1./(1+(x(i,:).^(1.29)))))+x(i,:))';
end
dx = dx + eps*randn(size(dx));   % add noise

%% pool Data  (i.e., build library of nonlinear time series)
Theta = poolnew(x,n,polyorder,usesine);
m = size(Theta,2);

%% compute Sparse regression: sequential least squares
lambda = 0.5;      % lambda is our sparsification knob.
Xi = sparsifyDynamics(Theta,dx,lambda,n)

%% integrate true and identified systems
[tA,xA]=ode45(@(t,x)rhs(x),tspan,x0,options);   % true model
[tB,xB]=ode45(@(t,x)sparsenew(t,x,Xi,polyorder,usesine),tspan,x0,options);  % approximate

%% FIGURES!!


Error = mean((xA-xB).^2)

figure
dtA = [0; diff(tA)];
plot(xA(:),'r','LineWidth',1.5);
hold on
dtB = [0; diff(tB)];
plot(xB(:),'k--','LineWidth',1.2);
xlabel('x_1','FontSize',13)
ylabel('x_2','FontSize',13)
l1 = legend('True','Identified');

figure
plot(tA,xA(:),'r','LineWidth',1.5)
hold on
plot(tA,xA(:),'b-','LineWidth',1.5)
plot(tB(1:10:end),xB(1:10:end),'k--','LineWidth',1.2)
hold on
plot(tB(1:10:end),xB(1:10:end),'k--','LineWidth',1.2)
xlabel('Time')
ylabel('State, x_k')
legend('True x_1','True x_2','Identified')