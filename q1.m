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

% Q1 - B
fprintf('\n\nQ1 - B \n');

#Aproxime a função de f(x) com erro menor que 1e-2
#f(x) = x * sin(x)
f = @(x) x.*sin(x);
a = 0;
b = pi/2;
grau_n = 3
h = (b - a)/grau_n;
x = [a : h : b];
c = coeficientes_greg_nwtn(grau_n, a, b, f);

x_plot = [a : h/10 : b];
y_plot = func_pol_gn(grau_n, c, x, x_plot);
y_exato = f(x_plot);
erro_local = abs(y_plot - y_exato);
[erro_max, pos_erro] = max(abs(y_plot - y_exato))

fprintf('Os coeficientes são: \n');
disp(c);

figure;
plot(x_plot, y_plot, 'b-', x_plot, y_exato, 'r-');
legend('Aproximação', 'Exato');
title('Q1B - Aproximação x Exato');
grid on;


figure;
plot(x_plot, erro_local, 'k-');
title('Q1B - Erro Local');
grid on;

% Q2 - B
fprintf('\n\nQ1 - C \n');
fprintf('A melhor aproximação foi por Série de Taylor que obteve o menor erro máximo.\n');
fprintf('A aproximação mais eficiente foi por interpolação de Gregory-Newton que obteve o menor grau n.\n');
