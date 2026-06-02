try {
    $resp = Invoke-RestMethod -Uri "https://api.github.com/repos/riskiipriyadi/sinibaca/discussions/categories" -Method GET -Headers @{"Accept"="application/vnd.github+json"}
    $cat = $resp | Where-Object { $_.name -eq "General" }
    if (-not $cat) { throw "General category not found" }
    $cid = $cat.node_id
    (Get-Content _config.yml) -replace 'category_id: <CATEGORY_ID>', "category_id: $cid" | Set-Content _config.yml
    if (-not (Select-String -Pattern "category_id: $cid" -Path _config.yml -Quiet)) { throw "Failed to update _config.yml" }
    git add -A
    git commit -m "Configure valid Giscus category ID"
    git push
} catch {
    Write-Error $_
    exit 1
}