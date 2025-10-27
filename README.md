# CIFAR-10 CNN Forward Pass (MATLAB)

This project implements a forward pass of a Convolutional Neural Network (CNN) for image classification using the CIFAR-10 dataset. All core CNN operations are implemented from scratch in MATLAB, including convolution, ReLU, max pooling, fully connected layers, and softmax. The CNN parameters (weights and biases) are pre-trained and provided, and the main task is to run inference on the test set and evaluate performance.

---

## 🧾 File Descriptions

### Core Functions (Operators)
- `apply_convolve.m`  
  Performs 2D convolution on an input tensor using provided filterbanks and bias vectors.

- `apply_relu.m`  
  Applies the ReLU activation function to the input.

- `apply_maxpool.m`  
  Applies 2×2 max pooling operation across each channel of the input.

- `apply_fullconnect.m`  
  Implements a fully connected (linear) layer. Flattens input and applies weights and bias.

- `apply_softmax.m`  
  Computes the softmax probabilities in a numerically stable way.

- `apply_imnormalize.m`  
  Normalizes input RGB image based on model requirements (e.g. mean subtraction or scaling).

---

### Data Files
- `CNNparameters.mat`  
  Contains the pretrained filterbanks (weights) and biasvectors used in each layer of the CNN.

- `cifar10testdata.mat`  
  Contains:
  - `imageset`: 32×32×3×10000 array of CIFAR-10 test images  
  - `trueclass`: true class labels (1–10)  
  - `classlabels`: cell array with names of the 10 classes

- `debuggingTest.mat`  
  Optional — contains expected outputs for intermediate layers for debugging individual function correctness.

- `dataset.mat`  
  Optional — may include additional or alternative datasets for local testing.

---

### Scripts
- `testscript.m`  
  Passes a single image through the full network (layer-by-layer) to check that all functions are working.

- `evaluate_cnn.m`  
  Main test script that runs the entire CIFAR-10 test set (10,000 images) through the network, computes overall and per-class accuracy, and generates a confusion matrix. Saves results to `eval_results.mat`.

- `plot_confusions.m`  
  Loads `eval_results.mat` and generates two confusion matrix plots: one showing raw counts, and another with row-normalized accuracy. Saves as PNGs.

- `quick_confusions_fallback.m`  
  Lightweight alternative plotting script in case `plot_confusions.m` fails.

---

## ✅ Output Files
- `eval_results.mat`  
  Contains the confusion matrix (`C`), predicted class indices, true labels, and class names.

- `confusion_counts.png`  
  Confusion matrix heatmap showing raw classification counts.

- `confusion_normalized.png`  
  Confusion matrix heatmap showing per-class (row-wise) accuracy.


