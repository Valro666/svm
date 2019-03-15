function [alpha] = apprendSVMdual(X, Y, C, noyau, param_noyau)

    sizeXp = size(X, 1);
    
    % min 1/2* X'*H*X + f*X
    % ->
    % max -1/2 X'*H*X - f*X
    f = -ones(sizeXp, 1)';
    
    H = 

    % Left*X = Right
    Left = Y';
    Right = 0;
    
    % lower bound et upper bound de Xp
    lb = zeros(sizeXp, 1);
    ub = ones(sizeXp, 1) * C;
    
    Xres = quadprog(H, f, [], [], Left, Right, lb, ub);
    

end

