#!/bin/bash

# Usage: bash ./switch_colorscheme.sh [theme_name]
# Wallpaper: https://draculatheme.com/wallpaper
# All themes: https://adamrutter.github.io/pywal-themes-preview/

function get_color() {
    local number=$1 # is number of color base16
    local colors=()
    local color
    
    # TODO: Make this better
    for color in $(cat ~/.cache/wal/colors); do
        colors+=("$color")
    done
    
    echo "${colors[number]}"
}

# Change color of the glava visualizer
function get_color_from_wallpaper() {
    local path_to_wallpaper=$1 # Path to the wallpaper
    
    # The color is in the format #RRGGBB
    color=$(convert "$path_to_wallpaper" -crop 1x1+2400+2250 -format "#%[hex:u.p{0,0}]" info:)
    
    echo "$color"
}

echo $(get_color_from_wallpaper ~/.wallpapers/background.png)

function change_color_glava() {
    # The color is in the format #RRGGBB
    local color=$(get_color_from_wallpaper ~/.wallpapers/background.png)
    
    # Replace the color of the glava visualizer
    sed -i "s/#[0-9a-fA-F]\{6\}/$color/g" ~/.config/glava/circle.glsl
    
    # Restart glava
    pkill glava
}

# Generate the wallpaper from the colorscheme
function generate_wallpaper() {
    local bg=$(get_color 0) # Black
    local fg=$(get_color 7) # White
    
    # Change the color to gray and add a gradient map
    convert ~/.wallpapers/base_background.png -colorspace gray -level 17%,85% -size 256x1! gradient:"$bg-$fg" -clut ~/.wallpapers/background.png
}

function main() {
    local theme=$1
    
    echo "==> Switching to theme $theme..."
    wal --theme "$theme"
    echo "Theme switched."
    
    echo "==> Generating wallpaper..."
    generate_wallpaper
    echo "Wallpaper generated."
    
    echo "==> Changing color of glava..."
    change_color_glava
    echo "Color of glava changed."
    
    echo "==> Restarting awesome..."
    awesome-client "awesome.restart()"
    echo "Awesome restarted."
    
    echo "Done."
}

main "$1"