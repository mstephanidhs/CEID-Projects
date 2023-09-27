
entropy = zeros(2, 1);
index = 1;

x = sourceB();

for N = [2, 4]
    % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x1, N, -1, 1);
    
    prob = get_actual_prob(Xq);
    probs = prob(prob~=0);

    entropy(index) = -sum(probs.*log2(probs));
    fprintf("LloydMax Entropy for N=%s: %s\n", num2str(N), num2str(entropy(index)));
    index = index + 1;

end


