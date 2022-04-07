function [x] = Lower_triangular_solution(L, b)
% solve Lx = b for x, where L is lower triangular square matrix and b is a vector
% author: Jakub Bazyluk
% in: L, b; out: x
% example: 
% x = Lower_triangular_solution([1 0 0; 4 1 0; 6 2 1], [1;2;3])
% x = [1; -2; 1]

n = size(b,1);
x = zeros(n,1);
x(1) = b(1);
for i = 2:n
    b = b(2:end) - L(i:n, (i-1))*x(i-1);
    x(i) = b(1);
end
end