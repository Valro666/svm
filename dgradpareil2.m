clc
tic()

tol = 0.1 ;

c = 1;
r1 = assm(c);

normal = r1*100/140;

final =  sum(normal)/4;

r1;
normal;
final;

xx = [];
yy = [];

tr = 1 ;

cc = [c];
val = [final];
dc = 0.8;

best = final ;
cbest = 1 ;
while tr == 1 
    
    d = assm(dc);

    dn = d*100/140;

    df =  sum(dn)/4;

    h = (df-val(end))
    b = (dc-cc(end))
    dv = h/b
    
    cc = [cc dc(1)];
    val = [val df];
    
    disp(num2str(dv))
    disp([num2str(cc)])
    disp([num2str(val)])
    xx = [xx dc];
    yy = [yy df];
    if abs(dv) <= tol
        tr = 42;
        disp("sortie car tolerance")

    end
    
    dc = dc + dv*0.1;
    disp([dc])
    
    if dc <=0
        tr = 42;
        disp("sortie car c < 0")

    end
    if best < df
        best = df
        cbest = dc
    end
end

disp(["best " df dc])
plot(xx,yy)
toc()