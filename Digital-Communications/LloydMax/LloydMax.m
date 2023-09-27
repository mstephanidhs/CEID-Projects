function [Xq, centers, D] = LloydMax(x, N, min_value, max_value)

    % call the function uniform_quantizer for the step of the algorithm
    [~, centers] = uniform_quantizer(x, N, min_value, max_value);

    % initialize the matrix that will contain the distortion
    D = []; 

    % repeat steps 2, 3 and 4 as long as the below condition is true
    while length(D) < 2 || abs(D(end) - D(end-1)) >= eps

        distortion = 0;

        % initialize the matrices needed
        sum_var = zeros(length(centers), 1);
        Xq = zeros(length(x), 1);
        counter_var = zeros(length(centers), 1);
        
        for k=1:length(x)
            % find the quantization level that the element x(k) belongs to
            % and return the corresponding index of the centers matrix
            index = find_closest_center(centers, x(k));

            % every element of the counter_val matrix is an index for the centers
            % matrix which represents each quantization level and it adds
            % the current quantization level with every element of the
            % source x
            sum_var(index) = sum_var(index) + x(k);

            % every element of the counter_val matrix is an index for the centers
            % matrix which represents each quantization level, so counter_val 
            % counts how many times, the quantization level has appeared
            counter_var(index) = counter_var(index) + 1;

            % calculates every time the current distortion 
            distortion = distortion + (x(k) - centers(index))^2;
            Xq(k) = index;
        end
        
        % calculates the final distortion after each iteration of the
        % algorithm has been completed
        D(end+1) = distortion/length(x);
        
        % calculates the new quantization levels after each iteration of
        % the algorithm has been completed
        for k=1:length(centers)
            if counter_var(k) ~= 0
                centers(k) = sum_var(k)/counter_var(k);
            end
        end

    end

end