function [ xopt,B,message, iter ] = primalSimplex( A,b,c,B)
%function [ xopt,B,message, iter] = primalSimplex( A,b,c,B)
%
% Primales Simplexverfahren mit Bland-Auswahlegel
%
% Input:  A, b, c - Daten für LP in primaler Standardform
%                      min c'x s.t. Ax=b, x>=0
%         B,      - primal zulaessige Basis
% Output: xopt    - optimale Lsg
%         B       - zugehörige Basis
%         message - Information über Optimallösung oder Unbeschraenktheit
%         iter    - Anzahl der Iterationen
%
% Autoren: Vladyslav Yushchenko, Jonas Molina Ramirez, Florian Beck

%%  Test data: remove before submission
% clear;
% A = [1 0 1 1 0 0;
%      1 1 0 0 1 0;
%      1 2 0 0 0 1];
% b = [8 7 12]';
% c = [-3 -2 -2 0 0 0]';
% B = [4 5 6];

%% Check compatibility of dimensions
size_b = size(b);
size_A = size(A);
size_c = size(c);
%%
if(size_b(1) ~= size_A(1))
   error('Dimensions of A and b are incompatible.')  
end
if(size_c(1) ~= size_A(2))
   error('Dimensions of A and c are incompatible.')  
end

% Check full rank of matrix A
rank_A = rank(A);
if(size_A(1) ~= rank_A)
    error('A does not have full row rank.');
end

%% Check is basis is "primal zulässig"
if(size(B') ~= size_b & size(B) ~= size_b)
    error('Basis B must have size m');
end
%%
xB = A(:,B)\b;
x = zeros(size_A(2),1);
x(B) = xB;
x_old = x;
iter = 0;
eps = 10^-6;

%% Initialize output parameters
xopt = x;
message = '';
%%
if(any(xB < 0))
   error('Basis is not acceptable.');
end

%% Simplex algorithm
N = setdiff(1:size_A(2),B);

%%
while (iter == 0  || norm(x_old - x) > eps)
  
%% BTRAN
y = A(:,B)'\c(B);
%% Pricing
z = c(N) - A(:,N)'*y;
if(all(z >= 0))
   xopt = x;
   message = 'Optimum is found';
   return;
end
% j is the position of element in N, that leaves the basis
% j = find(z<0,1);
j = min(N(z <0));

%% FTRAN
w = A(:,B)\A(:,j);
%% Ratio-Test
if(all(w <= 0))
   xopt = x;
   message = 'LP is unlimited';
   return;
end
% compute all values, then choose element with w>0
xB = x(B);
gammas = xB./w;
gamma = min(gammas(w>0));

Bi = min(B(gammas==gamma));
i = find(B==Bi);
%% Update
x_old = x;
xB = xB - gamma*w;
% update also complete solution
x(B) = xB;
N(N == j) = Bi;
B(i) = j;
x(j) = gamma;
% N = sort(N);
iter = iter + 1;

%%
end
