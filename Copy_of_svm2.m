close all

% Données d'apprentissage
m1 = 50;
m = 2*m1;
X1 = 3 + 3* randn(m1,2);
X2 = -3 + 2 *randn(m1,2);
X = [X1;X2];
Y = ones(m,1);
Y(m1+1:end) = -1;

% RESTE du programme à recopier de svm1.m avant de le modifier 

[Xt1, Xt2] = meshgrid(-6:0.3:6,-6:0.3:6);
Ntest = size(Xt1,1) * size(Xt1,2);
Xtest = [reshape(Xt1, Ntest,1), reshape(Xt2,Ntest,1)];

a = 0;
b = 0 ;
xs = 400;
xh = 400;

for C = [0.01,0.1,1,10,100,1000]
figure('Name',num2str(C));

set(gcf,'Position',[xs*a,xh*b,xs,xh]);

% Apprentissage SVM

app = fitcsvm(X,Y,'BoxConstraint',C);
Ypred = app.predict(Xtest);


%w = sum(app.Alpha)' .* sum( app.SupportVectors) * sum(Y(app.IsSupportVector))

w = app.Alpha .* Y(app.IsSupportVector);

ws = app.SupportVectors' * w;

x1 = -5:5;

b = app.Bias;

x0 = (-ws(1) * x1 - b )/ws(2);
x2 = (-ws(1) * x1 - b +1)/ws(2);
x3 = (-ws(1) * x1 - b -1)/ws(2);

%app = fitcsvm(X,Y,'KernelFunction',kernel,inf);
% Classification de la grille de points de test

%Ypred = zeros(size(Xtest,1),1);	% A modifier !

% Afichage : 

hold on;
gscatter(X(:,1), X(:,2), Y);
gscatter(Xtest(:,1), Xtest(:,2), Ypred );

% Calcul de w et affichage de la droite de séparation

plot(x1,x2,'--');
plot(x1,x0);
plot(x1,x3,'--');
a = a+1;

if a == 3 
    b = b+1;
    a = 0;
end
end
%figure
%plot3(Xtest(:,1),Xtest(:,2),Ypred);