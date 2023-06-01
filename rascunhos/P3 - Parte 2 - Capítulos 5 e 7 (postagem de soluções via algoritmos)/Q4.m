#vamos ajustar um conjunto de m pontos (xk,yk) experimentais:
#pontos experimentais
x = [0,1,2,3,4,6]
y = [0.98,0.71,0.32,0.19,0.11,0.07]
xp = min(x):0.01:max(x);

#1. usando uma função aproximadora g(x) polinomial
printf("Ajuste feito a um polinômio Pn(x) de grau n\n")
#nesse exemplo inicialmente g(x) será uma polinomial de grau n=2
#P2(x)=a1+a2 x+a3 x^2
#printf("\n#Pn(x)=a(1)+a(2)x+...+a(n+1)x^n\n\n")
#vamos usar a tecnica da minimização do desvio quadratico total
#n = 5 corresponde a um polinomio de 6 coeficientes que se ajusta tao bem aos 6 pontos que passa sobre eles
#ou seja, esse ajuste equivale ao polinomio interpolador 
n = 3 #esse grau foi escolhido analisando o grafico e os desvios
# para n = 2,3 ou 4 os valores dos desvios são muito próximos, mas o gráfico faz mais sentido para n = 3
a = coeficientesajuspol(x,y,n)
#precisamos definir se os coeficientes a geram um polinomio cujo desvio quadratico total é minimo (ou maximo)
#se alterarmos um pouco um coeficiente o que vai acontecer com D?
#se D for um ponto de minimo entao uma alteração nos coeficientes a produzirá um aumento no D
#a(1) = a(1)+1 #estamos pertubando o primeiro coeficiente
#verificamos que uma alterção no coeficiente aumenta o desvio portanto o ponto critico é um ponto de minimo D

#vamos calcular desvios locais,soma dos desvios locais, desvios em modulo total, desvio quadratico total
d = fpn(n,a,x).-y
Ds = sum(d) #normalmente um bom ajuste gera Ds nulo
Dm = sum(abs(d))
D = sum(d.*d)
ya = fpn(n,a,xp); #grafico do ajuste polinomial
plot(x,y,'*r',xp,ya,'-b');hold on;


printf("\n\nAjuste feito à Função g(x)=a(1)/sqrt(a(2)+a(3)*x^3)\n")
#g(x)=a(1)/sqrt(a(2)+a(3)*x^3)

g = @(b,x) b(1)./(sqrt(b(2)+b(3).*x.*x.*x))
b = coeficientesajusexp(x,y)
yb = g(b,xp); #grafico do ajuste exponencial
d = g(b,x).-y
Ds = sum(d) #normalmente um bom ajuste gera Ds nulo
Dm = sum(abs(d))
D = sum(d.*d)
plot(xp,yb,"-r");hold on;

printf("\n1b) A melhor aproximação conseguida será através da função g(x) pois seu erro será menor")
