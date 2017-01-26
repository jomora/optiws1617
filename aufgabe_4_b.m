%%
clc;
clear;
n = 3;
eps = 0.1;

[A,b,c,B]=KleeMintyAlt(n,eps);
primalSimplex(A,b,c,B);
% 
% %%
% [A,b,c,B]=KleeMintyBlock(n,eps);
% primalSimplex(A,b,c,B);

%% 4 b iii)
clc;
clear;
n = 3;
eps = 0.1;

[A,b,c,B]=KleeMintyAlt(n,eps);
[Bx,xB,message,iter] = phase1(A,b,c);
primalSimplex(A,b,c,Bx);

%% 4 c)

clc;
clear;
eps = 0.4;

iterations_alt = zeros(1,15);
iterations_block = zeros(1,15);

for n = 1:15
    [A,b,c,B]=KleeMintyAlt(n,eps);
    [Bx,xB,message,iter]= primalSimplex(A,b,c,B);
    iterations_alt(n) = iter; 
    [A,b,c,B]=KleeMintyBlock(n,eps); 
    [Bx,xB,message,iter] = primalSimplex(A,b,c,B);
    iterations_block(n) = iter;
end

'Iterations alt:'
iterations_alt


'Iterations block:'
iterations_block

