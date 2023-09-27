% val = [6 3 3 0 2 1 1 1 0 1 0 1 4 2 2 2 2 1 1 1];
% brow_idx =  [2 3 1 1 3];
% bcol_ptr = [1 3 4 6];
% nb = 2;
% x = [1; 2; 3; 4; 5; 6];
% y = [1 2 3 4 5 6];
% 
% spmv_bccs(y, x, nb, val, brow_idx, bcol_ptr);

function [y] = spmv_bccs(y, x, nb, val, brow_idx, bcol_ptr)
% Author: M. ΣΤΕΦΑΝΙΔΗΣ, ΑΜ: 1067458, Date: 03/01/2022
     
    count2 = 1;
    dim = nb*nb; % Το μέγεθος κάθε υπό-μητρώου
    cell = val(count2:dim); % Αποθηκεύω τα στοιχεία κάθε υπό-μητρώου από τον πίνακα values (πχ κάθε 4αδα σύμφωνα με το παράδειγμα της εκφώνησης)
    count = 1; % Χρησιμοποιείται ως μετρητής για να προσπελαύνω τα στοιχεία του διανύσματος Χ
    count1 = 1;
    count3 = 1;
    
    n = length(bcol_ptr)-1;
    
    for j=1:n
        k1 = bcol_ptr(j);
        k2 = bcol_ptr(j+1)-1;
        
        for i=k1:k2
            rows = brow_idx(count1); % Παίρνω κάθε φορά από τον πίνακα brow_idx το "τμήμα γραμμών" στο οποίο βρίσκεται ο κάθε υπό-πίνακας
            
            if count2~=1
                cell = val(count2:count2+dim-1);
            end
            
            % Ανάλογα με το rows προσπαθώ να βρω κάθε φορα ποιες γραμμές
            % περιλαμβάνει, δηλαδή το 2ο τμήμα γραμμών περιλαμβάνει τις γραμμές 3
            % και 4, ώστε να κάνω τις κατάλληλες πράξεις με τα διανύσματα
            if rows==1 
                min = 1;
                max = nb;
            else
                max = rows*nb;
                min = rows*nb-(nb-1);
            end
            
           % Τα πρώτα nb στοιχεία κάθε υπό-πίνακα (βρίσκονται στην ίδια
           % στήλη) πρέπει να πολλαπλασιαστούν από το διάνυμα Χi του
           % διανύσματος X κοκ
           y(min:max) = y(min:max) + x(count)*cell(1:nb);
           y(min:max) = y(min:max) + x(count+1)*cell(nb+1:dim);
           
           count2 = count2 + dim; % Για να προσπελάσω τα επόμενα nb*nb στοιχεία (πχ την επομένη 4αδα από τον πίνακα val)
           count1 = count1+1;
           
        end 
        
        count = count + nb; 
        
    end

    disp(y);

end

