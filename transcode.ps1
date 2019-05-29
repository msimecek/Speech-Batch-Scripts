$sourceDir = ""
$outDir = "$sourceDir/transcoded"

Get-ChildItem -Path $sourceDir -Filter *.mp3 | % {
    ffmpeg -i $_.FullName -acodec pcm_s16le -vn -ar 16000 -ac 1 "$outDir/$($_.BaseName).wav" 
}