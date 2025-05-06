YABAI_OLDV=$(yabai --version)

yabai --stop-service
curl -L https://raw.githubusercontent.com/koekeishiya/yabai/master/scripts/install.sh | sh /dev/stdin

YABAI_NEWV=$(yabai --version)
if [[ "$YABAI_OLDV" == "$YABAI_NEWV" ]]; then
    echo "yabai at newest version $YABAI_OLDV"
    yabai --start-service
else
    echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
    yabai --start-service
    echo "$YABAI_OLDV -> $YABAI_NEWV"
    echo "yabai updated successfully"
fi
