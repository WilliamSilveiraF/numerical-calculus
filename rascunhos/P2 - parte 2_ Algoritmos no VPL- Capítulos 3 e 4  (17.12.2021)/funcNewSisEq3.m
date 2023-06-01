function x = funcNewSisEq3(f1,f2,f3,xi)
    
    deltax=[1e-4; 1e-4; 1e-4;];
    contador = 0;
    
    while max(abs(deltax))>1e-16 && contador < 100
        contador = contador+1;
        
        #1-passo calcular o delta x
        # precisamos generalizar o calculo das derivadas para termos um metodo que funcione
        # para qualquer f1, f2 e f3, via derivada numerica baseada na definicao
        
        A(1,1) = (f1([xi(1)+deltax(1);xi(2)          ;xi(3);])         -f1(xi))/deltax(1); # derivada de f1 em relacao a x1
        A(1,2) = (f1([xi(1)          ;xi(2)+deltax(2);xi(3);])         -f1(xi))/deltax(2); # derivada de f1 em relacao a x2
        A(1,3) = (f1([xi(1)          ;xi(2)          ;xi(3)+deltax(3);])-f1(xi))/deltax(3); # derivada de f1 em relacao a x3
        
        A(2,1) = (f2([xi(1)+deltax(1);xi(2)          ;xi(3);])          -f2(xi))/deltax(1); # derivada de f2 em relacao a x1
        A(2,2) = (f2([xi(1)          ;xi(2)+deltax(2);xi(3);])          -f2(xi))/deltax(2); # derivada de f2 em relacao a x2
        A(2,2) = (f2([xi(1)          ;xi(2)          ;xi(3)+deltax(3);])-f2(xi))/deltax(3); # derivada de f2 em relacao a x3
        
        A(3,1) = (f3([xi(1)+deltax(1);xi(2)          ;xi(3);])          -f3(xi))/deltax(1); # derivada de f3 em relacao a x1
        A(3,2) = (f3([xi(1)          ;xi(2)+deltax(2);xi(3);])          -f3(xi))/deltax(2); # derivada de f3 em relacao a x2
        A(3,3) = (f3([xi(1)          ;xi(2)          ;xi(3)+deltax(3);])-f3(xi))/deltax(3); # derivada de f3 em relacao a x3
        
        B = -[f1(xi);f2(xi);f3(xi);];
        deltax = A\B;
        
        #2-passo calcular o x final
        x = xi+deltax; #pode-se usar fator de sub-relaxação para estabilizar a convergencia.
        
        #3-passo atualizar o x inicial pelo x final melhorado
        xi = x;
    end # while
    
    contador;
    deltax;

end