CID=$( (gh api graphql -f query='query{repository(owner:"riskiipriyadi",name:"sinibaca"){discussionCategories(first:10){nodes{id name}}}}' 2>/dev/null | python3 -c "import sys,json; d=json.load(sys.stdin); n=d.get('data',{}).get('repository',{}).get('discussionCategories',{}).get('nodes',[]); ids=[x['id'] for x in n if x.get('name')=='General']; print(ids[0]) if ids else ''") || \
(curl -s -H "Authorization: Bearer ${GITHUB_TOKEN:-}" https://api.github.com/repos/riskiipriyadi/sinibaca/discussions/categories 2>/dev/null | python3 -c "import sys,json; d=json.load(sys.stdin); ids=[c['node_id'] for c in d if isinstance(d,list) and c.get('name')=='General']; print(ids[0]) if ids else ''") || \
(curl -s https://api.github.com/repos/riskiipriyadi/sinibaca/discussions/categories 2>/dev/null | python3 -c "import sys,json; d=json.load(sys.stdin); ids=[c['node_id'] for c in d if isinstance(d,list) and c.get('name')=='General']; print(ids[0]) if ids else ''") ) && \
[ -n "$CID" ] && \
sed -i "s|category_id: <CATEGORY_ID>|category_id: $CID|" _config.yml && \
grep "category_id:" _config.yml && \
git add -A && git commit -m "Configure valid Giscus category ID" && git push || \
{ echo "ERROR: Cannot fetch category ID. Run 'gh auth login' or export GITHUB_TOKEN=ghp_xxx"; exit 1; }