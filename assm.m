
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
    for mega = 1 : 140
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
        ymod;
        sc = [];
        model = classi(X , ymod, c(i) );
        for imod = 1:4
            %[ett, score] = model{a}.predict(test);
            [ett, score] = predict(model{imod},test);
            sc = [sc score(:,2) ];
        end
        %disp(sc)
        [m, p] = max (sc,[],2);
       %disp([m p verif sc])
        if verif == p
            juste = juste + 1;
        end

        if mod((mega/140)*100,10) == 0
            fprintf('.');
        end
    end
    svm(i) = juste;
    fprintf('%d \n',juste);
end

toc()
ymod;
end
