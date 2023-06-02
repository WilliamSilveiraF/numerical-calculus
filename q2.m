# 2). Ajuste os m=7 pontos experimentais abaixo, através de:
#
# - funções polinomiais de grau n entre 1 a 7, escolha o grau n que melhor represente os m pontos, e
# - função racional: g(x)=a(1)/(a(2)+a(3)*x): 
#
# x = [ 1.2   1.5   2.     4.     6.     10.   15. ]
# y = [ 0.45 0.40 0.33 0.20 0.14 0.10 0.06 ]
# 
# O valor inicial, Ci, pode ser determinado por interpolação da função exponencial aplicada de forma exata sobre 3 dos pontos dados, ou, testando diferentes valores com uso de fator de sub-relaxação no Método de Newton;
#
# Faça uma análise completa, pelos desvios totais e pelos gráficos, e defina qual foi o melhor ajuste conseguido.

fprintf('Q2\n');


# Definição dos pontos experimentais
pontos_x = [1.2, 1.5, 2.0, 4.0, 6.0, 10.0, 15.0];
pontos_y = [0.45, 0.40, 0.33, 0.20, 0.14, 0.10, 0.06];

# Definição do intervalo para interpolação e plotagem
intervalo_xp = min(pontos_x):0.01:max(pontos_x);



# Ajuste Polinomial
printf("Ajuste feito a um polinômio Pn(x) de grau n\n")

grau = 4
coeficientes = min_desv_quad_pn(grau, pontos_x, pontos_y)

# Cálculo dos desvios e do desvio quadrático total para função polinomial
residuos = valor_pn(coeficientes, pontos_x) - pontos_y
desvio_s = sum(residuos) 
desvio_m = sum(abs(residuos))
desvio_quad_total_polinomio = sum(residuos .* residuos)

# Gráfico Do Ajuste Polinomial
valor_ajustado_ya = valor_pn(coeficientes, intervalo_xp); 
figure;
plot(pontos_x, pontos_y, '*r', intervalo_xp, valor_ajustado_ya, '-b');
title('Q2 - Gráfico Ajuste Polinomial');
grid on;



# Ajuste Função Racional
printf("\n\nAjuste feito à Função g(x)=a(1)/(a(2)+a(3)*x)\n")

funcao_racional = @(params,x) params(1) ./ (params(2) + params(3) .* x);
params_racionais = min_desv_quad_g(pontos_x, pontos_y)

# Cálculo dos desvios e do desvio quadrático total para função racional
valor_ajustado_yb = funcao_racional(params_racionais, intervalo_xp);
desvios_funcao_racional = funcao_racional(params_racionais, pontos_x) - pontos_y
desvio_s_racional = sum(desvios_funcao_racional)
desvio_m_racional = sum(abs(desvios_funcao_racional))
desvio_quad_total_racional = sum(desvios_funcao_racional .* desvios_funcao_racional)

# Gráfico Do Ajuste Racional
figure;
plot(intervalo_xp, valor_ajustado_yb, "-r");
title('Q2 - Gráfico Ajuste Função Racional');
grid on;

printf("\nDesvio quadrático total para o ajuste polinomial: %f", desvio_quad_total_polinomio)
printf("\nDesvio quadrático total para o ajuste racional: %f", desvio_quad_total_racional)

if desvio_quad_total_polinomio < desvio_quad_total_racional
    printf("\nA melhor aproximação foi conseguida através do polinômio de grau %d, com um desvio quadrático total menor.", grau)
else
    printf("\nA melhor aproximação foi conseguida através da função g(x) = a(1)/(a(2)+a(3)*x), pois seu desvio quadrático total foi menor.\n")
end
