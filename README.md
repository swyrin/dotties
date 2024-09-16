<div align="center">

![Arch Linux](https://img.shields.io/badge/Distribution-Arch%20Linux-0f94d2?style=for-the-badge&logo=arch-linux)
![Wayland](https://img.shields.io/badge/Powered%20by-wayland-ffbc00?style=for-the-badge&logo=linux)
![Hyprland](https://img.shields.io/badge/DE-Hyprland-00b4dc?style=for-the-badge)
![Catppuccin](https://img.shields.io/badge/Color-Catppuccin-a6da95?style=for-the-badge&labelColor=363a4f)

</div>

# ✨ My own Arch Linux (btw) setup

> [!TIP]
> The entries listed are *not exhaustive*.

- WM: Hyprland
- Login manager: SDDM with a *patched* [theme](https://github.com/Keyitdev/sddm-astronaut-theme), with `weston` preconfigured.
- Screen lock: Hyprlock
- Screenshot: Hyprshot
- Screen shader: Hyprshade, with "Night Shift" set up and enabled at 18:00 - 7:00
- Idle daemon: Hypridle, configured with both temporary lock and deep-sleep
- Terminal emulator: Alacritty
- Shell: ZSH with powerlevel10k *plus a whole load of plugins*
- Status bar: Waybar
- Application launcher: Rofi with [rofimoji](https://github.com/fdw/rofimoji)
- System information: fastfetch
- Notification: mako
- Sound system: Pipewire with PulseAudio compatibility layer
- Color picker: Hyprpicker with a dedicated keybind
- Power button: wlogout

# 😳 Can I use it?

Just download the repository and then:

```sh
$ ./anything.sh
```

> [!TIP]
> You can run `anything.sh` as many as you want!

> [!WARNING]
> Even though the script has been test-run'd many times, bugs can appear like:
> - Buttons not working.
> - Some elements do not look like the screenshots.
>
> In that case - feel free to [fire a pull request](https://github.com/swyrin/dotties/pulls) and we can talk about it.

# 📸 Screenshots

> [!NOTE]
> Not exactly one-to-one, but should give you an idea on how it looks.

| Rofi             |  fastfetch         |
|----------------------------|--------------------------|
![](https://raw.githubusercontent.com/swyrin/dotties/main/screenshots/s1.png)  |  ![](https://raw.githubusercontent.com/swyrin/dotties/main/screenshots/s2.png)

|    SDDM | Hyprlock |
|----------------------------|--------------------------|
![](https://raw.githubusercontent.com/swyrin/dotties/main/screenshots/s3.png)  |  ![](https://raw.githubusercontent.com/swyrin/dotties/main/screenshots/s4.png)
