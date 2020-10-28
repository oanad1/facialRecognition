function [A_k S] = task4(image, k)
    A = double(imread(image));
  [m n] = size(A);
  
 %Se calculeaza media pe fiecare linie
  for i = 1:m
      u(i,1) = sum(A(i,1:n))/n;
  endfor
  A = A-u;
  
 %Se construieste matricea Z
  Z = A * (A.')/(n-1);
  [V S] = eig(Z);
  [c, ind] = sort(diag(S),'descend');
  S = diag(sort(diag(S),'descend')); 

 % Se determina spatiul componentelor principale si proiectia lui A
  Vx=V(:,ind);
  V = Vx;
  W(1:m,1:k) = V(1:m,1:k);
  Y = (W.') * A;
 
 %Se aproximeaza matricea initiala 
  A_k = W*Y + u;

endfunction