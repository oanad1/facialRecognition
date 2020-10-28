function A_k = task1(image, k)
  A = double(imread(image));
  
  [m,n] = size(A);
  [U S V] = svd(A);

  S = S(1:k,1:k);
  V = V(:,1:k);
  U = U(:,1:k);
  
  A_k = U * S * V';  
  
end