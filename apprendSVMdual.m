function [Xres] = apprendSVMdual(X, Y, C, noyau, param_noyau)

 
    [m,n] = size(Y);
    pas = C/m;
    alpha = [];
    for i = pas:pas:C
        alpha = [alpha i];
    end
    
    %H
    sum = 0;
    for i = 1:1:m
        for j = 1:1:m
        sum = sum + alpha(i)*alpha(j)*Y(i)*Y(j)*kernel('linear',X(i,:),X(j,:));
        end
    end
    sum;

    %f
    sum2 = 0;
    for i = 1:1:m
        sum2 = sum2 + alpha(i);
    end
    %Aeq
    sum3 = 0; 
    for i = 1:1:m
        sum3 = sum3 + alpha(i)*Y(i);
    end
    H = zeros(2);
    %H(1) = -sum;
    f = zeros(2,1);
    f(2) = (sum2+sum/2);
    Aeq = [sum3 0];
    beq = [0];

    size(H);
    size(f);
    %disp("H")
    %disp(H)
    %disp("f")
    %disp(f)
    %disp("Aeq")
    %disp(Aeq)
    %disp("beq")
    %disp(beq)
    Xres = quadprog(H, f, [], [], Aeq, beq);
    

end

