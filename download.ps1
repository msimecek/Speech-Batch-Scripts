$outDir = "" # will be created if not exists
$prefix = "" # empty = all

$transcripts = (speech transcript list)

$transcripts | % { 
    $item = $_.Split(" ")
    Write-Host $item[0], $item[1]
    if ($item[1].StartsWith($prefix)) {
        (speech transcript download --id $item[0] -o $outDir -f txt -fn $item[1])
    }
}