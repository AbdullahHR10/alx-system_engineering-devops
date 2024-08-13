#!/usr/bin/python3
"""Module that contains number_of_subscribers function"""
import requests


def number_of_subscribers(subreddit):
    """Queries the Reddit API and returns the number of subscribers
    to the subreddit"""
    sub_info = requests.get(
        "https://www.reddit.com/r/{subreddit}/about.json",
        headers={"User-Agent": "My-User-Agent"},
        allow_redirects=False,
    )
    if sub_info.status_code >= 300:
        return 0

    return sub_info.json().get("data").get("subscribers")
