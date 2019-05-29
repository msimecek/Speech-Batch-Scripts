$werScriptPath = ".\wer\index.js"

$baselineDir = "" # reference transcript TXT files
$compareWithDir = "" # speech to text output TXT files
$outFileName = "wer.csv"


$baselineFiles = Get-ChildItem -Path $baselineDir -Filter *.txt
$compareFiles = Get-ChildItem -Path $compareWithDir -Filter *.txt

if ($baselineFiles.Count -ne $compareFiles.Count) {
    Write-Error "There must be the same amount of baseline and compare files."
    # exit;
}

$res = @()
$res += "File 1,File 2,WER,Distance"

for ($i = 0; $i -lt $baselineFiles.Count; $i++) {
    #Write-Host $baselineFiles[$i], $compareFiles[$i]

    $wer = (node $werScriptPath --file1 "$baselineDir/$($baselineFiles[$i])" --file2 "$compareWithDir/$($compareFiles[$i])")
    Write-Host $wer
    $res += $wer
}

$res | Out-File "$compareWithDir/$outFileName"