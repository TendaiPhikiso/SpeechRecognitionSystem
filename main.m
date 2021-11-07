numOfTrainingFiles = 1;

for i=1:numOfTrainingFiles
    currentFile = "reversed-" + i;
    numberOfChannels = 30;

    input = "TrainingData\Training-Audio\" + currentFile + ".wav";

    disp(input)

    output = "MFCCs\train\" + currentFile + ".mfc";

    [sample,fs] = audioread(input);

    %sample = specsub(sample,fs);

    magnitude = magSpec(sample, fs, output, numberOfChannels); % audio data, frequency, output filename, number of channels

    writeToFile(magnitude, output)
end