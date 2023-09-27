function x = sourceA(L, a1)
    b = 1;
    k = randn(L, 1);
    a = transpose([b, -a1]);
    x = filter(b, a, k);
end