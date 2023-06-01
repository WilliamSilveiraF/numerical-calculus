% Q3
fprintf('Q3\n');


x = [1 1.5 2];
y = 1 ./ x;

n=length(x)-1; % num de intervalos
printf("\nnumero de intervalos, numero de Splines: %d\n\n",n)

[a b c d]=fSplineb(n,x,y) 

np=4*n;    
xpp=[];ypp=[];
for i=1:n
    xp=x(i):(x(i+1)-x(i))/np:x(i+1);
	for k=1:np+1
	    yp(k) = a(i)*(xp(k)-x(i))*(xp(k)-x(i))*(xp(k)-x(i));
	    yp(k) = yp(k) + b(i)*(xp(k)-x(i))*(xp(k)-x(i));
	    yp(k) = yp(k) + c(i)*(xp(k)-x(i))+d(i);
	end
	xpp=[xpp xp];ypp=[ypp yp];
end
plot(x,y,'*k','markersize',20,xpp,ypp,'-m','LineWidth',5)

grid on