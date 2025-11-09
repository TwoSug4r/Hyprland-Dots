#!/bin/bash

# Скрипт для установки dotfiles из этого репозитория.
# Перемещает файлы конфигурации в нужные места, создавая резервные копии существующих.

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Директория, где находится скрипт (и dotfiles)
# Это позволяет запускать скрипт из любого места
SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Целевые директории
CONFIG_DIR="$HOME/.config"
HOME_DIR="$HOME"

echo -e "${YELLOW}Начинаем установку dotfiles...${NC}"
echo "Исходная директория: $SOURCE_DIR"
echo "Целевая директория для большинства конфигов: $CONFIG_DIR"
echo "-----------------------------------------------------"

# Функция для перемещения и создания резервной копии
install_config() {
    local source_name=$1
    local target_path=$2
    local source_path="$SOURCE_DIR/$source_name"

    # Проверяем, существует ли исходный файл/папка
    if [ ! -e "$source_path" ]; then
        echo -e "  -> ${YELLOW}ПРЕДУПРЕЖДЕНИЕ:${NC} Исходный файл/папка '$source_name' не найден в '$SOURCE_DIR'. Пропускаем."
        return
    fi

    local target_dir=$(dirname "$target_path")

    # Создаем целевую директорию, если она не существует
    mkdir -p "$target_dir"

    # Если по целевому пути уже что-то есть, делаем резервную копию
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        echo -e "  -> Найден существующий конфиг: ${target_path}. Создаю резервную копию -> ${target_path}.bak"
        mv -f "$target_path" "${target_path}.bak"
    fi

    # Перемещаем новый конфиг
    echo -e "  -> Перемещаю '$source_name' в '$target_path'"
    mv -f "$source_path" "$target_path"
    echo -e "  -> ${GREEN}Успешно.${NC}"
}

# --- Список конфигураций для установки ---

install_config ".vimrc" "$HOME_DIR/.vimrc"
install_config "alacritty" "$CONFIG_DIR/alacritty"
install_config "hypr" "$CONFIG_DIR/hypr"
install_config "rofi" "$CONFIG_DIR/rofi"
install_config "swaync" "$CONFIG_DIR/swaync"
install_config "Thunar" "$CONFIG_DIR/Thunar"
install_config "waybar" "$CONFIG_DIR/waybar"

echo "-----------------------------------------------------"
echo -e "${GREEN}Установка завершена!${NC}"
echo
echo "Что дальше?"
echo "1. Старые конфигурации (если они были) сохранены с расширением .bak."
echo "2. Папки с конфигами были перемещены из этой директории. Здесь остались только скрипт, README и другие файлы."
echo "3. Возможно, потребуется перезапустить сессию или приложения, чтобы изменения вступили в силу."
