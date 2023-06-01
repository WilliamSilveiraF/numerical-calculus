clear
printf("\nQuestão 1:\n")

x = pi/2;
xi = pi/4; #(x-xi)/2
b = (x-xi);

#f(x) = cos(x);    #1
#f'(x) = -sen(x);  #0
#f''(x) = -cos(x); #-1
#f'''(x) = sen(x); #0
#f''''(x) = cos(x);#1

fzero = cos(xi); #1
f(1) = -sin(xi); #0
f(2) = -cos(xi); #-1
f(3) = sin(xi);  #0
f(4) = cos(xi);  #1


taylor = (fzero/1)*1 + (f(1)/factorial(1))*b + (f(2)/factorial(2))*b*b + (f(3)/factorial(3))*b*b*b + (f(4)/factorial(4))*b*b*b*b;

#taylor = 1  + (f(2)/factorial(2))*b*b + (f(4)/factorial(4))*b*b*b*b;

ye = cos(pi/2);
errot = taylor - ye;
printf("Erro com Taylor é %e\n", errot);

# Gregory Newton
# 1b). Crie um interpolador polinomial de grau 4 (base de Gregory-Newton), e
# calcule o erro exato máximo em relação a função exata;

a = 0;
b = pi/2;
xp=a:0.01:b;
yGN = interpolacao_ln_Gregory_Newton(a,b,xp);
ye = cos(xp);


Erro=abs(yGN-ye);
ErroGregoryNewton=max(Erro);
printf("Erro com Gregory Newton é %e\n", ErroGregoryNewton);

#1c). Calcule os erros entre o interpolador polinomial de grau 4 (base de
#Gregory-Newton) e função exata, sobre cada ponto onde o interpolador esta
#definido/ancorado.
erro_em_zero = yGN(1)-ye(1)
erro_em_pi_sobre_dois = yGN(length(yGN))-ye(length(ye))