$graphqlResponse = gh api graphql -f query='query{repository(owner:"riskiipriyadi",name:"sinibaca"){discussionCategories(first:10){nodes{id name}}}}'
Write-Host "--- Raw response ---"
Write-Host $graphqlResponse
Write-Host "--- End raw ---"
Write-Host "Length: $($graphqlResponse.Length)"