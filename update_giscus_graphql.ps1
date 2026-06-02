$graphqlResponse = gh api graphql -f query='query{repository(owner:"riskiipriyadi",name:"sinibaca"){discussionCategories(first:10){nodes{id name}}}}' 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Error "GraphQL query failed"
    exit 1
}
$data = $graphqlResponse | ConvertFrom-Json
$nodes = $data.repository.discussionCategories.nodes
$general = $nodes | Where-Object { $_.name -eq 'General' }
if (-not $general) {
    Write-Error "General category not found"
    exit 1
}
$cid = $general.id
Write-Host "Found General category ID: $cid"
(Get-Content _config.yml) -replace 'category_id: <CATEGORY_ID>', "category_id: $cid" | Set-Content _config.yml
if (Select-String -Pattern "category_id: $cid" _config.yml -Quiet) {
    git add -A
    git commit -m "Configure valid Giscus category ID"
    git push
    Write-Host "Successfully updated _config.yml and pushed changes."
} else {
    Write-Error "Failed to update _config.yml"
    exit 1
}