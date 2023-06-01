xi = pi/4; %Ponto médio do intervalo
x = [0:xi:pi/2];
erro_max = 0.01; % precisão

[y, coef] = x_sen_x(x, xi, erro_max); % aproxime por Série de Taylor, expandida a partir do ponto médio do intervalo, xi=pi/4. 
y_exato = x .* sin(x);

[erro_max_real, pos_erroMax] = max(abs(y - y_exato))

% Imprima os coeficientes da expansão
fprintf('Os coeficientes da expansão são:\n');
disp(coef);

plot(x, y, "- r", x, y_exato, "- b", xi, 0, "* k");
grid on;