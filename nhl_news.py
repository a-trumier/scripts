#!/usr/bin/env python3.13

import requests
from bs4 import BeautifulSoup
import json
import datetime
import pytz
from datetime import datetime

url = "https://www.nhl.com"

resp = requests.get(url)
soup = BeautifulSoup(resp.text, "html.parser")
resp.close()

d = soup.find_all(class_="nhl-o-menu__link nhl-c-headlines__link")

n = "NHL News"
print(f"{n:>84s}")
print()

for item in d[::-1]:
    print(f"{item.text[:80]:>80s} | {url + item["href"]:>5}")

url2 = "https://api-web.nhle.com/v1/schedule/"

cur_date = str(datetime.today()).split()[0]

resp2 = requests.get(url2 + cur_date)
jsawn = json.loads(resp2.content)
resp2.close()

game_dict = {}
tz = pytz.timezone("America/Regina")
print("Games from " + cur_date + " to " + jsawn["nextStartDate"])
for day in jsawn["gameWeek"]:
    game_dict[day["date"]] = []
    for game in day["games"]:
        dt = datetime.strptime(game["startTimeUTC"], "%Y-%m-%dT%H:%M:%S%z")
        time_str = str(dt.astimezone(tz))
        home_str = game["homeTeam"]["placeName"]["default"] + " " +game["homeTeam"]["commonName"]["default"]
        away_str = game["awayTeam"]["placeName"]["default"] + " " + game["awayTeam"]["commonName"]["default"]
        final_str = away_str + " at " + home_str + ": " + time_str
        game_dict[day["date"]].append(final_str)

print()

for x in game_dict.keys():
    print(x)
    print()
    for y in game_dict[x]:
        print(y)
    print()
