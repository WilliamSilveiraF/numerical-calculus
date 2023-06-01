function a = funcNewSisEq3(f1,f2,f3,ai,x,y)
deltax=[1e-4;1e-4;1e-4;];
iter=0;
while max(abs(deltax))>1e-14 && iter<200
    iter=iter+1;
    
    #1-passo calcular o deltax
    #precisamos generalizar o calculo das derivadas para termos um metodo que funcione para qualquer f1 e f2,
    #via derivada numérica baseada na definição
    #f1(ai,x,y)
    A(1,1) = (f1([ai(1)+deltax(1);ai(2)          ;ai(3)          ],x,y)-f1(ai,x,y))/deltax(1); # Derivada de f1 em relação a x1
    A(1,2) = (f1([ai(1)          ;ai(2)+deltax(2);ai(3)          ],x,y)-f1(ai,x,y))/deltax(2); # Derivada de f1 em relação a x2
    A(1,3) = (f1([ai(1)          ;ai(2)          ;ai(3)+deltax(3)],x,y)-f1(ai,x,y))/deltax(3); # Derivada de f1 em relação a x3
    A(2,1) = (f2([ai(1)+deltax(1);ai(2)          ;ai(3)          ],x,y)-f2(ai,x,y))/deltax(1); # Derivada de f2 em relação a x1
    A(2,2) = (f2([ai(1)          ;ai(2)+deltax(2);ai(3)          ],x,y)-f2(ai,x,y))/deltax(2); # Derivada de f2 em relação a x2
    A(2,3) = (f2([ai(1)          ;ai(2)          ;ai(3)+deltax(3)],x,y)-f2(ai,x,y))/deltax(3); # Derivada de f2 em relação a x3
    A(3,1) = (f3([ai(1)+deltax(1);ai(2)          ;ai(3)          ],x,y)-f3(ai,x,y))/deltax(1); # Derivada de f3 em relação a x1
    A(3,2) = (f3([ai(1)          ;ai(2)+deltax(2);ai(3)          ],x,y)-f3(ai,x,y))/deltax(2); # Derivada de f3 em relação a x2
    A(3,3) = (f3([ai(1)          ;ai(2)          ;ai(3)+deltax(3)],x,y)-f3(ai,x,y))/deltax(3); # Derivada de f3 em relação a x3
    B = -[f1(ai,x,y);f2(ai,x,y);f3(ai,x,y);];
    deltax = A \ B;

    #2-passo calcular o x final
    a = ai + deltax;

    #3-passo atualizar o x inicial pelo x final melhorado
    ai = a;
end #while
    iter
    deltax


end