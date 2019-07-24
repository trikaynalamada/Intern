clc, close all, clear all

%% parameters
epsilon = 0.01;
alpha = 0.5;
delta_t = 0.01;

x0 = 2;
y0 = 2;
t_start = 0;
t_end = 1;
A = 1;

% parameter list: epsilon, alpha, delta_t, x0, y0, t_start, t_end, A

%% error vs t
[t, x_true, x_int] = solver(epsilon, alpha, delta_t, x0, y0, t_start, t_end, A);

figure
plot(t, x_true, 'k');
hold on
plot(t, x_int, 'r');

figure
plot(t, abs(x_int-x_true), 'k');

%% error vs epsilon
epsilon_ = logspace(-4,-1);
err = zeros(size(epsilon_));
for k1 = 1:size(epsilon_,2)
    [t, x_true, x_int] = solver(epsilon_(k1), alpha, delta_t, x0, y0, t_start, t_end, A);
    err(k1) = abs(x_int(end)-x_true(end));
end
figure
loglog(epsilon_, err);
xlabel('epsilon')
ylabel('error')

%% error vs delta_t
delta_t_ = logspace(-4,-1);
err = zeros(size(delta_t_));
for k1 = 1:size(delta_t_,2)
    [t, x_true, x_int] = solver(epsilon, alpha, delta_t_(k1), x0, y0, t_start, t_end, A);
    err(k1) = abs(x_int(end)-x_true(end));
end
figure
loglog(delta_t_, err);
xlabel('delta t')
ylabel('error')
