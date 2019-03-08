

res = [1 1 1 1];
c = [0.1 0.1 0.1 0.1]
c = [ c ;res*0.5;res;res*10;res * 20;res * 50;res * 100;res * 500;res *1000]
%c = [0.2060 0.2814 0.7092 14.4928];è
x = []
y = []
for i = 1:9
    val = c(i,:)
    a = assm(val);
    disp([num2str(a) ' tot ' num2str(sum(a))])
    disp([num2str(a*100/140) ' moy ' num2str(sum(a)*100/140/4)])
    y = [sum(a)*100/140/4 y]
    x = [c(i,1) x]
end

save('dataP.m',x,y)