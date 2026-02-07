#!/bin/bash
echo "Iniciando instalacion de entorno Hyprland..."

# 1. Instalar dependencias core
sudo pacman -Syu --noconfirm
sudo pacman -S --noconform base-devel git ttf-jetbrains-mono-nerd zram-generator waybar swww

# 2. Instalar Yay (AUR) si no existe
if ! command -v yay &> /dev/null; then
	git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -si --noconfirm
	cd .. && rm -rf yay
fi

# 3. Instalar aplicaciones visuales y dev
yay -S --noconfirm hyprland ghostty zen-browser-bin bun-bin visual-studio-code-bin

# 4. Copiar configuraciones
cp -r .config/* ~/.config/

# 5. Activar ZRAM para tus 16Gb/32GB
sudo systemctl enable --now systemd-zram-setup@zram0

echo "Todo listo!! Reinicia y entra en Hyprland."
