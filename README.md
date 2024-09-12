<div align="center">

![Arch Linux](https://img.shields.io/badge/Distribution-Arch%20Linux-0f94d2?style=for-the-badge&logo=arch-linux)
![Wayland](https://img.shields.io/badge/Powered%20by-wayland-ffbc00?style=for-the-badge&logo=linux)
![Hyprland](https://img.shields.io/badge/DE-Hyprland-00b4dc?style=for-the-badge)

</div>

# ✨ My own Arch Linux (btw) setup

> [!TIP]
> The entries listed are *not exhaustive*.

- WM: Hyprland
- Login manager: SDDM with a *patched* [theme](https://github.com/Keyitdev/sddm-astronaut-theme)
- Screen lock: Hyprlock
- Idle daemon: Hypridle, configured with both temporary lock and deep-sleep.
- Terminal emulator: Alacritty
- Shell: ZSH with powerlevel10k *plus a whole load of plugins*
- Status bar: Waybar
- Application launcher: Rofi with [clipboard history](https://wiki.hyprland.org/Useful-Utilities/Clipboard-Managers/#cliphist) and [emoji picker](https://github.com/fdw/rofimoji) 
- System information: fastfetch
- Notification: mako
- Soundsystem: Pipewire with PulseAudio compatibility layer.

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

#### 🤨 What about `extension_scripts`?

- This customization is made with no optimizations/adjustments in mind. So that is what they will do - some examples:
   - Tune down resource usage if you are on laptop **AND** on battery.
   - Fix up gamma adjustment on NVIDIA.
   - *Motivate your machine so that it should run at its highest peak.* 

# 📸 Screenshots

> [!NOTE]
> Not exactly one-to-one, but should give you an idea on how it looks.

| Rofi             |  fastfetch         |
|----------------------------|--------------------------|
![](https://raw.githubusercontent.com/swyrin/dotties/rework/screenshots/s1.png)  |  ![](https://raw.githubusercontent.com/swyrin/dotties/rework/screenshots/s2.png)

|    SDDM | Hyprlock |
|----------------------------|--------------------------|
![](https://raw.githubusercontent.com/swyrin/dotties/rework/screenshots/s3.png)  |  ![](https://raw.githubusercontent.com/swyrin/dotties/rework/screenshots/s4.png)
