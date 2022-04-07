function [L, U1, U2, U3] = Doolittle_block_decomposition(A11, A21, A22)
% decompose matrix [A11 I; A21 A22] to L'U, L' = [I 0; L I]; 
% U = [U1 U2; 0 U3], where A11, A21, A22, L, U1, U2, U3 are p dim
% square matrices, I is identity matrix, 0 is zero matrix
% author: Jakub Bazyluk
% in: A11, A21, A22; out: L, U1, U2, U3
% example:
% [L U1 U2 U3] = Doolittle_block_decomposition([1 2; 1 3], [3 5; 0 1],[2 2; 0 1])
% L = [4,-1;-1,1]; U1 = [1,2;1,3]; U2 = [1,0;0,1]; U3 = [-2,3;1,0]

p = size(A11, 1);
U1 = A11;
U2 = eye(p);
L = A21/A11;
if isnan(L)
    error("Cannot perform Doolittle's decomposition")
end
U3 = A22 - L;
end