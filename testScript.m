close all
clear all
clc

[x, fs] = audioread('RealDrum01_00#MIX.wav');
wSize = 1024;
hop = 256;
[frames, timeInSec] = Windows(x, wSize, hop, fs);
hpcEnergy = HPCWeighing(frames);
onsetTimeEst = FindOnsetPeaks(hpcEnergy,timeInSec);

[annotations] = parseXMLAnnotations('RealDrum01_00#MIX.xml');
onsetTime = annotations.onset;
%onsetTime = annotations;

time = 0:0.0001:length(x)/fs;
onsetEstimated = zeros(1,length(time));
onsetsActual = zeros(1,length(time));

for i = 1:length(onsetTimeEst)
   onsetEstimated(round(onsetTimeEst(i)*10^4+1)) = 2; 
end

for i = 1:length(onsetTime)
   onsetsActual(round(onsetTime(i)*10^4)) = 1; 
end

plot(time,onsetEstimated,'b'); hold on; plot(time,onsetsActual,'r'); hold off;





