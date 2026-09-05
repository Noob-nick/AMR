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

[bpsk, qpsk, qam16, qam64, psk8, pam4, fsk2] = ...
    generate_modulation(N);















































