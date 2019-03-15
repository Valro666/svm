function H = kernel(ker,x1,x2,par)
% Function that computes the kernel matrix.
%
%  H = kernel(ker,x1,x2,par)
%
%  Parameters:
%
%              ker: kernel type. String.
%                  'linear'  - Linear kernel
%                  'poly_h'  - Homegenious polynomial kernel. par is degree of polynomial. 
%                  'poly_i'  - Inhomogenious polynomial kernel. par is degree of polynomial.
%                  'rbf'     - RBF kernel. par is width of rbfs (sigma).
%
%              x1: matrix of input vectors. Each row of x1 represents a d-dimensional vector.
%              x2: matrix of input vectors. Each row of x2 represents a d-dimensional vector.
%              par: parameter of the kernel.
%
%  Outputs:   
%
%              H: Matrix of dimension size(x1,1)*size(x2,1) and in each entry (H)i,j we have the kernel of x1(i,:) with x2(j,:).
%
% Author:   Fernando Perez-Cruz (fernandop@ieee.org)
% Version:  1.0
% Date:     18th March 2002.
%
%
% modified by F. Lauer March 2007 for semi linear kernel

  if (nargin < 3) % check correct number of arguments
     help kernel
  else

    % could check for correct number of args in here
    % but will slow things down further
    switch lower(ker)
    case 'linear'
       H = x1*x2';
    case 'poly_h'
       H = (x1*x2').^par;       
    case 'poly_i'
       H = (x1*x2' +1).^par;       
   case 'tanh'
       H = tanh(par.*x1*x2' +1);
    case {'rbf','gaussian'}
       if(size(x1,2)==1)
          N1=size(x1,1);
          N2=size(x2,1);
          H = zeros(N1,N2);
          for i=1:N1
             H(i,:) = (exp(-(x2-ones(N2,1)*x1(i,:))'.*(x2-ones(N2,1)*x1(i,:))'/(2*par^2)));
          end
       else
          N1=size(x1,1);
          N2=size(x2,1);
          H = zeros(N1,N2);
          for i=1:N1
             H(i,:) = exp(-sum((x2-ones(N2,1)*x1(i,:))'.*(x2-ones(N2,1)*x1(i,:))')/(2*par^2));
          end
       end 
   case 'semirbf'
       if(size(x1,2)==1)
          N1=size(x1,1);
          N2=size(x2,1);
          H = zeros(N1,N2);
          for i=1:N1
             H(i,:) = (exp(-(x2-ones(N2,1)*x1(i,:))'.*(x2-ones(N2,1)*x1(i,:))'/(2*par^2)));
          end
       else
          N1=size(x1,1);
          N2=size(x2,1);
          H = zeros(N1,N2);
          for i=1:N1
             H(i,:) = (x1(i,1)*x2(:,1)') ;%+ 0.1 exp(-sum((x2-ones(N2,1)*x1(i,:))'.*(x2-ones(N2,1)*x1(i,:))')/(2*par^2));
          end
       end       
   case 'timederiv1'
       Te = 1;
       dxdt1 = sum(x1,2)./(Te*length(x1(1,:)));
       dxdt2 = sum(x2,2)./(Te*length(x2(1,:)));
       H = 0.5*kernel('rbf',x1,x2, par) + 0.5*kernel('rbf',dxdt1,dxdt2, par);
    otherwise
       H = x1*x2';
    end        
 end