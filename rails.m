
function errmod2 =  rails(cc)
tic();
juste = 0;
%c = [1 10 100 1000];
c = cc;

errmod = zeros(140,4);

errmod2 = zeros(1,4);
for mega = 1 : 140


load defautsrails.mat


ymod = [];

test = X(mega,:);
verif = Y(mega,:);

X(mega,:)=[];
Y(mega,:)=[];



    for v = 1:4
        col = [];
        %for k = 1:length(Y);
         %   tmp= -1;
          %  if Y(k) == v 
           % tmp = 1;
           % end
           % col = [tmp;col];
        %end

        truc = (2*(Y == v)-1);

        ymod = [ymod truc];
    end
    %model = []

sc = [];





    for a = 1:4
        model = classi(X , ymod, c(a) );
       % model{a} = fitcsvm(X,ymod(:,a),'BoxConstraint',inf);
        %model = [model ;tmp]
        % erreur apprentissage du model a
        %f=model{a}.predict(X);
        %err(a)= mean(ymod(:,a)~=f);

        %
        [ett, score] = model{a}.predict(test);
        %[m, k] = max(score(2))
        errmod(mega,a)= score(:,2);
        sc = [sc score(:,2) ];
        %disp([num2str(sc) ' verif ' num2str(verif)])
        [o,p] = max(sc);
        %disp([num2str(sc) ' verif ' num2str(verif) ' trouver' num2str(p)])
        if verif == p
            errmod2(a) = errmod2(a) + 1;
        end
        %disp([num2str(sc) ' de verif = ' num2str(verif) ' a = ' num2str(a)])
    end

%vecteur d'indice du maximum de chaque ligne 
%valeur de la pediction sur la base d'apprentissage

[m, p] = max (sc,[],2); 

%disp(['find ' num2str(p) ' verif' num2str(verif)])
%disp(['sc = ' num2str(sc) ' p = ' num2str(p) ' verif = ' num2str(verif)])
    %[verif p] ;


    if verif == p
        juste = juste + 1;
    end

%app = fitcsvm(X,Y,'BoxConstraint',inf)
% Boucle pour apprendre les 4 classifieurs SVM binaires 
%	et calculer leur erreur d'apprentissage
%	puis calculer l'erreur d'apprentissage du classifieur multi-classe



% Test LOO : boucle sur tous les exemples

%disp((mega/140)*100);
    if mod((mega/140)*100,10) == 0
        fprintf('.');
    end
end


%disp([num2str(errmod2)]);
%zer = errmod2*.100/.140;
%disp([' ' num2str(zer) ' ' num2str(sum(zer)/4) ]);
%ftg = (juste/140)*100;
%disp([num2str(ftg) ' de reussite pour c = ' num2str(c)])
%disp([num2str(100-ftg) ' de d erreur pour c = ' num2str(c)])
toc()
ymod
end
