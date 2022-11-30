from helpers import process_folder


def generate_lists():
    """
    Creates lists to be used in a firewall. Specifically:
    1. Aggregates overall blacklist and whitelist
    2. Subtracts latter from former
    3. Deduplicates output so only unique lines remain
    """
    blacklisted_tlds = process_folder('blacklists')
    whitelisted_tlds = process_folder('whitelists')
    final_tlds = list(set(blacklisted_tlds) - set(whitelisted_tlds))
    final_tlds.sort()
    with open("lists/tlds.txt", "w") as f:
        f.write("\n".join(final_tlds))
    print(f'> DONE. Lists generated and contain {len(final_tlds)} TLDs.')


if __name__ == '__main__':
    generate_lists()
