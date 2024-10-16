<div align="center">
    <h1>🎨 Theme</h1>
    <h3></h3>
    <h2>🌟 Themes for WMs</h1>

![](https://img.shields.io/github/last-commit/cherrynoize/theme?logo=github&style=for-the-badge&color=FFB1C8&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/github/stars/cherrynoize/theme?style=for-the-badge&logo=andela&color=FFB686&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/github/repo-size/cherrynoize/theme?color=CAC992&label=SIZE&logo=googledrive&style=for-the-badge&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/badge/need-wpgtk-green?style=for-the-badge&color=CCE8E9&logoColor=D9E0EE&labelColor=292324)

</div>

<div align="justify">

**Theme** is a set of utilities for handling custom themes
within your system. **Global themes** are defined by *ini*
configuration files which define specifics adopted system-wide,
including **context themes** which are themes for a specific
context (*e.g: notifications*).

</div>

## 🎨 Default themes

> This section is currently a stub... Please, come back later.
> You can check themes out by running `theme-picker`.

## 🧱 Dependencies

```
# Official repos (Arch):
bash rofi
# AUR:
wpgtk pywalfox
```

>**Rofi** is only needed for the `wall-picker` and
>`theme-picker` commands.

To install all of the above (*on Arch*) run:

```
sudo pacman -S bash rofi
yay -S wpgtk pywalfox
```

## 🔧 Install

```
git clone https://github.com/cherrynoize/theme
cd theme
make clean install
```

If you only want to install binaries or themes, respectively:

```
make install-bin
make install-themes
```

> You can easily use `theme` in your own dotfiles by just
> installing binary files and adding your own system themes.

To uninstall:

```
make uninstall
```

## ⚙ Configuration

### Global themes

Global themes are plain-text configuration files found in
[.config/themes](../.config/themes). You can just open them in
any text editor, modify them, create new ones and remove
existing ones.

By default, system global themes are installed in `/etc/themes`.
User themes can be set in `~/.config/themes`. Or you can
specify custom paths by defining a `BASE_THEMES_DIR` and
`USER_THEMES_DIR` variable respectively.

>If you're using my [dotfiles](https://github.com/cherrynoize/dotfiles)
>you can set these in the [`.initrc`](.initrc) file.

Though provided global themes are still very simple, the
infrastructure is already capable of supporting endlessly
complex themes. You just need to set them up.

### Context themes

Themes can be set for a single context, such as `wallpaper`,
`bspwm`, `dunst`, etc.

Global themes are, at the very core, configuration files setting
multiple themes for separate contexts.

**Theme** is based upon
[`wpgtk`](https://github.com/deviantfero/wpgtk)
for easier global theming and automatic colorscheme generation
with `pywal`.

You're going to need to refer to the
[Wpgtk wiki](https://github.com/deviantfero/wpgtk/wiki)
if you want to start editing context themes or creating your own.

## 🛠 Usage

### Switching between themes (for a single context)

To switch between themes:

```
switch-theme [context] [theme]
```

List items that have themes:

```
switch-theme -l
```

And list themes available for given context:

```
switch-theme [context] -l
```

### Global themes

#### Switching between global themes (terminal)

Set a new theme:

```
theme set [theme]
```

List currently available themes:

```
theme list
```

For more options run:

```
theme help
```

#### Switching between global themes (GUI)

You can run `theme-picker` to switch between available system
and user defined global themes.

> Use option `--recent=false` to sort alphabetically instead of
> by recently used.

### Dark/light mode

You can toggle between light and dark mode using `switch-mode`
(`Super+<`).

Without arguments it will just toggle between light and dark
mode globally. It also takes single items (called a *context*)
to switch for or a specific mode (light or dark) to be set.

> **Note**: light mode is in beta and some stuff does not look
great. Have a look at the [known bugs](#-known-bugs) section.

### ⌘ General commands

#### Theme selector

    theme-picker

#### Wallpaper picker

    wall-picker

#### Random wallpaper

    change-wallpaper

#### Dark mode on/off

    switch-mode

### 🐛 Known bugs

#### Firefox

Some text visibility issues in light mode.

## 📋 TODO

- Implement wallpaper history for each theme and start sorting
by most recent in `wall-picker`
- Convert to a higher compression format
- AI upscaler on-the-fly with cache storage support
- Some wallpapers have some ugly artifacts/watermarks to be
removed
- Cut out border from wallpapers in
[`meranii`](../.wallpaper-themes/meranii) theme

- Make `switch-mode` keep both `-dark` and `-light` versions
and use a suffix-less link to avoid this dizzy switching back
and forth in commits just because a different mode is set.
(Be sure to have it check for link destination instead of
existance in `get_cur_mode`.)

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

- [wacca〇わっか](https://www.pixiv.net/en/users/46612726) for
her amazing collection
([meranii theme](../.wallpaper-themes/meranii))
- Also I've removed some watermarks from a few wallpapers just
for aesthetic reasons, please don't get mad at me. I'll be glad
to add a link to your original work if you reach out.

### Thanks for using *theme*!
