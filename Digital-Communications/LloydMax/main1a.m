a = [0.01, 0.9];

Lb = 10000;

x1 = sourceA(Lb, a(1));

plotIndex = 1;

for N = [2, 4, 8]
    % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x1, N, -2, 2);

    SQNR1 = 10*log10(mean(x1.^2)./D);
    
    figure(1)
    subplot(2, 2, plotIndex)
    plot(SQNR1)
    title(['a=' num2str(a(1))])
    xlabel(['N=' num2str(N)])
    ylabel('SQNR')
    plotIndex = plotIndex + 1;
end

x2 = sourceA(Lb, a(2));
plotIndex = 1;

for N = [2, 4, 8]
    % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x2, N, -4, 4);

    SQNR2 = 10*log10(mean(x2.^2)./D);

    figure(2)
    subplot(2, 2, plotIndex)
    plot(SQNR2)
    title(['a=' num2str(a(2))])
    xlabel(['N=' num2str(N)])
    ylabel('SQNR')
    plotIndex = plotIndex + 1;
end



