%% Find Peaks for detecting onsets
% onsetTimeEst = FindOnsetPeaks(hpcEnergy,timeInSecs)
% objective: return the detected onsets as time in secs
%
% INPUTS
% hpcEnergys: 1 x n matrix HPC weighted energy, n being the number of windows
% timeInSec: timestamp for the window in seconds
%
% OUTPUTS
% onsetTimes: 1 x m array containing time in secs, m is the no. of detected
% onsets

function onsetTimeEst = FindOnsetPeaks(hpcEnergy,timeInSec)

[peaks, loc] = findpeaks(hpcEnergy);
j = 1;
for i = 1:length(peaks)
    if peaks(i) >= 1
        onsetTimeEst(j) = timeInSec(loc(i));
        j = j+1;
    end
end



end
