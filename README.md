# Automatic Modulation Recognition Using Feature Extraction

## 📌 Overview

Automatic Modulation Recognition (AMR) is the process of identifying the modulation scheme of a received communication signal without prior knowledge of the transmitter.

This project implements a **feature-based Automatic Modulation Recognition system**. Instead of directly providing raw IQ samples to a machine-learning model, meaningful **time-domain and frequency-domain features** are extracted from the received signal and then used for classification.

The project covers the complete pipeline:

**Signal Generation → Pulse Shaping → Channel Noise →Divided Signals Into Frames **→ **Feature Extraction →Labelling Frames **→** Preprocessing → Machine Learning Classification → Performance Evaluation**

---

## 🎯 Objectives

* Generate signals using different digital modulation schemes.
* Simulate transmission through an AWGN channel at different SNR levels.
* Extract informative features from received signals.
* Preprocess the extracted features for machine learning.
* Train a machine-learning classifier to recognize modulation types.
* Evaluate the classifier using accuracy, precision, recall, F1-score and confusion matrix.

---

## 📡 Modulation Schemes

The dataset contains the following modulation schemes:

* BPSK — Binary Phase Shift Keying
* QPSK — Quadrature Phase Shift Keying
* 8-PSK — 8-Phase Shift Keying
* 16-QAM — 16-Quadrature Amplitude Modulation
* 64-QAM — 64-Quadrature Amplitude Modulation
* 4-PAM — 4-Pulse Amplitude Modulation
* 2-FSK — Binary Frequency Shift Keying

---

## 🧠 Feature-Based AMR

The system uses manually extracted statistical and spectral features instead of feeding raw signal samples directly into the classifier.

### Time-Domain Features

The following features are extracted from the received signal:

1. Mean
2. Standard deviation
3. Variance
4. RMS value
5. Maximum absolute amplitude
6. Signal energy
7. Skewness
8. Kurtosis

These features describe the statistical and amplitude characteristics of the signal.

### Frequency-Domain Features

Frequency-domain characteristics are obtained using the FFT.

The extracted features include:

1. Mean spectral magnitude
2. Standard deviation of spectral magnitude
3. Variance of spectral magnitude
4. Sum of squared spectral magnitude
5. Spectral entropy
6. Spectral centroid
7. Spectral spread
8. Peak frequency

Therefore, the feature vector contains **16 features** in total:

**8 time-domain + 8 frequency-domain features**

---

## 🔄 System Pipeline

```text
                Digital Data
                     │
                     ▼
          Modulation Generation
                     │
                     ▼
              Pulse Shaping
                     │
                     ▼
               AWGN Channel
                     │
                     ▼
              Received Signal
                     │
          ┌──────────┴──────────┐
          ▼                     ▼
   Time-Domain             Frequency-Domain
    Features                  Features
          │                     │
          └──────────┬──────────┘
                     ▼
           Combined feature matrix 
                     │
                     ▼
                 Labelling 
                     │
                     ▼
              Data Preprocessing
                     │
                     ▼
          Train/Test Data Split
                     │
                     ▼
          Machine Learning Model
                     │
                     ▼
           Unkown Modulation Class
                     │
                     ▼
           Performance Evaluation
```

---

## ⚙️ Dataset Generation Parameters

The signal dataset is generated using MATLAB.

| Parameter          |                          Value |
| ------------------ | -----------------------------: |
| Samples per symbol |                              4 |
| SNR range          | -10 dB to 20 dB(16 SNR values) |
| SNR step           |                           2 dB |
| Roll-off factor    |                            0.5 |
| Filter span        |                             10 |
| Frame length       |                           1024 |
| FFT size           |                           1024 |
| Sampling frequency |                        1000 Hz |

The signals are passed through an **Additive White Gaussian Noise (AWGN)** channel at different SNR levels to simulate real signals found in nature.

---

## 🛠️ Technologies Used

### MATLAB

MATLAB is used for:

* Signal generation
* Digital modulation
* Pulse shaping
* AWGN channel simulation
* Feature extraction
* Dataset generation

### Python

Python is used for:

* Dataset loading
* Data preprocessing
* Feature scaling
* Label encoding
* Machine-learning classification
* Performance evaluation
* Visualization

### Python Libraries

```text
NumPy
SciPy
Scikit-learn
Matplotlib
Pandas
```

---

## 📂 Project Structure

```text
AMR/
│
├── MATLAB/
│   ├── main.m
│   ├── generate_modulation.m
│   ├── pulse_shaping.m
│   ├── add_awgn.m
│   ├──frame_signals.m
│   ├── extract_features.m
│   ├── labels.m
│   └── AMR_dataset.mat
│
├── Python/
│   └── amr_ml.py
│
└── README.md
```

---

## 🔬 Methodology

### 1. Signal Generation

Digital communication signals are generated using different modulation schemes such as BPSK, QPSK, PSK, QAM, PAM and FSK.

### 2. Pulse Shaping

The generated symbols are pulse-shaped using a suitable pulse-shaping filter to obtain a realistic transmitted waveform.

### 3. AWGN Channel

Noise is added to the transmitted signal for different SNR values.

The SNR range used in the project is:

```text
-10, -8, -6, ..., 18, 20 dB
```

### 4. Framing

The received signal is divided into frames of fixed length.

A window function is applied before frequency-domain analysis to reduce spectral leakage.

### 5. Feature Extraction

Features are extracted from both the time and frequency domains.

The resulting feature vector represents the characteristics of each received signal.

### 6. Data Preprocessing

The extracted features are prepared for machine learning using:

* Label encoding
* Feature standardization
* Train-test splitting

Feature scaling is applied to the input features because different features can have significantly different numerical ranges.

### 7. Classification

The processed feature vectors are provided to a machine-learning classifier.

Random Forest is used as a classifier.

The classifier learns the relationship between the extracted signal characteristics and their corresponding modulation classes.

### 8. Performance Evaluation

The trained model is evaluated using:

* Accuracy
* Precision
* Recall
* F1-score
* Confusion matrix

---

## 📊 Results

The classifier performance can be evaluated using a classification report and confusion matrix.

Example:

```text
Accuracy: XX.XX%
```

The confusion matrix helps identify which modulation schemes are correctly classified and which modulation schemes are confused with one another.

Results can also be analyzed as a function of SNR to study how noise affects modulation recognition performance.

---

## 📈 Why Feature-Based AMR?

A feature-based approach provides an interpretable way of performing modulation recognition.

Instead of treating the received signal as an unknown sequence of samples, the system extracts measurable characteristics such as:

* Amplitude statistics
* Signal energy
* Higher-order statistics
* Spectral distribution
* Spectral entropy
* Frequency characteristics

This makes it possible to investigate **which signal characteristics contribute to modulation classification**.

---

## ⚠️ Limitations

The performance of a feature-based AMR system can be affected by:

* Low SNR
* Similar characteristics between modulation schemes
* Channel impairments
* Carrier-frequency offset
* Timing offset
* Frequency offset
* Multipath fading
* Limited feature representation
* Dataset imbalance

Features that work well under AWGN conditions may not provide the same performance in more realistic wireless channels.

---

## 🚀 Future Improvements

Possible future improvements include:

* Adding Rayleigh and Rician fading channels.
* Increasing the number of modulation classes.
* Testing the system under carrier-frequency and timing offsets.
* Adding higher-order statistical features.
* Comparing different feature-selection techniques.
* Comparing multiple machine-learning classifiers.
* Testing deep-learning approaches using raw IQ samples.
* Developing real-time AMR using Software Defined Radio (SDR).
* Studying performance across a wider range of SNR values.
* Combining handcrafted features with deep-learning features.

---

## 📚 Applications

Automatic Modulation Recognition can be used in:

* Cognitive radio
* Software Defined Radio (SDR)
* Spectrum monitoring
* Signal intelligence
* Electronic warfare
* Wireless communication systems
* Interference identification
* Communication signal analysis

---

## 📝 Conclusion

This project demonstrates a **feature-based Automatic Modulation Recognition system** for identifying different digital modulation schemes.

The approach extracts **time-domain and frequency-domain characteristics** from noisy received signals and uses these features as inputs to a machine-learning classifier.

The project provides a complete workflow from **communication signal generation to machine-learning-based modulation classification**, while also providing an interpretable feature-based approach for studying the characteristics of different modulation schemes.

---

## 👤 Author

**Naman Goel**

B.Tech — Electronics & Telecommunication Engineering

### Areas of Interest

* Digital Signal Processing
* Wireless Communication
* Automatic Modulation Recognition
* Machine Learning
* Software Defined Radio
* Electronic Warfare
* Embedded Systems
