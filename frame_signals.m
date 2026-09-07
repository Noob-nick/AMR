% function [outputArg1,outputArg2] = untitled2(inputArg1,inputArg2)
% %UNTITLED2 Summary of this function goes here
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
function[frames]=...
    frame_signals(rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1,framelength,hopsize)


windowc=hann(framelength);

signals={rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1};% creating a cell array
frames=cell(length(signals),1);%each frame corresponds to each signal modulation having empty value
for m= 1:length(signals)
    rx=signals{m}; 
    numsnr=size(rx,2);% this will give size of column
   frames{m}=cell(numsnr,1);% this will create 16 snr rows of each frame which are empty writing cell creates it empty
   noofframes=floor((size(rx,1)-framelength)/hopsize) + 1;
    for s=1:numsnr
       signal=rx(:,s);% signal will contain all rows but one column like bpsk 10db or another db signal

       framematrix=zeros(framelength,noofframes);
       for k=1:noofframes
        
        startidx=(k-1)*hopsize + 1;
        endidx=startidx+framelength-1;
        framematrix(:,k)=signal(startidx:endidx).*windowc;
       end
        frames{m}{s}=framematrix;
       
    end
end