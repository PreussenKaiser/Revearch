param(
    [string] $Filter = '*',
    [string] $Path,
    [string] $Pattern)
    
Write-Output "Files which do not contain '${Pattern}'"

[string[]] $files = Get-ChildItem -Path $Path -Filter $Filter -Recurse -File

foreach ($file in $files) {
    [string] $fullPath = "${Path}\\${file}"

    if (![System.IO.File]::Exists($fullPath)) {
        continue
    }

    [string] $content = Get-Content $file

    if ($content.Contains($Pattern)) {
        continue
    }

    Write-Output $file
}
