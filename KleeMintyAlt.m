function [A,b,c,B]=KleeMintyAlt(n,eps)
%function [A,b,c,B]=KleeMintyAlt(n,eps)
%
% Erzeugt Klee-Minty-Würfel in Standardform, Reihenfolge: alternierend
%
% Input:    n      - Dimension
%           eps    - Parameter, der die "Verschiebung des Würfels"
%           beschreibt
%
% Output:  A, b, c - Daten für KMW in primaler Standardform
%                      min c'x s.t. Ax=b, x>=0
%					mit b>=0
%           B      - zulässige Basis, die die Ecke (eps,...,eps^n) codiert
%
% Autoren: Vladyslav Yushchenko, Jonas Molina Ramirez, Florian Beck

%% Test Data
% clear;
% n = 5;
% eps = 0.2;

%% check if n >= 1

if(n< 1)
   error('n must be greater zero.'); 
end
%%
A = [zeros(2*n,n) eye(2*n)];
A(1:2,1) = [1;-1];

%% 
b = zeros(2*n,1);
b(1:2) = [1; -eps];

%%
teilmatrix_A = [eps 1; eps -1];
for i = 1:n-1
    A(2*i+1:2*i+2,i:i+1) = teilmatrix_A;
    b(2*i+1) = 1;
end

%%
c = zeros(3*n,1);
c(n) = -1;

%% Compute B
B = [1:n find(b' == 1)+n];

return;

