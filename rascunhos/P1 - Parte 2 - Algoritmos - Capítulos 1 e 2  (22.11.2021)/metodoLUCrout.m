function x = metodoLUCrout(A, B)
N = size(A, 1); #numero de equações

# primeira fase - decomposição LU Crout da matriz A
# Uii = 1 para todo i = 1, 2, 3 ... N
for i = 1:N
    U(i, i) = 1; #coloca 1 na diagonal principal de U
end

# passo k = 1
# li1 = ai1       para todo i = 1, 2, 3 ... N
# u1j = a1j / l11 para todo j = 2, 3 ... N


L(1:N, 1) = A(1:N, 1);
#vamos criar uma função que troque linhas de modo que o Lii da diagonal principal seja não nulo
L = troca_de_linhas(1, L, A, B, N)
U(1, 2:N) = A(1, 2:N) / L(1, 1);

# passo k = 2, 3, 4 até N-1
# Lij =              Aij - somatorio(Lir * Urj, r = 1 a j-1)  para todo i = k, k+1, ... N e j = k
# Uij = (1 / Lii) * (Aij - somatorio(Lir * Urj, r = 1 a i-1)) para todo j = k+1, k+2,...N e i = k

for k = 2:N-1

# Lij = aij - somatorio(Lir * Urj, r = 1 a j-1) para todo i = k, k+1, ... N e j = k
    for i = k:N
        L(i, k) = A(i, k) - sum(L(i, 1:k-1) * U(1:k-1, k));
    end
    
# Uij = (1 / Lii) * (Aij - somatorio(Lir * Urj, r = 1 a i-1)) para todo j = k+1 até N e i = k
    for j = k+1:N
        U(k, j) =  ( A(k, j) - sum(L(k, 1:k-1) * U(1:k-1, j)) ) / L(k, k);
    end
end

# último passo k = N
# Lij = aij - somatorio(Lir * Urj, r = 1 a j-1) para todo i = N e j = N
   L(N, N) = A(N, N) - sum(L(N, 1:N-1) * U(1:N-1, N));

L
U

VERIFICA=L*U-A;

# segunda fase - determinação do x a partir da matriz LU
# L * c = B
# c1 = B1 / l11
c(1)=B(1)/L(1,1);
# ci = (bi - somatorio (Lij*cj, j=1,2,3,... i-1))/lii para todo i =2,3,4, N #estava j=1:N-1
for i =2:N
i;
L(i,1:i-1);
c(1:i-1);
 c(i) = (B(i) - sum(L(i,1:i-1).*c(1:i-1)))/L(i,i); 
end
c
# U * x = c
# A ultima equação é 1*xn = cn
x(N) = c(N);
# As linhas superiores: i=n-1, i=n-2 ... 1
# xi=ci-somatorio(uij*xj, com j=i+1 até n)
for i = N-1:-1:1 #passo decrescente -1
    x(i) = c(i) - sum(U(i,i+1:N).*x(i+1:N)); #CORREÇÃO SOLICITADA NA DEFESA DA PROVA, PARA NÃO IMPRIMIR OS X
end
x = transpose(x);
end