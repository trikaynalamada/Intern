function [t, x_true, x_int] = solver(epsilon, alpha, delta_t, x0, y0, t_start, t_end, A)
    [t_long, x_long, y_long] = ...
        diff_solver(epsilon, alpha, 0.0001, x0, y0, t_start, t_end, A);
    [t, x_int, y_int] = int_solver(epsilon, alpha, delta_t, x0, y0, t_start, t_end, A);
    x_true = spline(t_long,x_long,t);
    