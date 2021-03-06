# Speech Recognition System

## MFC Creation

To create .mfc file for your audio data run the main.m script using MATLAB making sure to edit the filenames for your specific .wav files in both main.m and writeFile.main

## Proto File Creation

to Create a proto file for training, run the writeProtoFile.m script specifying your number of channels as channels/2 from the filterbank.m file

## Initilising

To initilise a model run the following command with HTK installed replacing <Labeled Name> with a name from the label file:

1.`HInit -S lists/trainlist.txt -l <Labeled Name> -L labels/train -M hmms -o <Labeled Name> -T 1 lib/proto8States.txt`

Once all of the models have been initilised you will then need to create a NET file from your GRAM file using HParse:

2. `HParse GRAM.txt NET` (cd lib before running)

You can then test the model by running the following replacing <.mfc file> with your test .mfc file:

To run a batch test run the following:

`HVite -T 1 -S lists/testList.txt -d hmms/ -w lib/NET -l results lib/dict.txt lib/words.txt`

To view the results of the testing run the following:

`HResults -p -e "???" sil -L labels/test lib/words.txt results/*.rec`

## Putty Configuration

cmp-18stuspeech.uea.ac.uk

##Network Drive Configuration

\\cmp-18stuspeech.uea.ac.uk\storage

## Demo Procidure:

1. Record Audio using speech_capture function

2. Create a .lab file for the audio

3. Check main parameters are correct and run main function to generate .mfc

4. Run the following command in Linux server: `HVite -T 1 -S lists/testList.txt -d hmms/ -w lib/NET -l results lib/dict.txt lib/words.txt`

5. run the following command to get the results: `HResults -p -e "???" sil -L labels/test lib/words.txt results/*.rec`