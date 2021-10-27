function [data] = writeFile(data)
    filename = "x.mfc";
    numVectors = 45000;
    vectorPeriod = 25000;
    numDims = 50;
    parmKind = 8;
    % Open file for writing:
    fid = fopen(filename, 'w', 'ieee-be');
    % Write the header information%
    fwrite(fid, numVectors, 'int32'); % number of vectors in file (4 byte int)
    fwrite(fid, vectorPeriod, 'int32'); % sample period in 100ns units (4 byte int)
    fwrite(fid, numDims * 4, 'int16'); % number of bytes per vector (2 byte int)
    fwrite(fid, parmKind, 'int16'); % code for the sample kind (2 byte int)
    % Write the data: one coefficient at a time:
    for i = 1: numVectors
        for j = 1:numDims
            fwrite(fid, data(i, j), 'float32');
        end
    end

end