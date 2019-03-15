
function svm =  assm(cc)
res = [1 1 1 1];
size(cc);
[a,b] = size(cc);
if(b ~= 4)
    c = res*cc(1);
else
    c = cc;
end
svm = [0 0 0 0];

tic();

for i = 1:4
    juste = 0;
    for mega = 1 : 139
    load defautsrails.mat
    ymod = [];
    test = X(mega,:);
    verif = Y(mega,:);
    X(mega,:)=[];
    Y(mega,:)=[];

        for v = 1:4
            col = [];
            truc = (2*(Y == v)-1);
            ymod = [ymod truc];
        end
        verif = ymod(mega,i);
        ymod;
        sc = [];
        model = classi(X , ymod, c(i) );
        lab = predict(model{i},test);
        if lab == verif
            juste = juste + 1;
        end

        if mod((mega/140)*100,10) == 0
            fprintf('.');
        end
    end
    svm(i) = juste;
    bruit = (juste)*100/140;
    bruit = 100 - bruit;
    fprintf('%0.2f \n',bruit);
end

toc()
ymod;
end
