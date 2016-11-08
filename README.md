Enhanced pianobar for OS X
================

This is my fork of pianobar settings for OS X.

With pianobar-osx you can achieve a working Command Line Interface music player that plays radio from [Pandora](https://www.pandora.com), scrobbles songs to [Last.fm](http://www.last.fm) and more. All this with CLI!

![](https://dl.dropboxusercontent.com/u/18447700/pianobar-loved.png "Screenshot")

## Features

- Notifies about playing songs
- Loved songs in Pandora are automatically Loved songs in Last.fm
- Fetches album art for currently playing song and displays it in a notification
- Scrobbles playing songs to Last.fm

## Requirements

1. [terminal-notifier](https://github.com/julienXX/terminal-notifier) - Send User Notifications on Mac OS X 10.8 from the command-line.
2. pylast python module (included)
3. [pianobar](https://6xq.net/pianobar/) - pianobar is a free/open-source, console-based client for the personalized online radio Pandora.
4. python (`brew install python`)
5. [sacad](https://github.com/desbma/sacad) - Smart Automatic Cover Art Downloader

## Usage

1. Install requirements
2. Clone this repo and move everything to `~/.config/pianobar`.
3. Add `~/.config/pianobar/config` with following:

````
#tls_fingerprint = 2D0AFDAFA16F4B5C0A43F3CB1D4752F9535507C0
user = your@email.com
password = YouReXtraHardPassWORd
control_proxy = http://xxx.xx.xxx.xxx:80
event_command = /Users/yourusername/.config/pianobar/scrobble.py

# Get working proxies (if outside USA): http://proxylist.hidemyass.com/search-1303410#listable
````

4. Rename `scrobble.py.sample` to `scrobble.py` and fill your Last.fm and path information accordingly
6. Make sure everything is executable by `cd ~/.config/pianobar && sudo chmod +x *.py && sudo chmod +x *.sh && sudo chmod +x *.rb`
7. Create album for covers `mkdir -p ~/.config/pianobar/.covers`
8. Run `pianobar` (add alias `alias pianobar='pianobar 2>&1 | grep -v API'` if getting deprecated warnings)
