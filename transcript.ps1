$sourceDir = ""
$baseUrl = "https://"
$languageModelId = ""
$prefix = ""

$i = 1

Get-ChildItem -Path $sourceDir -Filter *.wav | % {
    Write-Host "$baseUrl/Audio $i.wav"
    speech transcript create -n "$($prefix)Audio-$i" -r "$baseUrl/Audio $i.wav" -lng $languageModelId  -w
    #speech transcript create -n "$($prefix)Audio-$i" -r "$baseUrl/Audio $i.wav" -w
    $i = $i + 1
}