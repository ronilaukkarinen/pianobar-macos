Enhanced pianobar for macOS
================

This is rolle's awesome fork of pianobar settings for macOS.

With pianobar-macos you can achieve a working Command Line Interface music player that plays radio from [Pandora](https://www.pandora.com), scrobbles songs to [Last.fm](http://www.last.fm) and more. All this with CLI!

## Features

- Always connects to Pandora regardless of country (SOCKS5 and Tor)
- Notifies songs played with pianobar
- Loved songs in Pandora are automatically Loved songs in Last.fm when marked loved `+` key
- Displays currently playing album art in notification
- Scrobbles playing songs to Last.fm in real time and permanently when played 50% of the song
- Displays info about changing stations, displays station name in notification

<img width="957" alt="Screen-Shot-2022-10-18-09-29-47 82" src="https://user-images.githubusercontent.com/1534150/196352855-23b70839-ffe8-4bbc-9a90-ad2942bfc5ab.png">

## Installation

1. [terminal-notifier](https://github.com/julienXX/terminal-notifier) - Send User Notifications on macOS 10.8 and later from the command-line:
   ```bash
   brew install terminal-notifier
   ```
2. Python3
   ```bash
   brew install python3
   ```
3. [pylast](https://github.com/pylast/pylast)
   **important:** You will need the latest version, install with:
   ```bash
   pip3 install pylast
   ```
4. pync
   ```bash 
   pip3 install pync
   ```
5. [pianobar](https://github.com/PromyLOPh/pianobar) - pianobar is a free/open-source, console-based client for the personalized online radio Pandora.
   ```bash
   brew install pianobar
   ```

6. Tor
   ```bash
   brew install tor
   ```

7. [pianobarproxy](https://github.com/robertkrimen/pianobarproxy/pull/2#issuecomment-853703139)
   ```bash
   go install github.com/brendanhoran/pianobarproxy@latest
   ```

8. Add tor config with `sudo nano /opt/homebrew/etc/tor/torrc`:

   ```ini
   SOCKSPort 9050
   #SOCKSPolicy accept 192.168.0.0/16
   #SOCKSPolicy accept6 FC00::/7
   #SOCKSPolicy reject *
   Log notice file /opt/homebrew/var/log/tor/notices.log
   Log debug file /opt/homebrew/var/log/tor/debug.log
   #Log debug stderr
   RunAsDaemon 0
   DataDirectory /opt/homebrew/var/lib/tor
   #HashedControlPassword 16:872860B76453A77D60CA2BB8C1A7042072093276A3D701AD684053EC4C
   #CookieAuthentication 1
   ```
   
## Usage

1. Install requirements (steps above)
2. Clone this repo and move everything to `~/.config/pianobar`:

   ```bash
   cd $HOME; git clone https://github.com/ronilaukkarinen/pianobar-macos; cd pianobar-macos; mkdir -p $HOME/.config/pianobar; cp -Rv $HOME/pianobar-macos/* $HOME/.config/pianobar/; rm -rf $HOME/pianobar-macos
   ```

3. Edit:

   ```bash
   nano $HOME/.config/pianobar/config
   ```
   
   Add following:

   ```ini
   user = yourusername@gmail.com
   password = YourVeryHardPassWordForPandora
   event_command = /Users/rolle/.config/pianobar/events.py
   proxy = http://127.0.0.1:9090
   ```

4. Rename `events.py.sample` to `events.py`:
   ```bash
   mv $HOME/.config/pianobar/events.py.sample $HOME/.config/pianobar/events.py
   ```

5. Edit `events.py` and fill in the Last.fm variables at the top of the script.
6. Make sure everything is executable:
   ```bash
   cd $HOME/.config/pianobar && sudo chmod +x *.py && sudo chmod +x *.sh && sudo chmod +x *.rb
   ```
7. Create folder for covers:
   ```bash
   mkdir -p $HOME/.config/pianobar/.covers
   ```   
8. Open three terminal windows and run these, tor and pianobarproxy and pianobar in their separate windows:
   ```bash
   unset PYTHONPATH
   tor
   export GOPATH=/Users/rolle/go
   export PATH=$GOPATH/bin:$PATH
   pianobarproxy -socks5 :9050
   pianobar
   ```

## Troubleshooting

If Last.fm happens to be down, pianobar won't load any music. You should disable `event_command` line during the downtime or wait it out.

If you don't get any notifications or scrobbles, try `which python` and change the first line from your events.py to the path, for example:

``` python
#!/Library/Frameworks/Python.framework/Versions/2.7/bin/python
```
