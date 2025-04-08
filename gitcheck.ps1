function Push-GitReposRecursively {
    param (
        [string]$StartDir = (Get-Location)
    )

    Get-ChildItem -Path $StartDir -Recurse -Directory | ForEach-Object {
        $dir = $_.FullName
        if (Test-Path (Join-Path $dir ".git")) {
            Write-Host "Found Git repo in: $dir"
            try {
                Push-Location $dir
                git add .
                git commit -m "Auto commit" 2>$null
                git push --force
                Pop-Location
            } catch {
                Write-Warning "Error processing ${dir}: $_"
            }
        }
    }
}

Push-GitReposRecursively
