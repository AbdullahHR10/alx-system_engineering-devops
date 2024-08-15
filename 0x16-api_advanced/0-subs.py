#!/usr/bin/python3
"""Module that contains number_of_subscribers function"""
import requests


def number_of_subscribers(subreddit):
    """Queries the Reddit API and returns the number of subscribers
    to the subreddit"""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {"User-Agent": "Bedo125/5.0"}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        data = response.json()
        return data['data']['subscribers']
    else:
        return 0
