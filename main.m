```matlab
%% AUTOMATIC MODULATION RECOGNITION (AMR)
% Main script
% This file controls the complete AMR signal-processing pipeline.

clc;
clear;
close all;

%% Parameters

N = 1000;                    % Number of symbols/bits
sps = 4;                     % Samples per symbol
snrRange = -10:2:20;         % SNR values in dB

rolloff = 0.50;              % RRC roll-off factor
span = 10;                   % RRC filter span

frameLength = 1024;          % Frame length
hopSize = 512;               % Hop size
nfft = 1024;                 % FFT size

Fs = 10000;                  % Sampling frequency

%% 1. Generate modulation signals

bpsk  = generate_bpsk(N);
qpsk  = generate_qpsk(N);
qam16 = generate_qam16(N);
qam64 = generate_qam64(N);
psk8  = generate_8psk(N);
pam4  = generate_4pam(N);
fsk2  = generate_2fsk(N);

%% 2. Upsampling and pulse shaping

[tx_bpsk, tx_qpsk, tx_qam16, tx_qam64, ...
 tx_psk8, tx_pam4, tx_fsk2] = pulse_shaping( ...
 bpsk, qpsk, qam16, qam64, psk8, pam4, fsk2, ...
 sps, rolloff, span);

%% 3. Add AWGN

rx_bpsk  = add_awgn(tx_bpsk, snrRange);
rx_qpsk  = add_awgn(tx_qpsk, snrRange);
rx_qam16 = add_awgn(tx_qam16, snrRange);
rx_qam64 = add_awgn(tx_qam64, snrRange);
rx_psk8  = add_awgn(tx_psk8, snrRange);
rx_pam4  = add_awgn(tx_pam4, snrRange);
rx_fsk2  = add_awgn(tx_fsk2, snrRange);

%% 4. Store received signals

signals = {
    rx_bpsk
    rx_qpsk
    rx_qam16
    rx_qam64
    rx_psk8
    rx_pam4
    rx_fsk2
};

%% 5. Frame the signals

frames = frame_signals( ...
    signals, frameLength, hopSize);

%% 6. Extract features

[timeFeatures, frequencyFeatures] = extract_features( ...
    frames, nfft, Fs);

%% 7. Combine features

features = combine_features( ...
    timeFeatures, frequencyFeatures);

%% 8. Display information

disp('AMR feature extraction completed.');

disp('Number of modulation schemes:');
disp(length(signals));

disp('SNR values:');
disp(snrRange);

disp('Feature extraction completed successfully.');
```
