
function svm =  assm(cc)
svm = cc

tic();
juste = 0;
c = [0.2060 0.2814 0.7092 14.4928];

errmod = zeros(140,4);

errmod2 = zeros(1,4);
for i = 1:4
    juste = 0;
    for mega = 1 : 140
    %for mega = 1 : 1
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
            %[o,p] = max(sc);
            %disp([o p])
            %if verif == p
             % errmod2(a) = errmod2(a) + 1;
            %end

        end
        [m, p] = max (sc,[],2); 
        %disp([o p])

        if verif == p
            juste = juste + 1;
        end

        if mod((mega/140)*100,10) == 0
            fprintf('.');
        end
    end
    %disp([juste])
    svm(i) = juste;
    fprintf('\n');
end
toc()
ymod;
end
