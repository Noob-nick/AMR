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
fs=1000;
hopsize=512;
nfft=1024;
numfeatures=8;
numfrequency=8;
%% 1. Generate modulation signals

[bpsk, qpsk, qam, qam64, psk, pam, fsk1] = ...
    generate_modulation(N);
% doing pulse shaping using rrc filter
[tx_bpsk,tx_qpsk,tx_qam,tx_qam64,tx_psk,tx_pam,tx_fsk1]=...
    pulse_shaping(bpsk,qpsk,qam,qam64,psk,pam,fsk1,sps,rolloff,span);














































