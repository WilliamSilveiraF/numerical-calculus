
#questão 4 do trabalho 1:
#for i=1;         #         x(i)+x(i+1) = -1.00;
#for i=2:n1       # x(i-1)+2x(i)+x(i+1) = 1.00;
#for i=n1+1:n2-1  # x(i-1)+3x(i)+x(i+1) = 2.00;
#for i=n2;        # x(i-1)+4x(i)        = 3.00; (n1=10 e n2=30 equações)

n1=10;n2=30; #(numero de equações)
#for i=1;         #               x(i)+         x(i+1) =-1.00;
#for i=1;         #        A(i,i)*x(i)+A(i,i+1)*x(i+1) = B(i);
 for i=1;                  A(i,i)=1;   A(i,i+1)=1;       B(i)=-1; end

#for i=2:n1       #         x(i-1)+2      x(i)+         x(i+1) = 1.00;
#for i=2:n1       #A(i,i-1)*x(i-1)+A(i,i)*x(i)+A(i,i+1)*x(i+1) = B(i);
 for i=2:n1        A(i,i-1)=1;     A(i,i)=2;   A(i,i+1)=1;       B(i)=1;end
 
#for i=n1+1:n2-1  #         x(i-1)+3      x(i)+         x(i+1) = 2.00;
#for i=n1+1:n2-1  #A(i,i-1)*x(i-1)+A(i,i)*x(i)+A(i,i+1)*x(i+1) = B(i);
 for i=n1+1:n2-1   A(i,i-1)=1;     A(i,i)=3;   A(i,i+1)=1;       B(i)=2;end

#for i=n2;        #         x(i-1)+4      x(i)        = 3.00; (n1=10 e n2=30 equações)
#for i=n2;        #A(i,i-1)*x(i-1)+A(i,i)*x(i)        = B(i); (n1=10 e n2=30 equações)
 for i=n2;         A(i,i-1)=1;     A(i,i)=4;            B(i)=3;end

A;
B=transpose(B);
#x=A\B


#Como a matriz é esparsa de tridiagonal, vamos usar o metodo otimizado de eliminação Gaussina, 
# de modo que o armazenamento seja por 4 vetores (t,r,d,b) e as operações ocorram somente com os 
# coeficientes nao nulos
for i=1:n2    r(i)=A(i,i);   end
for i=2:n2    t(i)=A(i,i-1); end
for i=1:n2-1  d(i)=A(i,i+1); end
t;
r;
d;
b=B;
x=GaussOtimizadoTRID(n2,t,r,d,b)

residuo_max=max(abs(A*x-B))








