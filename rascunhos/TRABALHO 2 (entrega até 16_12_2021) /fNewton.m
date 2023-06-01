function xnovo=fNewton(f,A,B)

xp = [A:0.1:B];
for i=1:length(xp)
    yp(i) = f(xp(i));
end

# Podemos usar o teorema de Bolzano de trocas de sinais do yp
# Se yp(i)*yp(i+1) for negativo então teremos uma raiz no intervalo [xp(i),xp(i+1)]
#
# O valor inicial da raiz pode ser a média do xp(i) com xp(i+1)

indiceraiz=0;
    for i=1:length(xp)-1;
    i;
        if (yp(i)*yp(i+1)<0)&& abs(yp(i))+abs(yp(i+1))<10
            indiceraiz=indiceraiz+1;
            [xp(i),yp(i)];
            [xp(i+1),yp(i+1)];
            xi(indiceraiz)=0.5*(xp(i)+xp(i+1));
        elseif yp(i)==0
            indiceraiz=indiceraiz+1;
            xi(indiceraiz) = xp(i);
        end
    end#for i 


#Definido o x inicial da primeira raiz precisamos calcular o deltax e o xnovo
#de cada raiz

for i=1:indiceraiz
    if xi(i) == 0
        xnovo(i) = 0;
    else
        deltax = 0.0001; iter = 0;
        while abs(deltax)>1e-14 && iter<20
            iter = iter+1;
            flinhanum = (f(xi(i)+deltax)-f(xi(i)))/deltax;
            deltax = -f(xi(i))/flinhanum;
            xnovo(i) = xi(i) + deltax;
            xi(i) = xnovo(i);
        end #while
    end
end #for i
end#function