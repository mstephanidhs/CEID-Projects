function [Xqn] = ADM(Xn, M)
    
    K = 1.5; % Constant K based on the exercise
    Xn = interp(Xn, M); % Over-Sampling Xn based on the exercise
    step = zeros(1, length(Xn)); % Initialize step
    step(1) = 0.001; % initialize using a really small step

    % Initialize the matrices needed based on
    % exercise's figure
    En = zeros(1, length(Xn));

    Bn = zeros(1, length(Xn));
    Bn(1) = sign(Xn(1));

    Eqn = zeros(1, length(Xn));

    Xqn = zeros(1, length(Xn));
    Xqn(1) = Xn(1);

    Delay = zeros(1, length(Xn));
    Delay(1) = Xn(1);

    % Encoder Implementation
    for index = 2:length(Xn)
        En(index) = Xn(index) - Delay(index-1);

        % 1 bit Quantizer implementation
        if En(index)>= 0
            Bn(index) = 1;
        else
            Bn(index) = -1;
        end

        % Step Control Logic implementation
        if (Bn(index) == Bn(index-1))
            step(index) = step(index-1) * K;
        else 
            step(index) = step(index-1) / K; 
        end

        Eqn(index) = step(index) * Bn(index);
        Xqn(index) = Eqn(index) + Delay(index-1);
        Delay(index) = Xqn(index);
    end

    % Decoder Implementation
    for index = 2:length(Xn)

        % Step Control Logic
        if (Bn(index) == Bn(index-1))
            step(index) = step(index-1) * K;
        else 
            step(index) = step(index-1) / K;
        end

        Eqn(index) = step(index) * Bn(index);
        Xqn(index) = Eqn(index) + Delay(index-1);
    end 

end
  
