clc
tic()
res = [1 1 1 1];
best = 0 ;

tol = 0.2 ;

c = res * 0.1;
c(1);
r1 = rails(c);

normal = r1*100/140;

final =  sum(normal)/4;

r1;
normal;
final;

tr = 1 ;

cc = [c(1)]
val = [final]
dc = res*0.2;
while tr == 1 
    

    d = rails(dc);

    dn = d*100/140;

    df =  sum(dn)/4;

    h = (df-val(end))
    b = (dc(1)-cc(end))
    dv = h/b
    
    cc = [cc dc(1)];
    val = [val df];
    
    disp(num2str(dv))
    disp([num2str(cc)])
    disp([num2str(val)])
    if abs(dv) <= tol
        tr = 42;
    end
    
    dc = dc + res * 0.01*dv
end
toc()