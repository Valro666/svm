function [ model ] = classi( xx , yy , c)
%CLASSI Summary of this function goes here
%   Detailed explanation goes here
    for a = 1:4
        %model{a} = fitcsvm(xx,yy(:,a),'BoxConstraint',c(a));
        model{a} = fitcsvm(xx,yy(:,a),'BoxConstraint',c);
        %model = [model ;tmp]
        % erreur apprentissage du model a
        %f=model{a}.predict(X);
        %err(a)= mean(ymod(:,a)~=f);
    
    
        
        %[ett, score] = model{a}.predict(X);
        %[m, k] = max(score(2))
        %sc = [sc score(:,2) ];
    end

end

