function evaluate_cnn()
    clear; clc; close all; dbstop if error;
    
    load('CNNparameters.mat');
    
    % Use your actual variable names from the MAT:
    load('cifar10testdata.mat','imageset','trueclass','classlabels');
    
    % Sanity
    assert(ndims(imageset)==4 && size(imageset,3)==3, 'imageset must be HxWx3xN');
    N = size(imageset,4);
    
    % Convert labels to column vector and shift if needed
    classindex = double(trueclass(:));   % 10000x1
    if min(classindex) == 0              % if labels are 0..9, shift to 1..10
        classindex = classindex + 1;
    end
    assert(numel(classindex) == N, 'classindex length must match #images');
    assert(all(classindex>=1 & classindex<=10), 'labels must be in 1..10');

    % Confusion matrix (true rows, predicted cols)
    C = zeros(10,10);
    correct = 0;
    preds = zeros(N,1,'uint8');

    fprintf('Evaluating %d images...\n', N);
    tic;
    for n = 1:N
        imrgb = imageset(:,:,:,n);

        res = apply_imnormalize(imrgb);
        res = apply_convolve(res, filterbanks{1, 2},  biasvectors{1, 2});
        res = apply_relu(res);
        res = apply_convolve(res, filterbanks{1, 4},  biasvectors{1, 4});
        res = apply_relu(res);
        res = apply_maxpool(res);

        res = apply_convolve(res, filterbanks{1, 7},  biasvectors{1, 7});
        res = apply_relu(res);
        res = apply_convolve(res, filterbanks{1, 9},  biasvectors{1, 9});
        res = apply_relu(res);
        res = apply_maxpool(res);

        res = apply_convolve(res, filterbanks{1, 12}, biasvectors{1, 12});
        res = apply_relu(res);
        res = apply_convolve(res, filterbanks{1, 14}, biasvectors{1, 14});
        res = apply_relu(res);
        res = apply_maxpool(res);

        res = apply_fullconnect(res, filterbanks{1, 17}, biasvectors{1, 17});
        p   = apply_softmax(res);     % 10-dim probability vector

        % Predicted class (1..10)
        [~, pred] = max(p(:));
        trueLabel = classindex(n);
        preds(n) = uint8(pred);

        % Update confusion & accuracy
        C(trueLabel, pred) = C(trueLabel, pred) + 1;
        if pred == trueLabel, correct = correct + 1; end

        % Light progress print every 500 (optional)
        if mod(n,500) == 0
            fprintf('Processed %5d / %5d (%.1f%%)\n', n, N, 100*n/N);
        end
    end
    t = toc;

    % Overall accuracy
    acc = correct / N;
    fprintf('\nDone in %.2f s (%.2f ms/image)\n', t, 1000*t/N);
    fprintf('Overall accuracy: %.2f%%\n', 100*acc);

    % Per-class accuracy
    perClassAcc = nan(10,1);
    for k = 1:10
        total_k = sum(C(k,:));
        if total_k > 0
            perClassAcc(k) = C(k,k) / total_k;
        else
            perClassAcc(k) = NaN;
        end
    end

    rowSums = sum(C,2);
    Cnorm = C ./ max(rowSums,1); 

    save('eval_results.mat','C','Cnorm','classlabels','classindex','preds');
end