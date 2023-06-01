function [y, coef] = x_sen_x(x, xi, erro_max)
    % Inicialize y com o valor da função no ponto xi
    y = xi*sin(xi);

    % Inicialize as variáveis que armazenarão as derivadas e os fatores de escala
    derivada = sin(xi) + xi*cos(xi);
    fator = 1;

    % Inicialize o contador de ordem da expansão
    n = 1;

    % Inicialize o vetor de coeficientes
    coef = [xi*sin(xi)];

    % Continue adicionando termos até que o erro máximo seja menor que o erro máximo permitido
    while max(abs(y - x.*sin(x))) > erro_max
        % Adicione o próximo termo à expansão
        coef_n = derivada / factorial(n);
        y = y + coef_n * (x - xi).^n;

        % Armazene o coeficiente no vetor de coeficientes
        coef = [coef, coef_n];

        % Calcule a próxima derivada
        if mod(n, 4) == 0
            derivada = sin(xi) + xi*cos(xi);
        elseif mod(n, 4) == 1
            derivada = 2*cos(xi) - xi*sin(xi);
        elseif mod(n, 4) == 2
            derivada = -3*sin(xi) - xi*cos(xi);
        else
            derivada = -4*cos(xi) + xi*sin(xi);
        end
        n = n + 1;
    end
    
    % Imprima o grau n da expansão
    fprintf('O grau da expansão é: %d\n', n-1)
end