

res = [1 1 1 1];
c = [0.1];
for i = 0.2:0.2:2
c = [ c  i];
end
%c = [0.2060 0.2814 0.7092 14.4928];è
c = [c  5 10 100 500 1000];
x = [];
y = [];
[a,b] = size(c);
for i = 1:b
    val = c(i);
    a = assm(val);
    disp([c(i)])
    disp([num2str(a) ' tot ' num2str(sum(a))])
    disp([num2str(a*100/140) ' moy ' num2str(sum(a)*100/140/4)])
    y = [y sum(a)*100/140/4];
    x = [x c(i) ];
end

save('dataP.m',x,y)