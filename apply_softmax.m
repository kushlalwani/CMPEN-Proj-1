function outarray = apply_softmax(inarray)
    %inarray is 1x1xD and outarray is the same size
    alpha = max(inarray, [], 3);
    power = double(inarray) - alpha;
    numerator = exp(power);
    denominator = sum(numerator, 3);
    outarray = numerator ./ denominator;
end