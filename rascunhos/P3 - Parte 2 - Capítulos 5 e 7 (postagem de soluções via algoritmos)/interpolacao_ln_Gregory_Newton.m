function yi = interpolacao_ln_Gregory_Newton(a,b,xp)
n = 4; #grau do polinomio interpolador
h = (b-a)/n;
x = a:h:b;  #valores exatos da funcao que queremos aproximar
y = cos(x); #valores exatos da funcao que queremos aproximar

# vamos determinar os coeficientes a(i) da interpolacao escrita na base Gregory-Newton
#Pn(x)=a1+a2(x-x1)+a3(x-x2)(x-x1)+a4(x-x3)(x-x2)(x-x1)+a5(x-x4)(x-x3)(x-x2)(x-x1)... +an+1(x-xn)(x-xn-1)...(x-x1)

#coeficientes do interpolador polinomial de Gregory-Newton grau n
#diferença divida de primeira ordem sobre o ponto i = 1:n+1
for i = 1:n
    Div(i,1) = (y(i+1)-y(i))/(x(i+1)-x(i));
end#for

for k = 2:n
    for i = 1:n+1-k
        Div(i,k) = (Div(i+1,k-1)-Div(i,k-1))/(x(i+k)-x(i));
    end
end

a = [y(1),Div(1,1:n)]; #coeficientes do interpolador polinomial de Gregory-Newton grau n
# vamos agora calcular o valor do polinomio da base de Gregory-Newton em cada xp

# yi = a(1) + sum (a(i),i=2:n+1 * produtorio((xp-x(j)),j=1:n) ) )

for k = 1:length(xp);
    yi(k) = a(1);
    
    for i = 2:n+1;
        produt = 1;
        for j = 1:i-1;
            produt = produt*(xp(k)-x(j));
        end
        yi(k) = yi(k) + a(i)*produt;
    end
end
yi;
end