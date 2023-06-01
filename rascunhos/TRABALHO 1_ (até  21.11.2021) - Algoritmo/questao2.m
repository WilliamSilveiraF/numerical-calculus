clear
printf("\n Questão 2) \n")

n1=10; n2=20; n3=30;


i=1;                    #     3x(i)   +  2x(i+5)                       =  2 
    matrizA(i, i)   = 3;
    matrizA(i, i+5) = 2;
    matrizB(i, 1)   = 2;

for i = 2:n1-1          #      x(i-1) +  3x(i)   +   2x(i+5)           = -2 
    matrizA(i, i-1) =  1;
    matrizA(i, i)   =  3;
    matrizA(i, i+5) =  2;
    matrizB(i, 1)   = -2;
end

for i = n1:n2-1         #     2x(i-4) +  4x(i)   +    x(i+1)           =  3 
    matrizA(i, i-4) = 2;
    matrizA(i, i)   = 4;
    matrizA(i, i+1) = 1;
    matrizB(i, 1)   = 3;
end

i = n2;                 #      x(i-1) +  6x(i)   -    x(i+4)           = -2 
    matrizA(i, i-1) =  1;
    matrizA(i, i)   =  6;
    matrizA(i, i+4) = -1;
    matrizB(i, 1)   = -2;
    
for i = n2+1:n3-1       #      x(i-3) +   x(i-1) +  7*x(i)  +  2x(i+1) =  5 
    matrizA(i, i-3) = 1;
    matrizA(i, i-1) = 1;
    matrizA(i, i)   = 7;
    matrizA(i, i+1) = 2;
    matrizB(i, 1)   = 5;
end

i = n3;                 #     2x(i-10)+              5x(i)             = -5 
    matrizA(i, i-10) =  2;
    matrizA(i, i)    =  5;
    matrizB(i, 1)    = -5;

A = matrizA;
B = matrizB;

x = metodoLUCrout(A, B)
max_residuo = max(abs(A * x - B))

total_operacoes = (4*n3^3 + 15*n3^2 - 7*n3 - 6)/6