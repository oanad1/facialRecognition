function task2()
  image_name = 'in/images/image2.gif';
   A = double(imread(image_name));
   [m,n] = size(A);
   fig = 1;
   k = [1:2:20 30:3:80 90:5:min(m,n)];
   
   for image = 2:3 
    %1.Grafic valori singulare
   [U S V] = svd(A);
   s = rows(S);
   for i = 1: s
     p(i) = S(i,i);
   endfor
   figure(fig); subplot (2, 2, 1);
   plot(1:s,p,"linewidth",1);
   p = [];
   
   %2.Grafic informatie valori singulare
   c = columns(k);
   for i=1:c
     s1 = 0;
     s2 = 0;
     for j = 1: min(m,n)
       if j <= k(i)
         s1 = s1 + S(j,j);
       endif
       s2 = s2 + S(j,j);
     endfor
     p(i) = s1/s2;
   endfor
   figure(fig); subplot (2, 2, 2);
   plot(k,p,"linewidth",1);
   p = [];
   
   %3.Grafic eroarea aproximarii
   for ik = 1:c
     s1 = 0;
     A_k = task1(image_name,k(ik));
     for i = 1:m
       for j = 1:n
         s1 = s1 + (A(i,j) - A_k(i,j))^2;
       endfor
     endfor
     error(ik) = s1 / (m*n);
   endfor
   figure(fig); subplot (2, 2, 3);
   plot(k,error,"linewidth",1);
   error = [];
   
   %4.Grafic rata de compresie  
   for ik = 1:c
     rate(ik) = (m*k(ik) + n*k(ik) + k(ik))/(m*n);
   endfor
   figure(fig); subplot (2, 2, 4);
   plot(k,rate,"linewidth",1);
   rate = [];
   
   image_name = 'in/images/image3.gif';
   A = double(imread(image_name));
   [m,n] = size(A);
    k = [1:2:20 30:3:80 90:5:min(m,n)];
   fig = 2;
   hold 
 endfor
end