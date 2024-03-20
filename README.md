<div align="center">
    <h1>Global themes for WMs</h1>
    <h3></h3>

![](https://img.shields.io/github/last-commit/cherrynoize/theme?logo=github&style=for-the-badge&color=FFB1C8&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/github/stars/cherrynoize/theme?style=for-the-badge&logo=andela&color=FFB686&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/github/repo-size/cherrynoize/theme?color=CAC992&label=SIZE&logo=googledrive&style=for-the-badge&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/badge/need-wpgtk-green?style=for-the-badge&color=CCE8E9&logoColor=D9E0EE&labelColor=292324)

In the hope this can help me rationalize all the time
poured into my dotfiles and make me happy.

</div>

## 🧱 Dependencies

```
# From the official repos:
bash
# From the AUR:
wpgtk
```

## 🔧 Install

```
git clone https://github.com/cherrynoize/theme
cd theme
make clean install
```

To uninstall:

```
make uninstall
```

## ⚙ Configuration

### Global themes

By default, base global themes are installed in `/etc/themes`.
User themes can be set in `~/.config/themes`. Or you can
specify custom paths by editing the `BASE_THEMES_DIR` and
`USER_THEMES_DIR` variables in [`.initrc`](.initrc).

### Local themes

> Note: *local* does not refer to **user** themes. Both base
> and user themes are **global** themes.

Local themes are single context themes. Global themes are
complex (as in containing multiple separate objects)
configurations which include the configuration/theme for
several single contexts. A global theme can be a collection of
multiple themes to be set each for the appropriate context


**Theme** is based upon
[`wpgtk`](https://github.com/deviantfero/wpgtk)
for easier global theming and automatic colorscheme generation
with `pywal`.

You're going to need to refer to the
[wiki](https://github.com/deviantfero/wpgtk/wiki)
if you want to start editing themes or creating your own.

Also, for better portability template symlinks are not hardcoded
and can be (re-)generated at anytime using `fix-wpg-templates`.

## 🎨 Themes

Themes are currently in alpha so please be nice. I'm setting up
themes for everything - just be patient.

To switch between themes:

```
switch-theme [thing-to-change-theme-for] [new-theme]
```

List items that have themes:

```
switch-theme -l
```

And list themes available for given item (or context):

```
switch-theme [context] -l
```

### Dark/light mode

You can toggle between light and dark mode using `switch-mode`
(`Super+<`).

Without arguments it will just toggle between light and dark
mode globally. It also takes single items (called a *context*)
to switch for or a specific mode (light or dark) to be set.

> **Note**: light mode is in beta and some stuff does not look
great. Have a look at the [known bugs](#-known-bugs) section.

### Global themes

You can run `theme-picker` to switch between available global
themes.

> Use option `--recent=false` to sort alphabetically instead of
> by recently used.

Global themes are plain-text configuration files found in
[.config/themes](../.config/themes). You can just open them in
your favorite editor, modify them, create new ones and remove
existing ones.

> Though provided global themes are still primitive, the
> infrastructure is already capable of supporting endlessly
> complex themes. You just need to set them up.

### wpgtk

<details>
<summary></summary>

![preview](images/wpgtk_preview1.mp4)

![screenshot](images/wpgtk1.png)

</details>

### Dash

<details>
<summary></summary>

![preview](images/dash_ani1.gif)

![screenshot](images/dash1.png)

</details>

## 🛠 Usage

>⚠ Please do not use binaries or shell aliases unless you
>understand what they do. Take the time to inspect the code first.

### ⌘ Useful commands, aliases & shortcuts

You can find all binary files in `~/bin` and `~/.local/bin`,
shell aliases in `~/.config/fish/config.fish` and keyboard
shortcuts in `.config/sxhkd/sxhkdrc`. Compiling an extensive
shortcuts/commands help is in the [`TODO`](#-todo) list.

<details>
<summary>This is just some basic commands to get you
started.</summary>

#### Spawn a terminal window

    "$TERMINAL" # Super+shift

#### Application launcher

    rofi -show drun # Super+x

#### Run prompt

    rofi -show run # Super+r

#### Theme selector

    theme-picker # Super+space

#### Switch between selected theme's wallpapers

    wall-picker # Super+ctrl+space

#### Random wallpaper

    change-wallpaper # Super+Ctrl+w

#### Dark mode on/off

    switch-mode # Super+<

#### Toggle dock

    dock toggle # Super+z

#### Launch browser

    "$BROWSER" # Super+Alt+w

#### Text editor

    launch-nvim # use 'nvim' as an alias fish/bash

#### Fix common issues

    unfuck everything # Super+Shift+Esc

### ⌨ Keys

#### Neovim

    {Alt,Shift}+Tab            Move to next/previous tab
    Space;{Shift}+Tab          Move to next/previous buffer
    Alt+{h,j,k,l}              Move to adjacent window
    Ctrl+{h,j,k,l}             Move to adjacent window (wraparound)
    Ctrl+{Left,Up,Down,Right}  Resize window
    Space                      Help menu

#### Rofi

    {Tab,Shift}+Tab  Move to next/previous entry
    h,j,k,l          Vi-like keybindings for moving around
    Alt+{h,j,k,l}    Where there's also a searchbar

</details>

### 📔 Tricks & tips

#### Auto-refresh sudo timeout

`sudo` privilege timeout for the shell is refreshed with `sudo
-v`. `fish` already has [an abbreviation set](../.config/fish/fishrc)
to replace `sudo` with `sudo -v; sudo` so that it gets updated
each time. However, I find that cumbersome as well as annoying
to have that prefix to each command and it doesn't work well
with auto-completion/suggestions as well as with other
abbreviations, so you can call `sd` rather than `sudo`
to avoid all that. (Also, in case you're wondering, you cannot
use a function because that would enter an infinite loop.)

In case it conflicts with other programs in your system, just use
`sudo`.

### 🐛 Known bugs

#### Firefox

Some issues with text visibility in light mode.

#### eww

- Widget windows closers sometimes get stuck open, causing you to
accidentally open popup windows when clicking on other windows
rather than close them. To fix this you could restart `eww`,
but usually it's enough to click on the pfp icon that open the
panel window once to open it, then a second time to close it.

- `eww` tends to get on top of other windows after being
restarted during the session. I still haven't found how I could
prevent it from happening (all suggestions are welcome).

> My workaround for the time being is to just
> [toggle the bar](#-toggle-bar). Besides, if you don't ever
> toggle it this shouldn't come up.

#### Music player cover

I currently use Spotify and as such I only set [`music`](../bin/music)
to fetch cover arts from Spotify metadata. I will try to expand
on this but, please, if anyone has a specific request provide me
with a metadata sample (output of `playerctl --player="$player"
metadata mpris:artUrl`) and I'll add it.

### 🔩 Troubleshooting

In case something's not working as expected, or if you suddenly
notice a lag in your system and you don't know what's causing it:

```
unfuck everything
```

This should help. If it doesn't, you'll have to find the issue
and actually do something about it.

## 📋 TODO

### Install and configuration

- Installation script
- Finish making initrc

### Bar

- Auto memorize bar status (open or closed) between sessions
- Fix bar auto closing on resume after sleep

### Wallpapers

- Implement wallpaper history for each theme and start sorting
by most recent in `wall-picker`
- Convert to a higher compression format
- AI upscaler on-the-fly with cache storage support
- Some wallpapers have some ugly artifacts/watermarks to be
removed
- Cut out border from wallpapers in
[`meranii`](../.wallpaper-themes/meranii) theme

### Themes

- Make `switch-mode` keep both `-dark` and `-light` versions
and use a suffix-less link to avoid this dizzy switching back
and forth in commits just because a different mode is set.
(Be sure to have it check for link destination instead of
existance in `get_cur_mode`.)

### Support

- Shortcuts/commands usage popup window

## ✨ Contribute

You can have a look at the [TODO](#-todo) and
[known bugs](#-known-bugs) lists. Or open a PR/issue if you have
found more.

If you feel like you have something to add please do.

### Community themes

If you feel like it, you can submit your own theme. I'm not
exactly sure what I'm going to do with those but I would like
people to be able to share and browse custom themes.
Or I might add them to the main repo if they fit.

Even the wallpapers alone are worth consideration if it's a well
curated selection of at least 2 or 3 for both light and
dark versions.

## 💕 Sponsor

[**Buy me a coke 💙**](https://cherrynoize.github.io/#/contribute)

## 🙏 Thanks

- [gh0stzk's dotfiles](https://github.com/gh0stzk/dotfiles) for
inspiration as well as a lot of code stolen especially for the
Rofi theme selector
- [wacca〇わっか](https://www.pixiv.net/en/users/46612726) for
her amazing collection
([meranii theme](../.wallpaper-themes/meranii))
- Also I've removed some watermarks from a few wallpapers just
for aesthetic reasons, please don't get mad at me. I'll be glad
to add a link to your original work if you reach out.

## And thanks to you for using my dotfiles

*If you like them please consider giving us a star. Bye!*

