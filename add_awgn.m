% function [outputArg1,outputArg2] = untitled4(inputArg1,inputArg2)
% %UNTITLED4 Summary of this function goes here
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
%adding awgn function
function[rx_bpsk,rx_qpsk,rx_qam,rx_qam64,rx_psk,rx_pam,rx_fsk1]=...
    add_awgn(tx_bpsk,tx_qpsk,tx_qam,tx_qam64,tx_psk,tx_pam,tx_fsk1,snr)
rx_bpsk=zeros(length(tx_bpsk),length(snr)); %4000*1 + 1*16 forms a 4000*16 matrix
rx_qpsk=zeros(length(tx_qpsk),length(snr));
rx_qam=zeros(length(tx_qam),length(snr)); 
rx_qam64=zeros(length(tx_qam64),length(snr));
rx_psk=zeros(length(tx_psk),length(snr));
rx_pam=zeros(length(tx_pam),length(snr));
rx_fsk1=zeros(length(tx_fsk1),length(snr));
for i=1:length(snr)
   rx_bpsk(:,i)=awgn(tx_bpsk,snr(i),"measured"); % in 4000*16 matrix we are selecting column by column therefore in first column we have first snr then in second column second snr and each column corresponds to each snr therefore bpsk signal has different snr of -10db which is represented by first column and so on dbs represented by each column
     rx_qpsk(:,i)=awgn(tx_qpsk,snr(i),"measured");
   rx_qam64(:,i)=awgn(tx_qam64,snr(i),"measured");
   rx_qam(:,i)=awgn(tx_qam,snr(i),"measured");
    rx_psk(:,i)=awgn(tx_psk,snr(i),"measured");
 rx_pam(:,i)=awgn(tx_pam,snr(i),"measured");
 rx_fsk1(:,i)=awgn(tx_fsk1,snr(i),"measured");
end