% initialize a matrix for the coefficients
a = [0.01, 0.9];

Lb = 10000;

entropyA1 = zeros(3, 1);
indexA1 = 1;

entropyA2 = zeros(3, 1);
indexA2 = 1;

x1 = sourceA(Lb, a(1));

for N = [2, 4, 8]
    % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x1, N, -2, 2);
    
    probA1 = get_actual_prob(Xq);
    probsA1 = probA1(probA1~=0);

    entropyA1(indexA1) = -sum(probsA1.*log2(probsA1));
    fprintf("LloydMax Entropy for N=%s and a=%s: %s\n", num2str(N), num2str(a(1)), num2str(entropyA1(indexA1)));
    indexA1 = indexA1 + 1;

end

x2 = sourceA(Lb, a(2));
fprintf("--------------------------------------------\n");

for N = [2, 4, 8]
     % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x2, N, -4, 4);
    
    probA2 = get_actual_prob(Xq);
    probsA2 = probA2(probA2~=0);

    entropyA2(indexA2) = -sum(probsA2.*log2(probsA2));
    fprintf("LloydMax Entropy for N=%s and a=%s: %s\n", num2str(N), num2str(a(2)), num2str(entropyA2(indexA2)));
    indexA2 = indexA2 + 1;
end

