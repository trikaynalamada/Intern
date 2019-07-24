% integral model solver
function [t_all, x_all, y_all] = int_solver(epsilon, alpha, delta_t, ...
    x0, y0, t_start, t_end, A)
    t_all = t_start:delta_t:t_end;    % row vector
    K = diff(atan(t_all));    % row vector
    x_all = zeros(size(t_all)); x_all(1) = x0;
    y_all = zeros(size(t_all)); y_all(1) = y0;
    for k1 = 2:size(t_all,2)
        [x_all(k1), y_all(k1)] = step_forward(epsilon, alpha, ...
            delta_t, x_all(1:(k1-1)), y_all(1:(k1-1)), A, K(1:(k1-1)));
    end
end

function [x_new, y_new] = step_forward(epsilon, alpha, delta_t, ...
    x_pre, y_pre, A, K_pre)
    x = x_pre(end);
    y = y_pre(end);
    y_new = exp(-A*delta_t/epsilon)*y + g(x,y)/A*(1 - exp(-A*delta_t/epsilon));
    x_new = x + delta_t * (f(x,y_new) + fliplr(K_pre)*x_pre');
end