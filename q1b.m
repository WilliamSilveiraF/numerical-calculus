
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
