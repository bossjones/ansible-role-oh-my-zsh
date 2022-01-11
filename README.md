# ansible-role-oh-my-zsh

[Version: v0.1.0]


#### Initialization order of files:

SOURCE: https://github.com/crineu/arquivosponto/blob/00109fd1546caa3863170127db7e56bf63d4cca3/README.md

* `.zshenv`: invoked always; it should be concise and merely initialize the necessary variables;
* `.zlogin`: loaded into _login shells_ after `.zshrc`; compiles _zcompdump_ in background as it is slow process and done 1x / login;
* `.zprofile` : similar to `.zlogin` but loaded before `.zshrc` (`.zprofile` and `.zshrc` are ignored in _non-login non-interactive shells - so I learned a trick from Prezto that declares environment variables in _.zprofile_ and uses .zshenv_ to source _.zprofile_ (eg .zprofile and .zshenv). This way, non-login non-interactive shells will receive proper variable initialisations).
* `.zshrc`: loaded in _interactive shells_; contains the main part of the ZSH settings.

Zsh Configuration Files
=======================

Zsh has several system-wide and user-local configuration files.

System-wide configuration files are installation-dependent but are installed
in */etc* by default.

User-local configuration files have the same name as their global counterparts
but are prefixed with a dot (hidden). Zsh looks for these files in the path
stored in the `$ZDOTDIR` environmental variable. However, if said variable is
not defined, Zsh will use the user's home directory.

File Descriptions
-----------------

The configuration files are read in the following order:

  01. /etc/zshenv
  02. ~/.zshenv
  03. /etc/zprofile
  04. ~/.zprofile
  05. /etc/zshrc
  06. ~/.zshrc
  07. /etc/zlogin
  08. ~/.zlogin
  09. ~/.zlogout
  10. /etc/zlogout

### zshenv

This file is sourced by all instances of Zsh, and thus, it should be kept as
small as possible and should only define environment variables.

### zprofile

This file is similar to zlogin, but it is sourced before zshrc. It was added
for [KornShell][1] fans. See the description of zlogin bellow for what it may
contain.

zprofile and zlogin are not meant to be used concurrently but can be done so.

### zshrc

This file is sourced by interactive shells. It should define aliases,
functions, shell options, and key bindings.

This is the main Oh My Zsh configuration file.

### zlogin

This file is sourced by login shells after zshrc, and thus, it should contain
commands that need to execute at login. It is usually used for messages such as
[fortune][2], [msgs][3], or for the creation of files.

This is not the file to define aliases, functions, shell options, and key
bindings. It should not change the shell environment.

### zlogout

This file is sourced by login shells during logout. It should be used for
displaying messages and the deletion of files.


Desktop tools
-------

[1]: https://brew.sh/
[2]: https://support.1password.com/command-line-getting-started/
[3]: https://www.google.com/chrome/
[4]: https://www.mozilla.org/en-US/firefox/new/
[5]: https://www.alfredapp.com/
[6]: https://apps.apple.com/app/slack/id803453959
[7]: https://iterm2.com/downloads.html
[8]: https://www.spotify.com/us/download/other/
[9]: https://code.visualstudio.com/download
[10]: [Divvy](https://mizage.com/divvy/)
[11]: iina
[12]: [theunarchiver](https://theunarchiver.com/)
[13]: https://www.virtualbox.org/wiki/Downloads
[14]: https://www.vagrantup.com/downloads.html
[15]: https://discord.com/download
[16]: https://www.yacreader.com/
[17]: https://github.com/bossjones/linux-dotfiles/pull/28



Authors
-------

*The authors of these files should be contacted via the [issue tracker][4].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.kornshell.com
[2]: http://en.wikipedia.org/wiki/Fortune_(Unix)
[3]: http://www.manpagez.com/man/1/msgs
[4]: https://github.com/sorin-ionescu/oh-my-zsh/issues
