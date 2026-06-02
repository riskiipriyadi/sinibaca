$token = gh auth token
if (-not $token) {
    Write-Error "Failed to get GitHub token from gh"
    exit 1
}
$headers = @{
    "Accept" = "application/vnd.github+json"
    "Authorization" = "Bearer $token"
    "X-GitHub-Api-Version" = "2022-11-28"
}
# Enable discussions if not already enabled
$repoInfo = Invoke-RestMethod -Uri "https://api.github.com/repos/riskiipriyadi/sinibaca" -Method GET -Headers $headers
if (-not $repoInfo.has_discussions) {
    Write-Host "Enabling discussions for the repository..."
    $patchBody = @{ has_discussions = $true } | ConvertTo-Json
    $enableResponse = Invoke-RestMethod -Uri "https://api.github.com/repos/riskiipriyadi/sinibaca" -Method PATCH -Headers $headers -Body $patchBody
    Write-Host "Discussions enabled."
} else {
    Write-Host "Discussions are already enabled."
}
# Now fetch discussion categories
try {
    $resp = Invoke-RestMethod -Uri "https://api.github.com/repos/riskiipriyadi/sinibaca/discussions/categories" -Method GET -Headers $headers
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