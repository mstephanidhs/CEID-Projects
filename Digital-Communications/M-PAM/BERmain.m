Lb = 20232;
source_stream = source(Lb);

SNRs = 0:2:20;

% 4-PAM and Bin coding
M = 4;
symbols_order = 'bin';

symbols = mapper(symbols_order, source_stream, M);
sm = modulator(symbols);

BERs1 = zeros(1, length(SNRs));

for j = 1:length(SNRs)
    SNR1 = SNRs(j);
    noise = AWGN(sm, SNR1);
    rt = demodulator(noise);
    source_output = demapper(symbols_order, rt, M);
    BERs1(j) = sum(source_stream - source_output~=0)/Lb;
end

% -----------------------------------------------------------

% 8-PAM and Gray coding
M = 8;
symbols_order = 'gray';

symbols = mapper(symbols_order, source_stream, M);
sm = modulator(symbols);


BERs2 = zeros(1, length(SNRs));

for j = 1:length(SNRs)
    SNR2 = SNRs(j);
    noise = AWGN(sm, SNR2);
    rt = demodulator(noise);
    source_output = demapper(symbols_order, rt, M);
    BERs2(j) = sum(source_stream - source_output~=0)/Lb;
end

figure()
sml1 = semilogy(SNRs, BERs1, '-ob');
hold on;
sml2 = semilogy(SNRs, BERs2, '-m*');
hold off;
title('BER Measurements')
xlabel('SNR')
ylabel('BER')
legend([sml1(1) sml2(1)], {'4-PAM Binary ', '8-PAM Gray'}, 'Location', 'southwest', 'NumColumns', 1);