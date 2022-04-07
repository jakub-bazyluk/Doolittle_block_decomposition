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