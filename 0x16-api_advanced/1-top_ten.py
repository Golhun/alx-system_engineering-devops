#!/usr/bin/python3
"""
Module to print the titles of the first 10 hot posts listed for a given subreddit.
"""

import requests


def top_ten(subreddit):
    """
    Function that queries the Reddit API and prints the titles of the first
    10 hot posts listed for a given subreddit.

    Args:
        subreddit (str): The subreddit to query.
    """
    if subreddit is None or not isinstance(subreddit, str):
        print("None")
        return

    user_agent = {'User-agent': 'Google Chrome Version 81.0.4044.129'}
    params = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)

    response = requests.get(url, headers=user_agent, params=params)
    if response.status_code != 200:
        print("None")
        return

    results = response.json()

    try:
        my_data = results.get('data', {}).get('children', [])

        for post in my_data:
            print(post.get('data', {}).get('title'))

    except Exception:
        print("None")
