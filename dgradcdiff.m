clc
tic()
res = [1 1 1 1];
best = 0 ;

tol = 0.2 ;
c = res * 0.1;
%if exist('normal','var') ~= 1
r1 = rails(c);

normal = r1*100/140;

final =  sum(normal)/4;

r1;
normal;
final;
%end
tr = [1 1 1 1] ;

x = c;
%val = [final]
y = normal;
dx = res*0.2;
while sum(tr) < 8 
    
    tmpx = x;
    
    deriv = rails(dx);
    
    nderiv = deriv/140*100
    
    h = nderiv - y(end,:);
    b = dx - x(end,:);
    
    grad = h./b;
    
    for k = 1:1:4 
        if grad(k) <= tol
            tr(k) = 2 ;
            grad(k) = tmpx(k);
        end
         if grad(k) == 0
            grad(k) = tmpx(k);
        end
    end
    
    y = [y ; nderiv];
    x = [x ; dx];
    
    dx = dx + grad*0.01
    


end
toc()