function sm = modulator(symbols)
    % initialize the time units needed
        Tsymbol = 4 * 10^(-6);
        fc = 2.5 * 10^6;
        Tsample = 10^(-7);

        % rectangular pulse
        g = sqrt(2/Tsymbol);

        % initialize sampling
        samples = Tsymbol / Tsample; 

        sm = zeros(samples*length(symbols), 1);

        t = (1:samples) * Tsample;

        for i = 1:length(symbols)
            s = symbols(i) * g * cos(2*pi*fc*t); 
            start_index = (i-1) * samples + 1;
            end_index = i * samples;
            sm(start_index:end_index) = s;
        end
end