% A = [0 0 0 0 4 2; 0 0 1 1 2 2; 6 3 0 0 0 0; 3 0 0 0 0 0; 2 1 0 0 2 1; 1 1 0 0 1 1];
% 
% sp_mx2bccs(A, 2);

function [val, brow_idx, bcol_ptr] = sp_mx2bccs(A,nb)
% Author: M. ΣΤΕΦΑΝΙΔΗΣ, ΑΜ: 1067458, Date: 24/12/2021

A = transpose(A);
B = mat2cell(A, nb*ones(size(A,1)/nb, 1), nb*ones(size(A,2)/nb, 1)); % Σπάω τον πίνακα σε υποπίνακες με διαστάσεις nb*nb 

i = size(B, 1);
j = size(B, 2);

% Αρχικοποίηση των Πινάκων
val = zeros(0);
brow_idx = zeros(0);
column = zeros(0);

% Αποκτώ πρόσβαση σε κάθε cell array που δεν είναι μηδενικό προκειμένου να
% συμπληρώσω τον πίνακα val
for k = 1:i
    for l = 1:j
        if sum(B{k,l}, 'all')~=0
              B{k, l} = B{k, l}';
              B{k, l} = reshape(B{k,l}, 1, []); % Φέρνω το κάθε cell array σε μορφή οριζόντιου διανύσματος για την αποθήκευση στον πίνακα val
              val = [val, B{k,l}];
              brow_idx = [brow_idx, l];
              column = [column; k];
        end

    end 
end

% Πίνακας Values -> μη-μηδενικά cell arrays
disp(val);
matrix2latex(val, 'out.tex', 'Val');

% Πίνακας Index -> γραμμή που βρίσκεται κάθε στοιχείο
disp(brow_idx);
matrix2latex(brow_idx, 'out.tex', 'BrowIdx');

%Πίνακας ColPTR 
bcol_ptr = [0; cumsum(histc(column, 1:i))]+1;
disp(transpose(bcol_ptr));
matrix2latex(transpose(bcol_ptr), 'out.tex', 'BcolPtr');

end 