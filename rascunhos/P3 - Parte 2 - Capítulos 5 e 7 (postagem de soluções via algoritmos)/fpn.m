function ya = fpn(n,a,xp)
# vamos agora calcular o valor do polinomio da base canonica em cada xp
for k = 1:length(xp);
    ya(k) = a(1);
    AUX = 1;
    
    for i = 1:n;
        AUX = AUX*xp(k);
        ya(k) = ya(k) + a(i+1)*AUX;
    end
end
end