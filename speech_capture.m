for fileNumber = 1:5
    fs = 16000;
    r = audiorecorder(fs, 16,1);
    disp("Start speaking");
    record(r);
    for i = 5:-1:1 %reverse counting 
        pause(1); 
        disp(i);
    end 

    disp("Stop speaking");

    stop(r);

    x = getaudiodata(r, 'double');

    t = [1/fs: 1/fs: length(x)/fs ];

    xNorm = 0.99 * x / max(abs(x));
    audiowrite("speech" + fileNumber + ".wav", xNorm, 16000);

    pause(2);

    clear;
end