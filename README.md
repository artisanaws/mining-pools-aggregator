# Crypto mining pools aggregator (domains + IPs)

## Description
Simple tool that aggregates all the crypto mining pool lists I was able to find online. As of November 2022, it includes all of the top 20 mining pools (by hashrate) for the 11 largest POW blockchains.

Outputs:
- Aggregate top level domains list (`lists/tlds.txt`) ~10k lines
- Uses the `tlds.txt` file to create a second list that includes a wildcard covering all subdomains (`lists/subdomains.txt`) ~10k lines
 
## Installation

1. Make sure you have python `3.x` on your system.
2. `pip install pipenv` if you don't have it already.
3. `cd` into the dir and run `pipenv install`.
 
## Usage

#### TL;DR;

You can use the files in the `lists` folder as is.

To refresh sources and re-aggregate lists run: 

```
./refresh.sh
```

Give it some time (around 20min on 2018 13" MacBook Pro.) 

Output:
```
> DONE. Lists generated and contain 9885 TLDs.
> DONE. List of subdomains generated. It contains 9885 subdomains.'
```

#### Under the hood

```
pipenv run python generate_lists.py
```
aggregates all files in blacklists folder into one, subtracts anything from whitelists folder, deduplicates, orders alphabetically. Output saved in `lists` folder. 

```

```
pipenv run python generate_subdomains.py
``` 
Makes a duplicate of the list created by the generate_lists.py file and prefixes all domains with `*.` This second list is required in order to block both the root domain (ie example.com) and all of its subdomains (ie cyptomining.example.com).

`helpers.py` is where most of the logic lives. Functions are commented and should be self-explanatory.

There's a few lists that I found but that didn't make the cut saved into `excluded` dir. Mainly because of formatting issues.

## How to extend?

- Add urls to blacklist into `blacklists/CUSTOM_blacklist.txt`
- Add urls to whitelist into `whitelists/CUSTOM_whitelist.txt`
- To add new sources, create a file in either `blacklists` or `whitelists` folder then either paste your list directly, or if you're pulling from a url paste the url onto the first line. Python will do the rest to pull the contents and populate the file. Be sure to post the raw link (ie without html) - see current files for inspiration.

 
## Credits

All the credit goes to the folk who put together the original lists. This is merely an aggregator.

Ordered alphabetically:

- [andoniaf/mining-pools-list](https://github.com/andoniaf/mining-pools-list)
- [anudeepND/blacklist](https://github.com/anudeepND/blacklist)
- [codingo/Minesweeper](https://github.com/codingo/Minesweeper/)
- [eladmen](https://www.catonetworks.com/blog/the-crypto-mining-threat)
- [firebog](https://firebog.net/)
- [hoshsadiq/adblock-nocoin-list](https://github.com/hoshsadiq/adblock-nocoin-list)
- [ilmoi/mining-pools-aggregator](https://github.com/ilmoi/mining-pools-aggregator)
- [Marfjeh/coinhive-block](https://github.com/Marfjeh/coinhive-block)
- [ZeroDot1/CoinBlockerLists](https://gitlab.com/ZeroDot1/CoinBlockerLists)