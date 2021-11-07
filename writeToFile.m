function [] = writeToFile(featureVectors, filename)
% Open file for writing:

fid = fopen(filename, 'w', 'ieee-be');

[rows,columns] = size(featureVectors);
nSamples = rows;
sampPeriod = 100000; % Overlap frame size in s converted to 100ns units
sampSize = 4 * columns; 
parmKind = 6; %MFCC  
data = featureVectors;


% Write the header information% 
fwrite(fid, nSamples, 'int32');   % number of vectors in file (4 byteint)
fwrite(fid, sampPeriod, 'int32'); % sample period in 100ns units (4 byte int)
fwrite(fid, sampSize, 'int16');   % number of bytes per sample (2 byte int)
fwrite(fid, parmKind, 'int16');   % code for the sample kind (2 byte int)

% Write the data: one coefficient at a time:
for i = 1:nSamples
    for j = 1:columns
		fwrite(fid, data(i, j), 'float32'); 
    end
end

disp("Written : " + filename);

end

