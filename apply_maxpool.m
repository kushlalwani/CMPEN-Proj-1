
function outarray = apply_maxpool(inarray)
    % inarray is 2Nx2MxD and outarray is size NxMxD
    % halves the row and column size of the inarray

    % extract inarray dimensions
    [N, M, D] = size(inarray);
    
    % for each channel
    for k = 1:D
        for i = 1:N/2
            for j = 1:M/2
                % extract the max of each 2x2 group of cells
                outarray(i, j, k) = max(max(inarray(2*i-1:2*i, 2*j-1:2*j, k)));
            end
        end
    end
end