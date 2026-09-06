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
function[tx_bpsk,tx_qpsk,tx_qam,tx_qam64,tx_psk,tx_pam,tx_fsk1]=pulse_shaping(bpsk,qpsk,qam,qam64,psk,pam,fsk1,sps,rolloff,span)
bpsk_upsamp=upsample(bpsk,sps);% matrix of 4000*1
qpsk_upsamp=upsample(qpsk,sps);
qam_upsamp=upsample(qam,sps);
qam64_upsamp=upsample(qam64,sps);
psk_upsamp=upsample(psk,sps);
pam_upsamp=upsample(pam,sps);
fsk1_upsamp=upsample(fsk1,sps);
% designing rrc filter for pulse shaping 


rrc=rcosdesign(rolloff,span,sps,"sqrt");
tx_bpsk=conv(bpsk_upsamp,rrc);
tx_qpsk=conv(qpsk_upsamp,rrc);
tx_qam=conv(qam_upsamp,rrc);
tx_qam64=conv(qam64_upsamp,rrc);
tx_psk=conv(psk_upsamp,rrc);
tx_pam=conv(pam_upsamp,rrc);
tx_fsk1=conv(fsk1_upsamp,rrc); % 4000*1 matrix
end