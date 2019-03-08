

res = [1 1 1 1];
c = [0.1 0.1 0.1 0.1];
for i = 0.2:0.2:2
c = [ c ; res*i];
end
%c = [0.2060 0.2814 0.7092 14.4928];è
x = []
y = []
c
for i = 1:9
    val = c(i,:)
    a = assm(val);
    disp([num2str(a) ' tot ' num2str(sum(a))])
    disp([num2str(a*100/140) ' moy ' num2str(sum(a)*100/140/4)])
    y = [sum(a)*100/140/4 y]
    x = [c(i,1) x]
end

save('dataP.m',x,y)