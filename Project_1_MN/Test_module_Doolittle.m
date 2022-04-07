k = 40;
timem = 0;
epsilon = 10^(-8);
for i = 1:100
    tic;
    A = randi(100, [k,k]);
    B = randi(100, [k,k]);
    C = randi(100, [k,k]);
    if ~DBD(A, B, C, epsilon)
        error("Test with a random matrix didn't work.")
    end
    time = toc;
    if time > timem
        timem = time;
    end
end
fprintf("Test Doolittle_block_decomposition passed in %fs.\n", timem)

%%% 

timem = 0;
for i = 1:100
    tic;
    A = randi(100, [k,k]);
    if ~DD(A, epsilon)
        error("Test with a random matrix didn't work.")
    end
    time = toc;
    if time > timem
        timem = time;
    end
end
fprintf("Test Doolittle_decomposition passed in %fs.\n", timem)

%%%
timem = 0;
for i = 1:100
    tic;
    L = tril(randi(100, [k,k]));
    b = randi(100, [k 1]);
    if ~LT(L, b, epsilon)
        error("Test with a random matrix didn't work.")
    end
    time = toc;
    if time > timem
        timem = time;
    end
end
fprintf("Test Lower_triangular_solution passed in %fs.\n", timem)

%%%
timem = 0;
for i = 1:100
    tic;
    U = triu(randi(100, [k,k]));
    b = randi(100, [k 1]);
    if ~UT(U, b, epsilon)
        error("Test with a random matrix didn't work.")
    end
    time = toc;
    if time > timem
        timem = time;
    end
end
fprintf("Test Upper_triangular_solution passed in %fs.\n", timem)

function [assert] = DBD(A11, A21, A22, epsilon)
[L, U1, U2, U3] = Doolittle_block_decomposition(A11, A21, A22);
p = size(L, 1);
assert = norm([eye(p) zeros(p); L eye(p)]*[U1 U2; zeros(p) U3] - [A11 eye(p); A21 A22]) < epsilon;
end

function [assert] = DD(A, epsilon)
[L, U] = Doolittle_decomposition(A);
assert = norm(L*U - A) < epsilon;
end

function [assert] = LT(L, b, epsilon)
assert = L * Lower_triangular_solution(L, b) - b < epsilon;
end

function [assert] = UT(U, b, epsilon)
assert = U * Upper_triangular_solution(U, b) - b < epsilon;
end