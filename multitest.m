
res = [1 1 1 1]
c = [res  *0.01; res * 0.1; res * 1;res * 5; res * 10; res * 50;res  *100;];
cc = []
val = []
for i = 1:1:8


a = rails(c(i,:));
dn = a*100/140;
df =  sum(dn)/4;

cc = [cc c(i,1) ]
val = [val df]
disp([num2str(a) ' tot ' num2str(sum(a))])
disp([num2str(a*100/140) ' moy ' num2str(sum(a)*100/140/4)])


end