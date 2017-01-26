%% Data from Übung 9
clc;
clear;
A = [1 1 -1 0 0;
     3 -1 0 0 0;
     4 2  0 1 0;
     4 2  0 0 1];
b = [1;20;100; 400];
c = [-2 -1 0 0 0]';

[ Bx, xB,message, iter ] = phase1(A,b,c)

%%
clc;
clear;
A = [1 1 1 0;
     2 1 0 -1;
     -1 1 0 0];
b = [8;2;3];
c = [-1 -2 0 0]';

[ Bx, xB,message, iter ] = phase1(A,b,c)
