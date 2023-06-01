clear
printf("\n Questão 1:\n")

f=@(x) ((x.-1).*tan(x))/(2.*x.*x.-x.-2);

#intervalo [-4,4]
A = -4;
B =  4;

x=fNewton(f,A,B);
printf("\n Raiz = %.16f\n", x)

for i=1:length(x)
    Residuos(i) = abs(f(x(i)));
end
printf("\n")
Residuos
