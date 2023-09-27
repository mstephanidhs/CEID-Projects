function rt = demodulator(received)    
    % initialize the time units needed
    Tsymbol = 4 * 10^(-6);
    fc = 2.5 * 10^6;
    Tsample = 10^(-7);

    % rectangular pulse
    g = sqrt(2/Tsymbol);

    samples = Tsymbol / Tsample;

    rt = zeros(length(received)/samples, 1);

    t = (1:samples) * Tsample;

    for i = 1:length(rt)
        start_index = (i-1) * samples + 1;
        end_index = i * samples;
        temp_y = received(start_index:end_index).*g.*cos(2*pi*fc*t)'; 
        rt(i) = sum(temp_y) * Tsample;
    end
end