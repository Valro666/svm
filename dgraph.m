
c = [1 1 1 1]

ff = []
ii = []
dep = 0.01

pas = 10

fin = 100

for i = dep:pas:fin
    
    ci = c * i
    r1 = rails(ci);

    normal = r1*100/140;

    final =  sum(normal)/4;

    r1;
    normal;
    final;
    
    ff = [ff final]
    ii = [ii i]
end