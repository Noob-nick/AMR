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
function[labels]=labels(signals,numsnr,features,freqfeat)
combinedfeatures=cell(length(signals),1);
for m=1:length(signals)
    combinedfeatures{m}=cell(numsnr,1);
    for s=1:numsnr
        x=features{m}{s};%6 *8
       y=freqfeat{m}{s};%6*8
       combinedfeatures{m}{s}=[x,y];%6*16
    end
end
modulationnames=["BPSK","QPSK","16QAM","64QAM","8PSK","4PAM","2FSK"];
labels=cell(length(signals),1);
for m=1:length(signals)
    labels{m}=cell(numsnr,1);
    for s=1:numsnr
        p=size(combinedfeatures{m}{s},1);
        labels{m}{s}=categorical(repmat(modulationnames(m),p,1));
    end
end
end




