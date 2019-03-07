
res = [0 0 0 0];
best = 0 ;
for i = 0.1:0.1:10
    c = [i i i i];

    r1 = rails(c);

    normal = r1*100/140;

    final =  sum(normal)/4;

    disp(['r1 gene ' num2str(normal) ' ' num2str(final)])
    
    if best < final 
    
        best = final;
        res = c;
    end
    
    clc
    disp(num2str(i*10))

end

disp([' tab de c = [' res '] global = ' best]) 