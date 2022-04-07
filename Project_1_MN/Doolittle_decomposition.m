function [L,U] = Doolittle_decomposition(A)
% decompose A to LU, where A is a square matrix, U is upper triangular
% matrix, L is lower triangular matrix and A + LU
% author: Jakub Bazyluk
% in: A; out: L, U
% example:
% [L U] = Doolittle_decomposition([1 3 4; 4 2 3; 9 1 1])
% L = [1,0,0;4,1,0;9,2,1]; U = [1,3,4;0,-10,-13;0,0,-1.2]

n = size(A, 1);
 L = eye(n);
 U = A;
 for i = 1:(n-1)
     if A(i,i) ~= 0
        Li = eye(n);
        Li((i+1):end, i) = -A((i+1):end, i)/A(i,i);
        A = Li*A;
        U = Li*U;
        L = L*(-Li + 2*eye(n));
     end
 end
end
