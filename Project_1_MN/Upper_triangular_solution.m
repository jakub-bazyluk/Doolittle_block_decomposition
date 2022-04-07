function [x] = Upper_triangular_solution(U, b)
% solve Ux = b for x, where U is upper triangular square matrix and b is a vector
% author: Jakub Bazyluk
% in: U, b; out: x
% example: 
% x = Upper_triangular_solution([1 3 4; 0 2 3; 0 0 1], [1;2;3])
% x = [-0.5;-3.5;3]

n = size(b,1);
x = zeros(n,1);
if U(n,n) ~= 0
    x(n) = b(n)/U(n,n);
else
    if b(n) ~= 0
        error("No solutions")
    end
end
  for i = (n-1):-1:1
      b = b(1:i) - U(1:(i), (i+1))*x(i+1);
      if U(i,i) ~= 0
        x(i) = b(i)/U(i,i);
      else
        if b(i) ~= 0
            error("No solutions")
        end
      end
  end
end