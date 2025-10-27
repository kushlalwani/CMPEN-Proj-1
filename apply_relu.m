function outarray = apply_relu(inarray)
    %inarray is NxMxD and outarray is the same size
    %This function will change all negative values to 0 in the matrix
    outarray = max(inarray, 0);
end