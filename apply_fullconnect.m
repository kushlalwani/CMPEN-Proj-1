function outarray = apply_fullconnect(inarray, filterbank, biasvals)
    % inarray is NxMxD1
    % filterbank is NxMxD1xD2 (3D Filter, 4D Bank)
    % biasvals is a length D2 vector
    % outarray is 1x1xD2
    
    % extract size of D2
    D2 = size(filterbank, 4);

    % init outarray
    input_vector = reshape(inarray, [], 1);
    outarray = zeros(1, 1, D2);

    for i = 1:D2

        % Reshape the filter for the current filter bank
        filter_vector = reshape(filterbank(:, :, :, i), [], 1);

        % Compute the sum of matrix mult of same-sized filter and image
        outarray(1, 1, i) = sum(input_vector .* filter_vector, 'all') + biasvals(i);
    end
end