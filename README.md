# ansible-role-oh-my-zsh

[Version: v0.1.0]


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
[1]: https://support.1password.com/command-line-getting-started/
[2]: https://www.google.com/chrome/
[3]: https://www.mozilla.org/en-US/firefox/new/
[4]: https://www.alfredapp.com/
[5]: https://apps.apple.com/app/slack/id803453959
[6]: https://iterm2.com/downloads.html
[6]: https://www.spotify.com/us/download/other/
[7]: https://code.visualstudio.com/download
[7]: [Divvy](https://mizage.com/divvy/)
[7]: iina
[7]: [theunarchiver](https://theunarchiver.com/)
[7]: https://www.virtualbox.org/wiki/Downloads
[7]: https://www.vagrantup.com/downloads.html
[7]: https://discord.com/download
[7]: https://www.yacreader.com/



Authors
-------

*The authors of these files should be contacted via the [issue tracker][4].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.kornshell.com
[2]: http://en.wikipedia.org/wiki/Fortune_(Unix)
[3]: http://www.manpagez.com/man/1/msgs
[4]: https://github.com/sorin-ionescu/oh-my-zsh/issues
