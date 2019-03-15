function [w, b] = apprendSVM(X, Y, C)

    x1 = size(X, 1);
    x2 = size(X, 2);
    total = x2 + x1 + 1;
    H = zeros(total);
    f = ones(total, 1) * C;
    
    f(1:x2) = 0;
    f(1) = 0;

    pp = eye(x1) .* (-1);
    a = [-Y, X .* (-Y), pp];
    
    b = ones(x1, 1) * (-1);
    
    lb = [ones(1 + x2, 1) * (-Inf) ; zeros(x1, 1)];
    ub = [ones(total, 1) * Inf];
    
    Xres = quadprog(H, f, a, b, [], [], lb, ub);
    
    b = Xres(1);
    w = Xres(2:x2+1);

end

