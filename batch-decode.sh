#!/usr/bin/env bash

#create a temporary holding directory
tempDir="temp"
outDir="out"
inDir="in"

mkdir $tempDir
mkdir $outDir


#cycle through the mp3 files
for sourceFile in $inDir/*.mp3
do
    echo Working on $sourceFile...
    #build the path to the upsampled mp3
    resampledMp3File=${sourceFile/$inDir/$tempDir}
    #upsample the mp3
    lame --resample 44.1 $sourceFile $resampledMp3File
    #build the name of the wav file
    decodedWavFile="${resampledMp3File/mp3/wav}"
    #convert to wav
    lame --decode $resampledMp3File $decodedWavFile
    #get the bpm of the wav
    bpm="$(soundstretch "$decodedWavFile" -bpm 2>&1 | grep 'Detected BPM rate' | awk '{print $4}')"
    #move the wav file to its final location with the bpm
    mv $decodedWavFile "$outDir/$bpm-${decodedWavFile#"$tempDir/"}"
done

rm -rf $tempDir