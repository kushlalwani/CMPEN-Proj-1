function outarray = apply_convolve(inarray, filterbank, biasvals)
    % inarray is NxMxD1
    % filterbank is RxCxD1xD2
    % biasvals is a length D2 vector
    % outarray is NxMxD2 (unchanged spatial size)

    % extract inarray dimensions
    [N, M, D1] = size(inarray);

    % extract d2 size
    D2 = size(filterbank, 4);

    for i = 1:D2

        % init accumulator for each D2 channel
        acc = zeros(N, M);

        for k = 1:D1

            % convolve and sum resulting D1 images
            filter = filterbank(:, :, k, i);
            acc = acc + imfilter(double(inarray(:, :, k)), filter, 'conv', 'same', 0);

        end

        % Add scalar bias value
        outarray(:, :, i) = acc + biasvals(i);
    end
end