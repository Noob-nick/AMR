% this will include AMR Pipeline
clc;
clear;
close all;
N=1000;
sps=4;
snr=-10:2:20;

rolloff=0.50;
span=10;

framelength=1024;
freqsep=500;
Fs=1000;
hopsize=512;
nfft=1024;
numfeatures=8;
numfrequency=8;
numsnr=16;
%% 1. Generate modulation signals

[bpsk, qpsk, qam, qam64, psk, pam, fsk1] = ...
    generate_modulation(N);
% doing pulse shaping using rrc filter
[tx_bpsk,tx_qpsk,tx_qam,tx_qam64,tx_psk,tx_pam,tx_fsk1]=...
    pulse_shaping(bpsk,qpsk,qam,qam64,psk,pam,fsk1,sps,rolloff,span);

%adding white gaussian noise to signals so they appear as real world
%signals
[rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1] =...
    add_awgn(tx_bpsk,tx_qpsk,tx_qam,tx_qam64,tx_psk,tx_pam,tx_fsk1,snr);

% dividing signal into frames
[frames]=...
    frame_signals(rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1,framelength,hopsize);


% extracting both time domain and frequency domain features

[features,freqfeat]=extract_features(numfeatures,rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1,frames,numfrequency,nfft,Fs,numsnr);







































