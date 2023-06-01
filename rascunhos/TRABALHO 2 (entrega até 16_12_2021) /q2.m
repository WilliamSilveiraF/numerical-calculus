clear
#2). Determine os zeros/raízes x, e suas respectivas multiplicidades M, das funções polinomiais abaixo:

#2i). P3(x)=x^3-0.2 x^2-3.19 x+2.42

' primeiro polinômio '
a = [1, -0.2, -3.19, 2.42] # coeficientes da equação

x_octave = roots(a);
[x, M] = roots_aula(a)
residuos = valorPolinomio(a, x)

for (i=1:length(x))
    if(i<length(x))
        printf("(x+(%.2f))^%d*", x(i), M(i))
    end
    if(i==length(x))
        printf("(x+(%.2f))^%d \n", x(i), M(i)) #tira o * da última impressão
    end
end

#-------------------------------------------------------------------------------------#

#2ii). P3(x)=x^3 + (4 - 1.1 i) x^2 + (4 - 4.4 i) x - 4.4 i  ( sugiro usar complex(4,-1.1) para representar (4 - 1.1*i) ) 

' segundo polinômio '
a = [1, complex(4,-1.1), complex(4,-4.4), complex(0,-4.4)] # coeficientes da equação

x_octave = roots(a);
[x, M] = roots_aula(a)
residuos = valorPolinomio(a, x)

for (i=1:length(x))
    if(i<length(x))
        printf("(x+1.1i)^%d*",  M(i))
    end
    if(i==length(x))
        printf("(x+(%.2f))^%d \n", x(i), M(i)) #tira o * da última impressão
    end
end

#-------------------------------------------------------------------------------------#

#2iii). P8(x)=x^8 - 10.2 x^7 + 44.79 x^6 - 110.718 x^5 + 168.726 x^4 - 162.522 x^3 + 96.74 x^2 - 32.568 x + 4.752

#Escreva também a forma fatorada de cada polinômio.  Determine os resíduos de cada raiz no final.

' terceiro polinômio '
a = [1,  -10.2, 44.79 , - 110.718, 168.726, - 162.522, 96.74,- 32.568,  4.752] # coeficientes da equação

x_octave = roots(a);
[x, M] = roots_aula(a)
residuos = valorPolinomio(a, x)

for (i=1:length(x))
    if(i<length(x))
        printf("(x+(%.2f))^%d*", x(i), M(i))
    end
    if(i==length(x))
        printf("(x+(%.2f))^%d \n", x(i), M(i)) #tira o * da última impressão
    end
end