# Speech-Batch-Scripts

A collection of helper scripts to work with Azure Speech API, specifically the batch transcription functionality.

## Prerequisites

[FFMPEG](https://ffmpeg.org/download.html)

[Azure Speech CLI](https://github.com/msimecek/Azure-Speech-CLI) in version 1.4.1.

```
dotnet tool install -g azurespeechcli
```

Azure Speech subscription and [Speech CLI configured with the right key](https://github.com/msimecek/Azure-Speech-CLI#configuration).

```
speech config set -n Batch -k <key> -r <region> --select
```

Node.js for WER calculation.

## Scripts

**transcode.ps1** (transform source MP3 files to supported WAV format)

Make sure that FFMPEG is installed and present in your PATH (otherwise, change the script to point to your ffmpeg.exe).

Change the value of `$sourceDir` variable - where source MP3 files are.

Script will create correctly encoded WAV files in the *$sourceDir/transcoded* folder.

**transcript.ps1** (create transcript for every file in folder)

Change the value of `$sourceDir` variable - where source WAV files are (result of `transcode.ps1`).

Change the value of `$baseUrl` to point where your WAV files are hosted.

> **Hint**: Use `http-server` from NPM and `ngrok` to make your local files available publicly.

Specify `$languageModelId` if you want to run recognition with language model.

Optionally specify `$prefix` to better filter results after multiple runs.

Change the `speech transcript create` command to reflect your environment (with/without language model, different source file name pattern etc.).

**download.ps1** (download finished transcripts)

Change the value of `$outDir` variable to specify where transcripts should be downloaded (folder will be created if not existing).

Optionally specify `$prefix` to filter results.

**cleanup.ps1** (delete transcription results from the service)

Specify `$prefix` to filter which transcripts will be deleted from the Speech service.

**wer.ps1** (calculate Word Error Rate per file and export into CSV)

Change the value of `$werScriptPath` to point to your WER calculation JavaScript file (such as `index.js`).

Change the value of `$baselineDir` - where the reference transcription TXT files are.

Change the value of `$compareWithDir` - where the speech to text output TXT files are.

Optionaly change the `$outFileName` value to specify different filename of output CSV.