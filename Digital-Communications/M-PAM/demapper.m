function signal = demapper(symbols_order, symbols, M)

    size = log2(M);

    % specifies the type of coding applied to the binary words
    val_decimal = pamdemod(symbols, M, 0, symbols_order);

    signal = zeros(1, length(symbols)/size);

    for i = 1:length(val_decimal)
        start_index = (i-1) * size + 1;
        end_index = i * size;
        % converts the integers to binary
        value = de2bi(val_decimal(i), size, 'left-msb');
        signal(start_index:end_index) = value;
    end
end