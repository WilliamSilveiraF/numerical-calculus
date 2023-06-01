function x=GaussOtimizadoTRID(n2,t,r,d,b)
#eliminação Gaussina otimizada para matriz tridiagonal
for i=2:n2
   aux=t(i)/r(i-1);
  #t(i)=0;
   r(i)=r(i)-aux*d(i-1);
  #d(i)=d(i);
   b(i)=b(i)-aux*b(i-1);
end
#fazendo a retro-substituição
x(n2)=b(n2)/r(n2);
for i=n2-1:-1:1
   x(i)=(b(i)-d(i)*x(i+1))/r(i);
end
x=transpose(x);
end