function [A_k S] = task3(image, k)
  A = double(imread(image));
  [m n] = size(A);

 %Se calculeaza media pe fiecare linie
  for i = 1:m
      u(i,1) = sum(A(i,1:n))/n;
  endfor
  A = A-u;
  
 %Se construieste matricea Z
  Z = (A.')/sqrt(n-1);
  [U S V] = svd(Z);
  
 % Se determina spatiul componentelor principale
  W(1:m,1:k) = V(1:m,1:k);
  
  % Se determina proiecta lui A in spatiul componentelor principale
  Y = (W.') * A;
  
  %Se aproximeaza matricea initiala 
  A_k = W*Y + u; 
endfunction