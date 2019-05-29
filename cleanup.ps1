$prefix = "" # empty = all

$transcripts = (speech transcript list)

$transcripts | % { 
    $item = $_.Split(" ")
    Write-Host $item[0], $item[1]
    if ($item[1].StartsWith($prefix)) {
        Write-Host "Deleting..."
        (speech transcript delete $item[0])
    }
}