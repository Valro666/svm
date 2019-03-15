close all
% Données d'apprentissage
clc
m1 = 50;
m = 2*m1;
X1 = 3 + 3* randn(m1,2);
X2 = -3 + 2 *randn(m1,2);
X = [X1;X2];
Y = ones(m,1);
Y(m1+1:end) = -1;

[w, b] = apprendSVM(X, Y, 0.6);
Ypred = predictionSVM(X, w, b);

taux_reco = sum((Y == Ypred)) / size(Y, 1);
disp(['taux reussite: ' num2str(taux_reco) ]);
x1 = -5:5;
x0 = (-ws(1) * x1 - b )/w(2);
x2 = (-ws(1) * x1 - b +1)/w(2);
x3 = (-ws(1) * x1 - b -1)/w(2);
hold on;
gscatter(X(:,1), X(:,2), Y);
plot(x1,x2,'--');
plot(x1,x0);
plot(x1,x3,'--');
