

res = [1 1 1 1];

 c = []
for i = 0.2:0.2:2
c = [ c ; res*i];
end
c = [c; res*5;res*10;res*50;res*100];
%c = [0.2060 0.2814 0.7092 14.4928];è
dx = [];
dy = [];
[s,b] = size(c);
for i = 1:s
    val = c(i,:);
    a = assm2(val);
    disp([num2str(a) ' tot ' num2str(sum(a))])
    disp([num2str(a*100/140) ' moy ' num2str(sum(a)*100/140/4)])
    dx = [dx ; c(i,:)];
    dy = [dy ; a*100/140 ];
end
disp([dx])
disp([dy])
%save('dataDiff.m',dx,dy)