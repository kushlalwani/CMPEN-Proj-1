load("CNNparameters.mat")
load("cifar10testdata.mat")
load("debuggingTest.mat")

% 1: Imnormalize 
layer1 = apply_imnormalize(imrgb);
if isequal(layer1, layerResults{1, 1})
    fprintf("Result matches for layer 1\n");
    fprintf("\n");
else
    fprintf("Result does not match for layer 1\n");
end

% 2: Convolve
layer2 = apply_convolve(layer1, filterbanks{1, 2}, biasvectors{1, 2});
if all(abs(layer2 - layerResults{1, 2}) < 0.0001)
    fprintf("Result matches for layer 2\n");
    fprintf("\n");
else
    fprintf("Result does not match for layer 2\n");
end

% 3: Relu
layer3 = apply_relu(layer2);
if all(abs(layer3 - layerResults{1, 3}) < 0.0001)
    fprintf("Result matches for layer 3");
    fprintf("\n");
else
    fprintf("Result does not match for layer 3");
end

% 4: Convolve
layer4 = apply_convolve(layer3, filterbanks{1, 4}, biasvectors{1, 4});
if all(abs(layer4 - layerResults{1, 4}) < 0.0001)
    fprintf("Result matches for layer 4");
    fprintf("\n");
else
    fprintf("Result does not match for layer 4");
end

% 5: Relu
layer5 = apply_relu(layer4);
if all(abs(layer5 - layerResults{1, 5}) < 0.001)
    fprintf("Result matches for layer 5");
    fprintf("\n");
else
    fprintf("Result does not match for layer 5");
end

% 6: Maxpool
layer6 = apply_maxpool(layer5);
if all(abs(layer6 - layerResults{1, 6}) < 0.0001)
    fprintf("Result matches for layer 6");
    fprintf("\n");
else
    fprintf("Result does not match for layer 6");
end

% 7: Convolve
layer7 = apply_convolve(layer6, filterbanks{1, 7}, biasvectors{1, 7});
if all(abs(layer7 - layerResults{1, 7}) < 0.001)
    fprintf("Result matches for layer 7");
    fprintf("\n");
else
    fprintf("Result does not match for layer 7");
end

% 8: Relu
layer8 = apply_relu(layer7);
if all(abs(layer8 - layerResults{1, 8}) < 0.001)
    fprintf("Result matches for layer 8");
    fprintf("\n");
else
    fprintf("Result does not match for layer 8");
end

% 9: Convolve
layer9 = apply_convolve(layer8, filterbanks{1, 9}, biasvectors{1, 9});
if all(abs(layer9 - layerResults{1, 9}) < 0.0001)
    fprintf("Result matches for layer 9");
    fprintf("\n");
else
    fprintf("Result does not match for layer 9");
end

% 10: Relu
layer10 = apply_relu(layer9);
if all(abs(layer10 - layerResults{1, 10}) < 0.001)
    fprintf("Result matches for layer 10");
    fprintf("\n");
else
    fprintf("Result does not match for layer 10");
end

% 11: Maxpool
layer11 = apply_maxpool(layer10);
if all(abs(layer11 - layerResults{1, 11}) < 0.0001)
    fprintf("Result matches for layer 11");
    fprintf("\n");
else
    fprintf("Result does not match for layer 11");
end

% 12: Convolve
layer12 = apply_convolve(layer11, filterbanks{1, 12}, biasvectors{1, 12});
if all(abs(layer12 - layerResults{1, 12}) < 0.0001)
    fprintf("Result matches for layer 12");
    fprintf("\n");
else
    fprintf("Result does not match for layer 12");
end

% 13: Relu
layer13 = apply_relu(layer12);
if all(abs(layer13 - layerResults{1, 13}) < 0.001)
    fprintf("Result matches for layer 13");
    fprintf("\n");
else
    fprintf("Result does not match for layer 13");
end

% 14: Convolve
layer14 = apply_convolve(layer13, filterbanks{1, 14}, biasvectors{1, 14});
if all(abs(layer14 - layerResults{1, 14}) < 0.0001)
    fprintf("Result matches for layer 14");
    fprintf("\n");
else
    fprintf("Result does not match for layer 14");
end

% 15: Relu
layer15 = apply_relu(layer14);
if all(abs(layer15 - layerResults{1, 15}) < 0.0001)
    fprintf("Result matches for layer 15");
    fprintf("\n");
else
    fprintf("Result does not match for layer 15");
end

% 16: Maxpool
layer16 = apply_maxpool(layer15);
if all(abs(layer16 - layerResults{1, 16}) < 0.0001)
    fprintf("Result matches for layer 16");
    fprintf("\n");
else
    fprintf("Result does not match for layer 16");
end

% 17: Fullconnect
layer17 = apply_fullconnect(layer16, filterbanks{1, 17}, biasvectors{1, 17});
if all(abs(layer17 - layerResults{1, 17}) < 0.0001)
    fprintf("Result matches for layer 17");
    fprintf("\n");
else
    fprintf("Result does not match for layer 17");
end

% 18: Softmax
layer18 = apply_softmax(layer17);
if all(abs(layer18 - layerResults{1, 18}) < 0.0001)
    fprintf("Result matches for layer 18");
else
    fprintf("Result does not match for layer 18");
end