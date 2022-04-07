function [x] = Doolittle_solution(A11, A21, A22,b)
% solve [A11, I; A21, A22]x = b for x, where A11, A21, A22 are p dim
% square matrices, I is identity matrix, b is a vector
% author: Jakub Bazyluk
% in: A11, A21, A22, b; out: x
% example: 
% x = Doolittle_solution([1 2; 1 3], [3 6; 3 1],[2 4; 0 1], [1;2;3;4])
% x = [-3.666666666666667;0.333333333333333;4;1]

[L, U1, U2, U3] = Doolittle_block_decomposition(A11, A21, A22);
n = size(b,1);
y1 = b(1:(n/2),1);
y2 = b((n/2+1):end,1) - L*y1;
[L_, U_] = Doolittle_decomposition(U3);
t = Lower_triangular_solution(L_,y2);
x2 = Upper_triangular_solution(U_,t);
[L_, U_] = Doolittle_decomposition(U1);
t = Lower_triangular_solution(L_, y1 - U2*x2);
x1 = Upper_triangular_solution(U_,t);
x = [x1;x2];
end
