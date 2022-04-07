% NOTE: The implemented method doesn't work well with sparse matrices

% Test 1. Random integer matrix
k = 20;
epsilon = 10^(-8);
A = randi(100, [k,k]);
B = randi(100, [k,k]);
C = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "random integer matrix")

% Test 2. Random matrix
k = 20;
epsilon = 10^(-8);
A = rand([k,k]);
B = rand([k,k]);
C = rand([k,k]);
b = rand([2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "random matrix")

% Test 3.  one Hilbert matrix
k = 20;
epsilon = 10^(-8);
A = hilb(k);
B = randi(100, [k,k]);
C = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "Hilbert matrix")
% Huge difference in favor of self-implemented method

% Test 4. magic matrix
k = 20;
epsilon = 10^(-8);
A = magic(k);
B = randi(100, [k,k]);
C = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "magic matrix")
% Huge difference in favor of self-implemented method

% Test 5. zero matrix
k = 20;
epsilon = 10^(-8);
B = zeros(k);
A = randi(100, [k,k]);
C = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "zero matrix")
% Test 6. Double magic matrix
k = 20;
epsilon = 10^(-8);
A = magic(k);
C = magic(k);
B = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "double magic matrix")


function [] = Test_Doolittle_inside(A,B,C,b, epsilon, type)
k = size(A,1);
tic;
matlab = norm([A eye(k); B C]*Doolittle_solution(A,B,C,b) - b);
time_matlab = toc;
tic;
self = norm([A eye(k); B C]*([A eye(k); B C]\b) - b);
time_self = toc;
if self > epsilon
    error("Test with a random matrix didn't work.")
end
fprintf("Test with %s passed in %fs with error %s\n, MatLab built-in function in %fs with error %s\n.", ...
    type, time_self, self, time_matlab, matlab)
end