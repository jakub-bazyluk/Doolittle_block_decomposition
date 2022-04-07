% Test 6. Double magic matrix
k = 20;
epsilon = 10^(-8);
A = magic(k);
C = magic(k);
B = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "double magic matrix")
