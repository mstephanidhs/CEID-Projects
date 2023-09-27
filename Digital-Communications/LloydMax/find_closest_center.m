function index = find_closest_center(centers, value)

    % initialize the min variable and the needed output -> position
    % with the first index of the centers matrix, so I have an output in
    % case that the if won't activate
    min = abs(centers(1)-value);
    index = 1;

    for i = 2:length(centers)
        if abs(centers(i)-value) < min
            min = abs(centers(i) - value);
            index = i;
        end
    end

end