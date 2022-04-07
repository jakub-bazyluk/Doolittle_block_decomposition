% Test 5. zero matrix
k = 20;
epsilon = 10^(-8);
B = zeros(k);
A = randi(100, [k,k]);
C = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "zero matrix")