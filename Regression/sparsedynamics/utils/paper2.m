function dy = paper2(t,y)
% Copyright 2015, All Rights Reserved
% Code by Steven L. Brunton
% For Paper, "Discovering Governing Equations from Data: 
%        Sparse Identification of Nonlinear Dynamical Systems"
% by S. L. Brunton, J. L. Proctor, and J. N. Kutz

dy = [
((-4*y(1))./(1+y(3).^1.29))+(-6*((y(1))./(1+y(1).^4)));
(-4*y(1)./(1+y(2)));
y(3)+(8*(y(1))./(1+y(3).^1.29));
];

