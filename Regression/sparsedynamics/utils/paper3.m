function dy = paper(t,y)
% Copyright 2015, All Rights Reserved
% Code by Steven L. Brunton
% For Paper, "Discovering Governing Equations from Data: 
%        Sparse Identification of Nonlinear Dynamical Systems"
% by S. L. Brunton, J. L. Proctor, and J. N. Kutz

dy = [
(-1*(y(2).^2)./(1+y(2).^2))+(-6*((y(1))./(1+y(1)+y(2))));
(-1./(1+y(1).^5))+(-6*((y(2))./(1+y(1)+y(2))));
];

