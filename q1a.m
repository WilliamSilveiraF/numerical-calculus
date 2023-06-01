% Q1 - A
fprintf('Q1 - A \n');

xi = pi/4; %Ponto médio do intervalo
x = [0:xi:pi/2];
erro_max = 0.01; % precisão

[y, coef] = x_sen_x(x, xi, erro_max); % aproxime por Série de Taylor, expandida a partir do ponto médio do intervalo, xi=pi/4. 
y_exato = x .* sin(x);

q1_a_erro_local = abs(y - y_exato)
[erro_max_real, pos_erroMax] = max(abs(y - y_exato))

% Imprima os coeficientes da expansão
fprintf('Os coeficientes são:\n');
disp(coef);


figure;
plot(x, y, "- r", x, y_exato, "- b", xi, 0, "* k");
title('Q1A -  - Aproximação x Exato');
grid on;

figure;
plot(x, q1_a_erro_local, 'k-');
title('Q1A - Erro Local');
grid on;