function coeficientes = min_desv_quad_g(pontos_x, pontos_y)

    # Definindo a função g(x)
    funcao_racional = @(params,x) params(1) ./ (params(2) + params(3) .* x);

    # Definindo as derivadas parciais das funções
    f1 = @(params, x, y) sum(  (funcao_racional(params, x) - y) .* (1 ./ (params(2) + params(3) .* x)) );
    f2 = @(params, x, y) sum(  (funcao_racional(params, x) - y) .* ((params(1) .* -1) ./ (2 * (params(2) + params(3) .* x).^2)) );
    f3 = @(params, x, y) sum(  (funcao_racional(params, x) - y) .* ((params(1).*x) ./ (2 * (params(2) + params(3) .* x).^2)) );

    # Valores iniciais para as incógnitas a(i)
    parametros_iniciais = [max(pontos_y), min(pontos_x), (max(pontos_y) - min(pontos_y))/(max(pontos_x) - min(pontos_x))];

    # Resolução do sistema não linear
    coeficientes = newtonSistema(f1, f2, f3, parametros_iniciais, pontos_x, pontos_y);
end