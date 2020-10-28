function [m A eigenfaces pr_img] = eigenface_core(database_path)
T = [];

%Se citesc imaginile si se transforma in matricea M 
for i = 1 : 10
    image = strcat(database_path,'/',int2str(i),'.jpg'); 
    im = double(rgb2gray(imread(image)));
    k = 1;
    for j = 1:rows(im)
      for i = 1: columns(im)
          M(k,1) = im(j,i);
          k++;
      endfor
    endfor
    T = [T M];
    M = [];
 endfor
 
 %Se calculeaza media de pe fiecare linie
 for i = 1 : rows(T)
   m(i,1) = sum(T(i,1:columns(T)))/columns(T);
 endfor
 
 for i  = 1 : columns(T);
  A(:,i) = T(:,i) - m;
endfor
  
 % Se determina matricea V 
 [X land] = eig(A.'*A);
 [D, ind] = sort(diag(land));
 
  j = 1; V =[];
  for i = 1:rows(D)
    if D(i) > 1
      V(:,j) = X(:,ind(i));
      j++;
    endif
  endfor
 
 %Se calculeaza spatiul fetelor si proiectia imaginilor 
  eigenfaces = A*V;
  pr_img = eigenfaces'*A;
  
end