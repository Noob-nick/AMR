% function [outputArg1,outputArg2] = untitled(inputArg1,inputArg2)
% %UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
% arguments (Input)
%     inputArg1
%     inputArg2
% end
% 
% arguments (Output)
%     outputArg1
%     outputArg2
% end
% 
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end
% extracting time domain and frequency domain features
function[features,freqfeat]=extract_features(numfeatures,rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1,frames,numfrequency,nfft,Fs,numsnr)
signals={rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1};% creating a cell array
    features=cell(length(signals),1);
    
for m=1:length(features)
features{m}=cell(numsnr,1);
    for s=1:numsnr
       
        framematrix=frames{m}{s};%4040 values of each snr is divided into 6 frames
        p=size(framematrix,2);% this gives no of frames 
        timematrix=zeros(p,numfeatures);
        for k=1:p
            frame=framematrix(:,k);
            timematrix(k,1)=mean(real(frame));
            timematrix(k,2)=std(real(frame));
            timematrix(k,3)=var(real(frame));
            timematrix(k,4)=rms((frame));
            timematrix(k,5)=max(abs((frame)));
            timematrix(k,6)=sum(abs(frame).^2);
            timematrix(k,7)=skewness(real(frame));
            timematrix(k,8)=kurtosis(real(frame));

        end
        features{m}{s}=timematrix;
    end
end
% extracting frequency features

numBins = nfft/2 + 1;
                    % Sampling frequency
f = (0:numBins-1)*Fs/nfft;     % Frequency axis k*fs/nfft
    freqfeat=cell(length(signals),1);
for m=1:length(signals)
 freqfeat{m}=cell(numsnr,1);
 
for s=1:numsnr
   
    framematrix=frames{m}{s};
      p=size(framematrix,2);% this gives no of frames of each snr
    freqmatrix=zeros(p,numfrequency);
for k=1:p
    frame=framematrix(:,k);
    x=fft(frame,nfft);

      % Magnitude spectrum (positive frequencies)
    mag = abs(x(1:numBins));
    % Normalize for probability calculations
    P = mag/sum(mag + eps);
% statistical frequency measures
freqmatrix(k,1)=mean(mag);
freqmatrix(k,2)=std(mag);% 4040 values of each snr is divided into 6 frames and 8 features 
freqmatrix(k,3)=var(mag);
freqmatrix(k,4)=sum(mag.^2);
freqmatrix(k,5)=-sum(P.*log2(P+eps));%spectral entropy
freqmatrix(k,6)=sum(f'.*mag)/sum(mag+eps);
specCentroid = sum(f'.*mag) / sum(mag + eps);
freqmatrix(k,7)=sqrt(sum(((f'-specCentroid).^2).*mag)/sum(mag+eps));
[~,idx] = max(mag);% peak frequency  ~ is value , idx is index
freqmatrix(k,8)=f(idx);
end
freqfeat{m}{s}=freqmatrix; 
end
end
end