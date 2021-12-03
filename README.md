# Dotfiles, mac-specific, managed with yadm

Install yadm, and then yadm clone, and then off to the races!

> These are contained in the .install.sh script

```
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
yadm clone git@github.com:blackary/dotfiles3.git
yadm bootstrap
```


## Other things to install:

This list is partly to remind me, and partly to try and move some of these
things into bootstrap scripts within yadm

* vscode
* brave
* Caffeine # for keeping computer awake when needed
* krisp
* MiddleClick # enabling middle-click with magic mouse
* Mini Calendar
* Rectangle # window management
* Warp
* alfred
* Slack
