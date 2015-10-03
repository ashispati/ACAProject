%% High Frequency Content (HPC) Weighing Energy Function 
% hpcEnergy = HPCWeighing(frames)
% objective: Return HPC weighed energy for each window 
%
% INPUTS
% frames: wSize x n matrix of frames, n being the number of windows  
%
% OUTPUTS
% hpcEnergy: 1 x n matrix HPC weighted energy, n being the number of windows

function hpcEnergy = HPCWeighing(frames)

% initializations
[wSize, n] = size(frames);
Energy = zeros(1,n);

% HPC weighing of fft
spectra = abs(fft(frames));
spectra = spectra(1:wSize/2,:);
spectra = spectra.*spectra;
weighingVector = 0:wSize/2-1;

for i=1:n
    Energy(i) = sum(spectra(:,i).*weighingVector');
end

dummy = [0, Energy];
deltaEnergy = zeros(1,n);
for i=1:length(dummy)-1
    deltaEnergy(i) = log2(dummy(i+1)/dummy(i));
end
%deltaEnergy = diff(dummy);
deltaEnergy = smooth(deltaEnergy);
hpcEnergy = deltaEnergy;
hpcEnergy = (hpcEnergy.*(hpcEnergy>0))'; % half-wave rectification


end