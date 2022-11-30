echo "==================================="
echo "Generating initial lists"
echo "==================================="
pipenv run python generate_lists.py

echo "==================================="
echo "Generating list of subdomains"
echo "==================================="
pipenv run python generate_subdomains.py

echo "==================================="
echo "ALL DONE. 🤘"
echo "==================================="
