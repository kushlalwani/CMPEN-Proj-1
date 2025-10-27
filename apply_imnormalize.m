
function outarray = apply_imnormalize(inarray)
    % scale channel values to the range: (-0.5, 0.5)
    % inarray is an NxMx3 uint8 image
    % outarray is an NxMx3 uint8 image
    outarray = double(inarray) / 255 - 0.5;
end