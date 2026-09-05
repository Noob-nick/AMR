% generating different modulation schemes
%function [output1, output2] = functionName(input1, input2)

    % Function code

%    output1 = ...;
   % output2 = ...;

%end
%bpsk  

function [bpsk, qpsk, qam ,qam64, psk, pam, fsk1] = generate_modulation(N)

 %no of bits
bits=randi([0,1],N,1); % formed a column matrix of n rows and 1 column containing 0s and 1s
bpsk=pskmod(bits,2); % this is a function which perform m size psk here m is 2 
scatterplot(bpsk); % matrix of 1000*1
%qpsk

bits=randi([0,3],N,1);
qpsk=pskmod(bits,4,pi/4);
scatterplot(qpsk); 
%qam
bits=randi([0,15],N,1);
qam=qammod(bits,16,'UnitAveragePower',true);
scatterplot(qam);
%64 qam
bits=randi([0,63],N,1); 
qam64=qammod(bits,64,'UnitAveragePower',true);
scatterplot(qam64);
%8-psk
bits=randi([0,7],N,1);
psk=pskmod(bits,8);% forms a signal with 8 different phases
scatterplot(psk);
%4-pam
bits=randi([0,3],N,1);
pam=pammod(bits,4);% gives 4 amplitude
scatterplot(pam);
%2-fsk
bits=randi([0,1],N,1);
freqsep=500;
fs=1000;
nsamp=60;
fsk1=fskmod(bits,2,freqsep,nsamp,fs);% 60 samples per 1bit for 1000bit 60000samples

plot(real(fsk1));
end