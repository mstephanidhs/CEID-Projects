function [Xq, centers] = uniform_quantizer(x, N, min_value, max_value)

    % normalize the range of the signal
    x(x > max_value) = max_value;
    x(x < min_value) = min_value;
    
    % initialize the output 
    Xq = zeros(length(x), 1);
    
    % find the step that will define the quantization
    % interval between max_value and min_value
    step = (max_value-min_value)/2^N;
    
    % initialize the matrix in which the quantization
    % levels will be stored
    centers = zeros(2^N, 1);
    
    % calculate the first interval 
    left = min_value;
    right = min_value + step;
    
    % find the total quantization levels
    for i = 1:length(centers)
        centers(i) = (left + right) / 2;
        left = left + step;
        right = right + step;
    end
    
    % every element of Xq contains the index of the centers matrix
    % that indicates in which quantization interval it belongs to
    for i = 1:length(x)
        Xq(i) = find_closest_center(centers, x(i));
    end


end