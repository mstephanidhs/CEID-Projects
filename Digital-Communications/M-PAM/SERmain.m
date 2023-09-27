Lb = 20232;
source_stream = source(Lb);

SNRs = 0:2:20;

symbols_order = 'bin';

% 4-PAM and Bin coding
M = 4;

symbols = mapper(symbols_order, source_stream, M);
sm = modulator(symbols);

SERs1 = zeros(1, length(SNRs));

for j = 1:length(SNRs)
    SNR1 = SNRs(j);
    noise = AWGN(sm, SNR1);
    rt = demodulator(noise);
    source_output = demapper(symbols_order, rt, M);

    symbols_found = mapper(symbols_order, source_output, M);
    SERs1(j) = sum(symbols - symbols_found~=0)/length(symbols_found);
end

% -----------------------------------------------------------

% 8-PAM and Bin coding
M = 8;

symbols = mapper(symbols_order, source_stream, M);
sm = modulator(symbols);

SERs2 = zeros(1, length(SNRs));

for j = 1:length(SNRs)
    SNR2 = SNRs(j);
    noise = AWGN(sm, SNR2);
    rt = demodulator(noise);
    source_output = demapper(symbols_order, rt, M);

    symbols_found = mapper(symbols_order, source_output, M);
    SERs2(j) = sum(symbols - symbols_found~=0)/length(symbols_found);

end

figure()
sml1 = semilogy(SNRs, SERs1, '-ob');
hold on;
sml2 = semilogy(SNRs, SERs2, '-m*');
hold off;
title('SER Measurements')
xlabel('SNR')
ylabel('SER')
legend([sml1(1) sml2(1)], {'4-PAM Binary ', '8-PAM Binary'}, 'Location', 'southwest', 'NumColumns', 1);

