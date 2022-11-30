echo "==================================="
echo "Generating initial lists"
echo "==================================="
pipenv run python generate_lists.py

echo "==================================="
echo "Generating list of subdomains"
echo "==================================="
pipenv run python generate_subdomains.py

echo "==================================="
echo "Formating Route 53 Resolver DNS Firewall domain lists"
echo "==================================="
split -l 1024 -d ./lists/tlds.txt ./R53domainlists/TldDomainList 
split -l 1024 -d ./lists/subdomains.txt ./R53domainlists/SubdomainDomainList
rename 's/$/.txt/' ./R53domainlists/*

echo "==================================="
echo "Domain lists are ready to be uploaded to S3"
echo "==================================="

echo "==================================="
echo "ALL DONE. 🤘"
echo "==================================="
