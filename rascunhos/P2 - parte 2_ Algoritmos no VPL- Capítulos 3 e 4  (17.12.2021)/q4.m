clear
#Determine soluções do sistema de 3 equações não lineares abaixo, com
#máxima precisão possível. Escolha pelo menos dois valores iniciais (Real e/ou
#Complexo) e indique quais convergiram para soluções. Calcule o resíduo máximo
#de cada solução obtida.

f1 = @(x) x(1).*x(1).+x(2).*x(2).*x(2).-x(3).-1;
f2 = @(x) exp(x(1)).-2.*x(2)+sqrt(x(3).+0.1);
f3 = @(x) x(1).+x(2).-x(3).-1.1;

printf("\n------------------------------------------------------")
printf("\nSolução 1")
xi = [1;1;1;];
x = funcNewSisEq3(f1,f2,f3,xi)
residuo_max = max(abs([f1(x),f2(x),f3(x)]))

printf("\n------------------------------------------------------")
printf("\n\nSolução 2")
xi = [complex(1,1);complex(1,1);complex(1,1);];
x = funcNewSisEq3(f1,f2,f3,xi)
residuo_max = max(abs([f1(x),f2(x),f3(x)]))

printf("\n------------------------------------------------------")
printf("\n\nSolução 3")
xi = [1;2;3;];
x = funcNewSisEq3(f1,f2,f3,xi)
residuo_max = max(abs([f1(x),f2(x),f3(x)]))

#printf("\n------------------------------------------------------")
#printf("\n\nSolução 4")
#xi = [1/4;1;2;];
#x = funcNewSisEq3(f1,f2,f3,xi)
#residuo_max = max(abs([f1(x),f2(x),f3(x)]))
#inf