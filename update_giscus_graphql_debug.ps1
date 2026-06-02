Write-Host "Running GraphQL query..."
$graphqlResponse = gh api graphql -f query='query{repository(owner:"riskiipriyadi",name:"sinibaca"){discussionCategories(first:10){nodes{id name}}}}'
Write-Host "GraphQL response received. Length: $($graphqlResponse.Length)"
if (-not $graphqlResponse) {
    Write-Error "GraphQL response is empty or null"
    exit 1
}
try {
    $data = $graphqlResponse | ConvertFrom-Json
    Write-Host "Conversion to JSON successful."
    $nodes = $data.repository.discussionCategories.nodes
    Write-Host "Found $($nodes.Count) nodes."
    $general = $nodes | Where-Object { $_.name -eq 'General' }
    if (-not $general) {
        Write-Error "General category not found"
        exit 1
    }
    $cid = $general.id
    Write-Host "General category ID: $cid"
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
} catch {
    Write-Error "Error in processing: $_"
    exit 1
}