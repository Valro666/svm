
%load dataP.mat

%x1 = x
%y1 = y

%load dataP2.mat

%x2 = x
%y2 = y

%xx = [x1(1:6) x2];
%yy = [y2(1:6) y2];

semilogx(dx,dy)
title('Taux de reussite en fonction de C (echelle logarithmique)')
xlabel('Valeur de C') 
ylabel('Taux de reussite')
legend('classe 1','classe 2','classe 3','classe 4')

%disp([num2str([12 45 78])])

%save bidule ii ff 

%plot(x,y)
%y(end,:)
%sum(y(end,:))/4