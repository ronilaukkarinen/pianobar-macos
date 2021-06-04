Enhanced pianobar for OS X
================

This is rolle's awesome fork of pianobar settings for OS X.

With pianobar-osx you can achieve a working Command Line Interface music player that plays radio from [Pandora](https://www.pandora.com), scrobbles songs to [Last.fm](http://www.last.fm) and more. All this with CLI!

## Features

- Notifies songs played with pianobar
- Loved songs in Pandora are automatically Loved songs in Last.fm when marked loved `+` key
- Displays currently playing album art in notification
- Scrobbles playing songs to Last.fm in real time and permanently when played 50% of the song
- Displays info about changing stations, displays station name in notification
- Mac OS X Media keys support
- Displays lyrics while playing from [LyricWiki](http://lyrics.wikia.com/)

## Requirements

1. [terminal-notifier](https://github.com/julienXX/terminal-notifier) - Send User Notifications on Mac OS X 10.8 from the command-line.
2. [pylast](https://github.com/pylast/pylast) (**important:** You will need the latest version, install with `easy_install pylast`, not `pip`)
3. [pianobar](https://github.com/PromyLOPh/pianobar) - pianobar is a free/open-source, console-based client for the personalized online radio Pandora.
4. python (`brew install python`)
5. pync (`pip install pync`)
6. [py-lyrics](https://github.com/tremby/py-lyrics)

## Usage

1. Install requirements
2. Clone this repo and move everything to `~/.config/pianobar`.
3. Add `~/.config/pianobar/config` with following:

````
#tls_fingerprint = 2D0AFDAFA16F4B5C0A43F3CB1D4752F9535507C0
user = your@email.com
password = YouReXtraHardPassWORd
event_command = /Users/rolle/.config/pianobar/events.py

# Get working proxies (if outside USA) (most of these don't seem to work after 06/2021):
# Lists:
# http://www.freeproxylists.net/?c=US&pt=&pr=&a%5B%5D=0&a%5B%5D=1&a%5B%5D=2&u=90
# http://proxydb.net/?protocol=http&protocol=https&country=US
# http://free-proxy.cz/en/proxylist/country/US/all/ping/all
# https://www.proxynova.com/proxy-server-list/country-us/
# https://www.us-proxy.org/

#control_proxy = http://localhost:9050

# Or with SOCKS5 and tor:
# 1) Install: https://github.com/robertkrimen/pianobarproxy/pull/2#issuecomment-853703139
# 2) brew install tor
# 3) (New Terminal:) tor
# 4) (New Terminal:) pianobarproxy -socks5 :9050
# 5) (New terminal:) pianobar

proxy = http://localhost:9090
````

4. Rename `events.py.sample` to `events.py`
5. Edit `events.py` and fill in the Last.fm variables at the top of the script.
6. Make sure everything is executable by `cd ~/.config/pianobar && sudo chmod +x *.py && sudo chmod +x *.sh && sudo chmod +x *.rb`
7. Create album for covers `mkdir -p ~/.config/pianobar/.covers`
8. To add Mac media keys support, setup [PianoKeys](https://github.com/shayne/PianoKeys) (**Note:** If you use Mac OS X Sierra, please use this alias: `alias pianobar='osascript -e '"'"'tell application "Terminal" to do script "pianokeys"'"'"' && pianobar'`, see [Issue #10](https://github.com/shayne/PianoKeys/issues/10))
9. Run `pianobar`

## Alias for tor + pianobar-proxy + pianobar

``` shell
alias pianobar='unset PYTHONPATH && osascript -e '"'"'tell application "Terminal" to do script "pianokeys"'"'"' && osascript -e '"'"'tell application "Terminal" to do script "tor"'"'"' && sleep 3 && osascript -e '"'"'tell application "Terminal" to do script "pianobarproxy -socks5 :9050"'"'"' && pianobar'
```

## Troubleshooting

If Last.fm happens to be down, pianobar won't load any music. You should disable `event_command` line during the downtime or wait it out.

If you don't get any notifications or scrobbles, try `which python` and change the first line from your events.py to the path, for example:

``` python
#!/Library/Frameworks/Python.framework/Versions/2.7/bin/python
```

## Screenshots

![](https://i.imgur.com/VUDCm9o.png "Screenshot")

![](https://i.imgur.com/kYZSMQ7.png "Screenshot")

![](https://i.imgur.com/vdnwoYX.png "Screenshot")
