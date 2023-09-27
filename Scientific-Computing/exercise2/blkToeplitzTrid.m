% A = [1 1 ; 1 1];
% B = [2 2 ; 2 2];
% C = [3 3 ; 3 3];

% A = [1 5 12; 12 40 3; 150 151 152];
% B = [2 44 36; 2 4 13; 120 121 122];
% C = [3 19 21; 66 73 80; 110 111 112];

% blkToeplitzTrid(4, B, A, C);

function K = blkToeplitzTrid(n, B, A, C)
% Author: M. ΣΤΕΦΑΝΙΔΗΣ, ΑΜ: 1067458, Date: 27/12/2021
% A-> πίνακας κεντρικής διαγωνίου
% Β -> πίνακας άνω διαγωνίου
% C -> πίνακας κάτω διαγωνίου

    if nargin == 4
        
        if isempty(A) || isempty(B) || isempty(C)
            error("The Blocks you've entered, can't be empty. Exiting..");
        end 
        
        if any(size(A)~=size(B)) || any(size(A)~=size(C))
            error("A, B, and C are not identical in size. Exiting..");
        end 
        
        if rem(n,1)~=0 || n<1
            error("n must be a positive integer. Exiting..");
        end
               
        if size(B,1)~=size(B,2) || size(C,1)~=size(C,2) || size(A,1)~=size(A,2)
            error("The matrices you've entered, must be all square. Exiting..");
        end       

    else 
        error("Must have 4 arguments to blkToeplitzTrid. Exiting..");    
    end
    
    % Δημιουργώ έναν cell array ώστε να μπορώ ευκολότερα να αναφέρομαι σε 
    % κάθε έναν από τους 4 πίνακες μέσω δεικτών όπως φαίνεται παρακάτω  
    rowB = size(B,1);
    Z = zeros(rowB);
    cellmatrix = {Z, B, A, C};
    
    % Φτιάχνω την πρώτη γραμμή που θα χρειαστώ για το toeplitz μητρώο
    rowT = ones(1,n);
    rowT(1) = 3; % Αναφέρομαι στον πίνακα Α
    rowT(2) = 2; % Αναφέρομαι στον πίνακα B
    
    % Φτιάχνω την πρώτη στήλη που θα χρειαστώ για το toeplitz μητρώο
    columnT = ones(1,n);
    columnT(1) = 3; % Αναφέρομαι στον πίνακα Α
    columnT(2) = 4; % Αναφέρομαι στον πίνακα C
    
    % Δημιουργία toeplitz μητρώου με πρώτη στήλη [3 4 1 1] και πρώτη γραμμή
    % [3 2 1 1] επομένως η κεντρική διαγώνιος θα αποτελείται από 3 (δείκτης στον πίνακα Α),
    % η άνω διαγώνιος από 2 (δείκτης στον πίνακα B) και η κάτω
    % διαγώνιος απο 4 (δείκτης στον πίνακα C
    
    Tmatrix = toeplitz(columnT, rowT)
    
    % Αρχικά, με την cellmatrix(Tmatrix) δημιουργώ έναν cell array, στον
    % οποίο αντικαθίσταται η κύρια διαγώνιος από τον πίνακα Α, η κάτω
    % διαγώνιος από τον πίνακα C και η πάνω διαγώνιος από τον πίνακα (σύμφωνα με τους παραπάνω δείκτες).
    % Έπειτα, με την χρήση της συνάρτησης cell2mat μετατρέπω τον cell array
    % σε matrix.
    K = cell2mat(cellmatrix(Tmatrix));
    disp(K);
    
end
