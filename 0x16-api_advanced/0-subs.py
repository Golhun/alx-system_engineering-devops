#!/usr/bin/python3
"""
Module to query the number of subscribers for a given subreddit.
"""

import requests


def number_of_subscribers(subreddit):
    """
    Function that queries the Reddit API and returns the number of subscribers
    (not active users, total subscribers) for a given subreddit.

    Args:
        subreddit (str): The subreddit to query.

    Returns:
        int: Number of subscribers for the given subreddit, or 0 if invalid subreddit.
    """
    if subreddit is None or not isinstance(subreddit, str):
        return 0

    user_agent = {'User-agent': 'Google Chrome Version 81.0.4044.129'}
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    response = requests.get(url, headers=user_agent)
    if response.status_code != 200:
        return 0

    results = response.json()
    try:
        return results.get('data', {}).get('subscribers', 0)
    except Exception:
        return 0
