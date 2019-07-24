function dydt = langevin(t,y)
%LANGEVIN Summary of this function goes here
%   Detailed explanation goes here

dydt = [y(2); y(1) - 6*exp(t) + 6*t + 3*t.^2 + 6];


end

