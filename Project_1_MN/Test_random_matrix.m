k = 20;
epsilon = 10^(-8);
A = rand([k,k]);
B = rand([k,k]);
C = rand([k,k]);
b = rand([2*k,1]);

Test_Doolittle_inside(A,B,C,b,epsilon, "random matrix")