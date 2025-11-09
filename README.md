# Мои Dotfiles для Hyprland

Этот репозиторий содержит мои конфигурационные файлы (dotfiles) для Hyprland, Waybar, Rofi, Alacritty и других приложений.

## Установка

Для установки конфигураций используется удобный bash-скрипт `install.sh`.

**Что делает скрипт:**
*   Автоматически находит ваши существующие конфигурации.
*   Создает их резервные копии (с расширением `.bak`).
*   Перемещает новые конфигурации из этого репозитория в нужные системные папки.

### 1. Установка пакетов

Перед запуском скрипта установки убедитесь, что все необходимые пакеты установлены в вашей системе. Эти конфигурации предназначены для Arch Linux.

**Команда для установки:**
```bash
sudo pacman -S --needed hyprland waybar hyprpaper hypridle hyprlock hyprshot swaync firefox alacritty rofi thunar brightnessctl pipewire wireplumber pamixer cliphist wl-clipboard polkit-gnome xdg-utils grim slurp jq swappy noto-fonts-emoji ttf-font-awesome nwg-look qt5-wayland qt6-wayland cava
```

**AUR Пакеты:**
Некоторые приложения, такие как `nekoray`, могут находиться в AUR (Arch User Repository). Установите их с помощью вашего AUR-хелпера (например, `yay`):
```bash
yay -S nekoray wlogout
```

### 2. Инструкция
    ```bash
    git clone https://github.com/TwoSug4r/Hyprland-Dots.git ~/my-config
    ```

2.  **Перейдите в директорию с репозиторием:**
    ```bash
    cd ~/my-config
    ```

3.  **Сделайте скрипт исполняемым:**
    ```bash
    chmod +x install.sh
    ```

4.  **Запустите скрипт:**
    ```bash
    ./install.sh
    ```

После выполнения скрипта ваши новые конфигурации будут установлены. Возможно, потребуется перезапустить приложения или всю сессию, чтобы изменения вступили в силу.

## Мой Telegram-канал

Присоединяйтесь к моему Telegram-каналу для обновлений и обсуждений: [AnonymousCursedBlessed](https://t.me/AnonymousCursedBlessed)
