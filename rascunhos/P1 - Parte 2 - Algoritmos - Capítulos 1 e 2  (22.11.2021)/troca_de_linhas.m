function L = troca_de_linhas(k, L, A, B, N)
#precisamos descobrir qual é o maior valor da coluna k(Lmax) e onde ele está (imax)
[Lmax, imax] = max(abs(L(k:N,1)));
#vamos trocar a linha k pela linha imax e vice-versa
temp = L(k, :) #armazenamento da linha k;
L(k, :) = L(imax,:);
L(imax,:) = temp;
end