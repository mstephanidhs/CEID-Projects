function actual_prob = get_actual_prob(Xq)
    Xq = tabulate(Xq);
    actual_prob = Xq(:, 3) ./ 100;
end