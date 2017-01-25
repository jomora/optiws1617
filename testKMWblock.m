function testKMWblock(userFunction)
tol=1e-6;

n=5;
eps=.15;



testA = ...
  [1 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
   0.15 1 0 0 0 0 1 0 0 0 0 0 0 0 0;
   0 0.15 1 0 0 0 0 1 0 0 0 0 0 0 0;
   0 0 0.15 1 0 0 0 0 1 0 0 0 0 0 0;
   0 0 0 0.15 1 0 0 0 0 1 0 0 0 0 0;
   -1 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
   0.15 -1 0 0 0 0 0 0 0 0 0 1 0 0 0;
   0 0.15 -1 0 0 0 0 0 0 0 0 0 1 0 0;
   0 0 0.15 -1 0 0 0 0 0 0 0 0 0 1 0;
   0 0 0 0.15 -1 0 0 0 0 0 0 0 0 0 1];

testb = [1; 1; 1; 1; 1; -0.15; 0; 0; 0; 0];

testB = [1 2 3 4 5 6 7 8 9 10];

testc = [0; 0; 0; 0; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];


[A,b,c,B]=userFunction(n,eps);



resA=norm(A-testA);
resb=norm(b-testb);
resc=norm(c-testc);
resB=numel(setdiff(testB,B));

fprintf('\n Teste mit n=%d und eps= %g \n',n,eps);
fprintf('------------------------------------\n');
if resA<tol
    fprintf('Matrix: OK \n');
else 
    fprintf('Matrix: falsch, Fehler: %d \n', resA);
end

if resb<tol
    fprintf('rechte Seite: OK \n');
else 
    fprintf('rechte Seite: falsch, Fehler: %d \n', resb);
end

if resc<tol
    fprintf('Zielfunktion: OK \n');
else 
    fprintf('Zielfunktion: falsch, Fehler: %d \n', resc);
end

if resB==0
    fprintf('Startbasis: OK \n');
else
    fprintf('Startbasis: falsch, Fehler: %d Einträge \n', resB);
end



n=10;
eps=.3;


testA = ...
  [1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0.3 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
   -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
   0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
   0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
   0 0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
   0 0 0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
   0 0 0 0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
   0 0 0 0 0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
   0 0 0 0 0 0 0 0 0.3 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];

testb = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; -0.3; 0; 0; 0; 0; 0; 0; 0; 0; 0];

testB = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

testc = [0; 0; 0; 0; 0; 0; 0; 0; 0; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; ...
         0; 0; 0; 0; 0; 0; 0; 0; 0];


[A,b,c,B]=userFunction(n,eps);

resA=norm(A-testA);
resb=norm(b-testb);
resc=norm(c-testc);
resB=numel(setdiff(testB,B));
fprintf('\n Teste mit n=%d und eps= %g \n',n,eps);
fprintf('------------------------------------\n');
if resA<tol
    fprintf('Matrix: OK \n');
else 
    fprintf('Matrix: falsch, Fehler: %d \n', resA);
end

if resb<tol
    fprintf('rechte Seite: OK \n');
else 
    fprintf('rechte Seite: falsch, Fehler: %d \n', resb);
end

if resc<tol
    fprintf('Zielfunktion: OK \n');
else 
    fprintf('Zielfunktion: falsch, Fehler: %d \n', resc);
end

if resB==0
    fprintf('Startbasis: OK \n');
else
    fprintf('Startbasis: falsch, Fehler: %d Einträge \n', resB);
end

