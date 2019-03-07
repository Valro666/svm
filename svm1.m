
close all

% Données d'apprentissage
m1 = 50;
m = 2*m1;
X1 = 3 + randn(m1,2);
X2 = -3 + randn(m1,2);
X = [X1;X2];
Y = ones(m,1);
Y(m1+1:end) = -1;

% Grille de points de test pour visualiser la frontière
[Xt1, Xt2] = meshgrid(-6:0.3:6,-6:0.3:6);
Ntest = size(Xt1,1) * size(Xt1,2);
Xtest = [reshape(Xt1, Ntest,1), reshape(Xt2,Ntest,1)];

% Apprentissage SVM

app = fitcsvm(X,Y,'BoxConstraint',inf)
Ypred = app.predict(Xtest);

%w = sum(app.Alpha)' .* sum( app.SupportVectors) * sum(Y(app.IsSupportVector))

w = app.Alpha .* Y(app.IsSupportVector)

ws = app.SupportVectors' * w

x1 = -5:5;

b = app.Bias;

x0 = (-ws(1) * x1 - b )/ws(2)
x2 = (-ws(1) * x1 - b +1)/ws(2)
x3 = (-ws(1) * x1 - b -1)/ws(2)

%app = fitcsvm(X,Y,'KernelFunction',kernel,inf);
% Classification de la grille de points de test

%Ypred = zeros(size(Xtest,1),1);	% A modifier !

% Afichage : 
figure;
hold on;
gscatter(X(:,1), X(:,2), Y);
gscatter(Xtest(:,1), Xtest(:,2), Ypred );

% Calcul de w et affichage de la droite de séparation

hold on ;
plot(x1,x2,'--');
plot(x1,x0);
plot(x1,x3,'--');
%figure
%plot3(Xtest(:,1),Xtest(:,2),Ypred);


% calcul de la marge

% Tracer les bords de la marge 

