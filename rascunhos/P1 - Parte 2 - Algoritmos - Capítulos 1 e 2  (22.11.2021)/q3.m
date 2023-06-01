n1=5; n2=10;
i=1   ;        #  3.1x(i)   - 2.5x(i+5)          = -2
matrizA(i, i)   =  3.1;
matrizA(i, i+5) = -2.5;
matrizB(i)      = -2;

for i=2:n1-1  # -0.9x(i-1) +   3x(i)- 2.1x(i+5) = -1.5
matrizA(i, i-1) = -0.9;
matrizA(i, i)   =  3;
matrizA(i, i+5) = -2.1;
matrizB(i)      = -1.5;
end

for i=n1:n2-1 # -2.3x(i-4)+  3.7x(i)- 1.1x(i+1) = -3
matrizA(i, i-4) = -2.3;
matrizA(i, i)   = 3.7;
matrizA(i, i+1) = -1.1;
matrizB(i)      = -3;
end

i=n2 ;         # -1.3x(i-1) + 5.2x(i)            =-2
matrizA(i, i-1) = -1.3;
matrizA(i, i)   = 5.2;
matrizB(i)      = -2;

B = transpose(matrizB)
x = metodoLUCrout(matrizA, B)
residuo_maximo = max(abs(matrizA*x - B))

numero_op_diretas = (4*n2^3 + 15*n2^2 - 7*n2 - 6)/6