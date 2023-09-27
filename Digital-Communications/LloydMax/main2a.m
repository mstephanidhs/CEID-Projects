x = sourceB();

plotIndex = 1;

for N = [2, 4]
    % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x, N, -1, 1);

    SQNR = 10*log10(mean(x.^2)./D);

    figure(1)
    subplot(1,2, plotIndex)
    plot(SQNR)
    xlabel(['N=' num2str(N)])
    ylabel('SQNR')
    plotIndex = plotIndex + 1;
end
