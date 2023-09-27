% initialize a matrix for the coefficients
a = [0.01, 0.9];

Lb = 10000;

x1 = sourceA(Lb, a(1));

for N = [2, 4, 8]
    % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x1, N, -2, 2);

    figure(1)
    subplot(2,2,1)
    plot(x1)
    title('Original Signal for a=0.01')
    
    if N==2
        subplot(2,2,2)
        plot(centers(Xq))
        title('Quantized signal for N=2')
    elseif N==4
        subplot(2,2,3)
        plot(centers(Xq))
        title('Quantized signal for N=4')
    else
        subplot(2,2,4)
        plot(centers(Xq))
        title('Quantized signal for N=8')
    end
    
end

x2 = sourceA(Lb, a(2));

for N = [2, 4, 8]
     % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x2, N, -4, 4);

    figure(2)
    subplot(2,2,1)
    plot(x2)
    title('Original Signal for a=0.9')
    
    if N==2
        subplot(2,2,2)
        plot(centers(Xq))
        title('Quantized signal for N=2')
    elseif N==4
        subplot(2,2,3)
        plot(centers(Xq))
        title('Quantized signal for N=4')
    else
        subplot(2,2,4)
        plot(centers(Xq))
        title('Quantized signal for N=8')
    end

end
