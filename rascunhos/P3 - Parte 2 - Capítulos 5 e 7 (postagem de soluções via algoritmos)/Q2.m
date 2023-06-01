#SPLINES CÚBICAS
clear
clc
%f(x) tabelada aproximado por 4 trechos de Splines Cúbicas (APROXIMA SOMENTE FUNÇÕES), conforme os pontos abaixo:
x=[	  0	  pi/6	  pi/3   pi/2]
y=[	 cos(0) cos(pi/6) cos(pi/3) cos(pi/2)]
n=length(x)-1;
printf("\nnumero de intervalos, numero de Splines: %d\n\n",n)

% Cálculo por n Splines cubicas, uma para cada intervalo, formando um sistema tridiagonal de 'n-1' equacoes para S (derivadas de segunda ordem) 
a=[];b=[]; %zera memoria
  [a b c d]=fSplineb(n,x,y) % Splines quadráticas NAS PONTAS da figura S1=S2 e Sn+1=Sn
np=4*n;    %4 sub-divisões para cada sub-intervalo entre x(i) e x(i+1) para plotagem
xpp=[];ypp=[];
for i=1:n
    xp=x(i):(x(i+1)-x(i))/np:x(i+1);
	for k=1:np+1
	    yp(k)=a(i)*(xp(k)-x(i))*(xp(k)-x(i))*(xp(k)-x(i))+b(i)*(xp(k)-x(i))*(xp(k)-x(i))+c(i)*(xp(k)-x(i))+d(i);
	end
	xpp=[xpp xp];ypp=[ypp yp];
end
plot(x,y,'*k','markersize',20,xpp,ypp,'-m','LineWidth',10)
#SPLINES CUBICAS
grid on

#Resposta da Parte teórica da questão 2
# Diferente de Bezier, splines são funções polinomiais 
# Entre  duas splines precisa seguir algumas regras, são elas:
#    Passam em todos os pontos/nós (continuidade)
#    O ponto final da spline1 precisa ser igual ao ponto inicial da spline2
#    Suavidade: tendo a mesma derivada
#    Velocidade de encurvamento: derivada segunda sendo a mesma
# Essas regras garantem que não tenha um "canto vivo", garantindo a continuidade e suavidade das linhas
