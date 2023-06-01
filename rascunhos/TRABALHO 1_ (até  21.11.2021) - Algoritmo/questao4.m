clear
printf("\n Questão 4) \n")

n1=10;
n2=30;

for i=1;
    A(i,i)  = 1;
    A(i,i+1)= 1;
    B(i)    =-1;
end

for i=2:n1;
    A(i,i-1)= 1;
    A(i,i)  = 2;
    A(i,i+1)= 1;
    B(i)    = 1;
end

for i=n1+1:n2-1;
    A(i,i-1)= 1;
    A(i,i)  = 3;
    A(i,i+1)= 1;
    B(i)    = 2;
end

for i=n2;
    A(i,i-1)= 1;
    A(i,i)  = 4;
    B(i)    = 3;
end

B=transpose(B);

for i=1:n2;
    r(i) = A(i,i);
end

for i=2:n2;
    t(i) = A(i,i-1);
end

for i=1:n2-1;
    d(i) = A(i,i+1);
end

b = B;

solucao = GaussOtimizadoTRID(n2,t,r,d,b)
residuoMaximo = max(abs(A*solucao-B))
