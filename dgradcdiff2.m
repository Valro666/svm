clc
tic()
res = [1 1 1 1];
best = 0 ;

tol = 0.2 ;
c = res ;%* 0.1;
%if exist('normal','var') ~= 1
r1 = assm2(c);

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
dx = res*0.8;
while sum(tr) < 8 
    
    tmpx = x;
    
    deriv = assm2(dx);
    
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
    x
    y
    y = [y ; nderiv]
    x = [x ; dx]
    
    dx = dx + grad*0.01;
    
    %disp([x]);

end
toc()