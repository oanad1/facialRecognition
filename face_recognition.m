function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
   im = double(rgb2gray(imread(image_path)));
   
 %Imaginea test se transforma intr-un vector coloana
  k = 1;
  for j = 1:rows(im)
   for i = 1: columns(im)
     I(k,1) = im(j,i);
     k++;
   endfor
 endfor

 %Se extrage media din imaginea test
   I = I-m;
 %Se calculeaza proiectia imaginii de test
   PrTestImg = eigenfaces.' * I;
 
 %Se determina cea mai mica distanta dintre proiectia imaginii test si 
 %proiectiile celorlalte imagini
   distances = [];
   for i = 1: columns(pr_img)
     distances(i) = norm(PrTestImg - pr_img(:,i));
   endfor 
    
   [min_dist output_img_index] = min(distances);
end