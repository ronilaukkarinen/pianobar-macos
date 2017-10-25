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
3. [pianobar](https://6xq.net/pianobar/) - pianobar is a free/open-source, console-based client for the personalized online radio Pandora.
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
control_proxy = http://xxx.xx.xxx.xxx:80
event_command = /Users/yourusername/.config/pianobar/events.py

# Get working proxies (if outside USA): http://proxylist.hidemyass.com/search-1303410#listable
# With response times: http://www.gatherproxy.com/proxylist/country/?c=United%20States

# My personal favorite:
# Uptime: 1463/36, response times: 14ms
control_proxy = http://107.21.56.41:80
````

4. Rename `events.py.sample` to `events.py` and fill your Last.fm and path information accordingly
6. Make sure everything is executable by `cd ~/.config/pianobar && sudo chmod +x *.py && sudo chmod +x *.sh && sudo chmod +x *.rb`
5. Create album for covers `mkdir -p ~/.config/pianobar/.covers`
6. To add Mac media keys support, setup [PianoKeys](https://github.com/shayne/PianoKeys) (**Note:** If you use Mac OS X Sierra, please use this alias: `alias pianobar='osascript -e '"'"'tell application "Terminal" to do script "pianokeys"'"'"' && pianobar'`, see [Issue #10](https://github.com/shayne/PianoKeys/issues/10))
7. Run `pianobar`

## Troubleshooting

If Last.fm happens to be down, pianobar won't load any music. You should disable `event_command` line during the downtime or wait it out.

If you don't get any notifications or scrobbles, try `which python` and change the first line from your events.py to the path, for example:

``` python
#!/Library/Frameworks/Python.framework/Versions/2.7/bin/python
```

## Screenshots

![](https://rolle.wtf/pianobar-osx.png "Screenshot")

![](https://dl.dropboxusercontent.com/u/18447700/pianobar-nowplaying.png "Screenshot")

![](https://dl.dropboxusercontent.com/u/18447700/pianobar-loved-new.png "Screenshot")
