function symbols = mapper(symbols_order, signal, M)

    size = log2(M);

    % matrix that contains the symbols that will be produced
    val_decimal = zeros(1, length(signal)/size); 

    for i = 1:length(val_decimal)
        % calculate the indexes in every iteration in order to get 
        % each time every log2(M) bits from the signal matrix
        start_index = (i-1) * size + 1;
        end_index = i * size;
        % transform every log2(M) bits to the corresponding symbol
        value = bi2de(signal(start_index:end_index), 'left-msb');
        % add to the symbols matrix
        val_decimal(i) = value;
    end

    % using the matlab's function pammod to specify the type of code
    % mapping (gray or binary) that will be applied 
    symbols = real(pammod(val_decimal, M, 0, symbols_order));
end