fish_vi_key_bindings

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# FZF
set -U FZF_LEGACY_KEYBINDINGS 0
set -gx FZF_DEFAULT_COMMAND "fd --type f --no-ignore --hidden --follow . \$dir 2> /dev/null"
set -gx FZF_DEFAULT_OPTS "--height 40%"
set -gx FZF_FIND_FILE_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_FIND_FILE_OPTS "$FZF_DEFAULT_OPTS --preview 'string match -q \"*binary\" -- (file --mime {}) && echo \"Binary file\" || rougify {}' --bind shift-up:preview-up,shift-down:preview-down"
set -gx FZF_CD_COMMAND "fd --type d --no-ignore --hidden --follow . \$dir 2> /dev/null"
set -gx FZF_CD_OPTS "--preview 'tree -C {}' --bind shift-up:preview-up,shift-down:preview-down"

set -gx GOPATH ~/.go
set -gx PATH $PATH $HOME/.krew/bin

set -gx LIBVA_DRIVER_NAME iHD 

# HiDPI
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
#set -gx GDK_SCALE 2
#set -gx GDK_DPI_SCALE 0.5

set -g pure_color_prompt_on_success (set_color green)
set -g pure_color_current_directory (set_color 47b6ff)

thefuck --alias | source

source ~/_ws/porsche/repos/myct-cloud-helpers/cloud-helpers.fish

#source ~/.cache/wal/colors.fish

# start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
#       startx
#       #exec dbus-launch --sh-syntax --exit-with-session sway
#    end
#end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/ntrp/_ws/porsche/repos/mymessagng-inbox-backend/node_modules/tabtab/.completions/serverless.fish ]; and . /home/ntrp/_ws/porsche/repos/mymessagng-inbox-backend/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/ntrp/_ws/porsche/repos/mymessagng-inbox-backend/node_modules/tabtab/.completions/sls.fish ]; and . /home/ntrp/_ws/porsche/repos/mymessagng-inbox-backend/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/ntrp/_ws/porsche/repos/mymessagng-inbox-backend/node_modules/tabtab/.completions/slss.fish ]; and . /home/ntrp/_ws/porsche/repos/mymessagng-inbox-backend/node_modules/tabtab/.completions/slss.fish