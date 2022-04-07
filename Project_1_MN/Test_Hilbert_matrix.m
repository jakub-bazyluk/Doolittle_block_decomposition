% Test 3.  one Hilbert matrix
k = 20;
epsilon = 10^(-8);
A = hilb(k);
B = randi(100, [k,k]);
C = randi(100, [k,k]);
b = randi(100, [2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "Hilbert matrix")