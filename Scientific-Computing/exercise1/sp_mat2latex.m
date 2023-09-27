A = [0.3984 0.1895 0.8423 0.0000; 0.0000 0.5458 0.0000 0.0000; 0.9416 0.4122 0.1788 0.0000; 0.0000 0.0000 0.7134 0.0000];

string = input('csr or csc?: ', 's');

sp_mat2latex(A, string);

function [val, row_ip, col_ip] = sp_mat2latex(A, sp_type)
% Author: M. ΣΤΕΦΑΝΙΔΗΣ, ΑΜ: 1067458, Date: 22/12/2021

    if strcmp('csr', sp_type)==1
        
        m = size(A, 1);
        [col_ip, row, val] = find(A');
        
        % Πίνακας Values -> μη-μηδενικά στοιχεία του πίνακα
        disp(transpose(val));
        matrix2latex(transpose(val), 'out.tex', 'Values');
        
        % Πίνακας Index -> στήλη που βρίσκεται κάθε στοιχείο
        disp(transpose(col_ip));
        matrix2latex(transpose(col_ip), 'out.tex', 'Index');
       
        %Πίνακας RowPTR -> Με τη βοήθεια της συνάρτησης histc βρίσκω πόσα
        %μη-μηδενικά στοιχεία έχει η κάθε γραμμή και έπειτα προσθέτω το
        %πλήθος των μη-μηδενικών στοιχείων κάθε γραμμής μέσω της cumsum,
        %ώστε να βρω τη θέση του μη-μηδενικού στοιχείου της επόμενης
        %γραμμής στον πίνακα val
        row_ip = [0; cumsum(histc(row, 1:m))]+1;
        disp(transpose(row_ip));
        matrix2latex(transpose(row_ip), 'out.tex', 'RowPTR');
        
    elseif strcmp('csc', sp_type)==1
        
        B = transpose(A);
        m = size(B, 1);
        [col_ip, row, val] = find(B');
        
        % Πίνακας Values -> μη-μηδενικά στοιχεία του πίνακα
        disp(transpose(val));
        matrix2latex(transpose(val), 'out.tex', 'Values');
        
        % Πίνακας Index -> γραμμή που βρίσκεται κάθε στοιχείο
        disp(transpose(col_ip));
        matrix2latex(transpose(col_ip), 'out.tex', 'Index');
        
        %Πίνακας ColPTR -> ό,τι ισχύει και παραπάνω αλλά για στήλες
        row_ip = [0; cumsum(histc(row, 1:m))]+1;  
        disp(transpose(row_ip));
        matrix2latex(transpose(row_ip), 'out.tex', 'ColPTR');   
        
    else
        
        error("You've entered a wrong input. Exiting..");
        
    end 
end 






