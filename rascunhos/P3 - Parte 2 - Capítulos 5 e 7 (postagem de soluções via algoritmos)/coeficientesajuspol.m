function a = coeficientesajuspol(x,y,n)
#a matriz A multiplicando o vetor de incognitas a igual ao vetor B
for i =1:n+1
    for j =1:n+1
        A(i,j) = sum(x.^(i+j-2)); #forma nao otimizada
    end
end
A;
for i=1:n+1
    B(i) = sum(x.^(i-1).*y);
end
B = transpose(B);
#A*a=B
a = A \ B;
end
