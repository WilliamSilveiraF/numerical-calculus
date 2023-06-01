%Algoritmo Curvas de Bezier (APROXIMA CURVAS, NÃO FUNÇÕES)
printf("Questão 3\n")
printf("Parte teórica: comentada no arquivo\n")

# São 4 pontos, a curva passa pelo primeiro e pelo último de forma parametrizada
# Os pontos intermediários servem de controle, "atraindo" a curva.
# É um polinômio de terceiro grau
# É necessário um parâmetro t independente que ajuda a gerar dois conjuntos de pontos, fazendo x e y em função de t, 
# apesar de que plotaremos sempre o gráfico em relação a x e y e não a t.

BezierMultiplas