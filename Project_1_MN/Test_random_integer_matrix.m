% Test 1. Random integer matrix
k = 20;
epsilon = 10^(-8);
A = randi(100, [k,k]);
B = randi(100, [k,k]);
C = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "random integer matrix")