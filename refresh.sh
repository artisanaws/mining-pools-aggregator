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

# Delete contents of R53domainlists folder (if any)
rm -rf ./R53domainlists/*

split -l 1024 -d ./lists/tlds.txt ./R53domainlists/TldDomainList
split -l 1024 -d ./lists/subdomains.txt ./R53domainlists/SubdomainDomainList

# Rename files using a loop with mv
for file in ./R53domainlists/*
do
    mv "$file" "${file}.txt"
done

echo "==================================="
echo "Domain lists formated and saved locally"
echo "==================================="

echo "==================================="
echo "Domain lists are ready to be uploaded to S3"
echo "==================================="

echo "==================================="
echo "ALL DONE. 🤘"
echo "==================================="
