function a = coeficientesajusexp(x,y)
#neste caso geramos 3 equações nao lineares para os coeficientes a(i)

#g(x)=a(1)/sqrt(a(2)+a(3)*x^3)

f1 = @(a,x,y) sum(  (a(1)./sqrt(a(2)+a(3).*x.*x.*x)-y)   .* (1 ./ (sqrt(a(2) .+ a(3) .* x.*x.*x))) );
f2 = @(a,x,y) sum(  (a(1)./sqrt(a(2).+a(3).*x.*x.*x).-y) .* ((a(1) .* -1) ./ (2 .* (a(2) .+ a(3) .*x.*x.*x).^(3./2))    ) );
f3 = @(a,x,y) sum(  (a(1)./sqrt(a(2).+a(3).*x.*x.*x).-y) .* ((a(1).*x.*x.*x) ./ (2 .* (a(2) .+ a(3) .* x.*x.*x).^(3./2)))   );


#para resolver equações nao lineares precisamos de valores iniciais para as incognitas a(i)
ai = [1;1;1;];
#f1(ai,x,y)
#f2(ai,x,y)
#f3(ai,x,y)
a = funcNewSisEq3(f1,f2,f3,ai,x,y);
f1(a,x,y);
f2(a,x,y);
f3(a,x,y);
end