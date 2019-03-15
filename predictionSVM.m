function Y = predictionSVM(X, w, b)

    Y = zeros(size(X, 1), 1);

    for i=1:size(X)
        Y(i) = w' * X(i, :)'+b
        if Y(i) >= 0
           Y(i) = 1; 
        else
           Y(i) = -1; 
        end
    end
end

