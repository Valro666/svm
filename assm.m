
function svm =  assm(cc)
res = [1 1 1 1];
if(size(cc) ~= 4)
    c = res*cc(1);
else
    c = cc;
end
svm = [0 0 0 0];

tic();
juste = 0;



errmod = zeros(140,4);

errmod2 = zeros(1,4);
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

    sc = [];

        for a = 1:4
            model = classi(X , ymod, c(i) );

            [ett, score] = model{a}.predict(test);
            errmod(mega,a)= score(:,2);
            sc = [sc score(:,2) ];

        end
        [m, p] = max (sc,[],2); 

        if verif == p
            juste = juste + 1;
        end

        if mod((mega/140)*100,10) == 0
            fprintf('.');
        end
    end
    svm(i) = juste;
    fprintf('\n');
end
toc()
ymod;
end
