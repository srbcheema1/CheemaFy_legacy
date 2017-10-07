#!/usr/bin/env python3
import requests
import os
from sys import argv,exit
from bs4 import BeautifulSoup


def play(query):
    query=query.replace(' ','+')

    # Search for the song youtube
    url='https://www.youtube.com/results?search_query='+query
    source_code = requests.get(url, timeout=15)
    plain_text=source_code.text
    soup=BeautifulSoup(plain_text,"html.parser")

    # scrape the link of first video with that song name
    songs=soup.findAll('div',{'class':'yt-lockup-video'})
    song=songs[0].contents[0].contents[0].contents[0]
    link=song['href']

    # play it by visiting the link and also minimize it
    minimize1 = "wmctrl -a firefox; xdotool key Ctrl+Alt+KP_Insert"
    firefox_start = "firefox http://www.youtube.com"+link
    os.system(firefox_start + " ; " + minimize1 )
    #webbrowser.open('https://www.youtube.com'+link)

if(len(argv)==2):
    if(argv[1]=="stop"):
        stop_command = "wmctrl -a firefox; xdotool key Ctrl+w;xdotool key Ctrl+Alt+KP_Insert"
        os.system(stop_command)
        exit()
    else:
        query=argv[1];
else:
    query=input('Enter the song to be played: ')

play(query)
