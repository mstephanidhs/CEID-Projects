% apply noise using matlab's function
function noise = AWGN(sm, SNR)
    noise = awgn(sm, SNR, 'measured');
end
