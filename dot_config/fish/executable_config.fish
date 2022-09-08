# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

set ALTERNATE_EDITOR ""
set -gx EDITOR "v"
set -gx VISUAL "v"

# FZF
set -U FZF_LEGACY_KEYBINDINGS 0

set -gx FZF_TMUX 1
set -gx FZF_TMUX_HEIGHT "40%"
set -gx FZF_DEFAULT_OPTS "--layout reverse --preview-window right:40%:noborder:wrap --color='preview-bg:#222222' --bind shift-up:preview-up,shift-down:preview-down"
# commands
set -gx FZF_FIND_FILE_COMMAND "fd --type f --no-ignore --hidden --follow . \$dir 2> /dev/null"
set -gx FZF_CD_COMMAND "fd --type d --no-ignore --follow . \$dir 2> /dev/null"
set -gx FZF_CD_WITH_HIDDEN_COMMAND "fd --type d --no-ignore --hidden --follow . \$dir 2> /dev/null"
set -gx FZF_OPEN_COMMAND "$FZF_FIND_FILE_COMMAND"
# preview
set -gx FZF_PREVIEW_FILE_CMD "string match -q \"*binary\" -- (file --mime {}) && echo \"Binary file\" || bat --style=numbers --color=always {}"
set -gx FZF_PREVIEW_DIR_CMD "tree -C {}"
# opts
set -gx FZF_FIND_FILE_OPTS "--header 'file >'"
set -gx FZF_CD_OPTS "--header 'dir >'"
set -gx FZF_CD_WITH_HIDDEN_OPTS "--header 'dir hidden >'"
set -gx FZF_REVERSE_ISEARCH_OPTS "--header 'history >' --preview 'echo {} | bat -l bash --style=numbers --color=always -'"
set -gx FZF_OPEN_OPTS "--header 'open >'"

if type -q exa
  alias ll "exa -l -g --icons"
  alias llt "ll --tree"
end

alias la "ll -a"
alias rf "rm -rf"

set -gx GOPATH ~/.go

set -gx AWS_PROFILE porsche-onelogin
set -gx AWS_REGION eu-central-1

set -gx LIBVA_DRIVER_NAME iHD
#set -gx WINIT_HIDPI_FACTOR 1

set -g pure_color_prompt_on_success (set_color green)
set -g pure_color_current_directory (set_color 47b6ff)

set -gx DICTIONARY en_US

thefuck --alias | source
op completion fish | source

source ~/_ws/porsche/repos/myct-cloud-helpers/cloud-helpers.fish

source ~/.miniconda/etc/fish/conf.d/conda.fish

status --is-interactive; and rbenv init - fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; test -f /home/ntrp/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/ntrp/.ghcup/bin $PATH # ghcup-env

fish_add_path /home/ntrp/.pulumi/bin
fish_add_path /home/ntrp/.cargo/bin

set -gx XDG_CURRENT_DESKTOP sway
set -gx XDG_SESSION_TYPE wayland
set SWAYSOCK /run/user/(id -u)/sway-ipc.(id -u).(pgrep -x sway).sock

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
      #exec sway
      #exec startx -- -keeptty
      #exec dwl -s ~/.winit > /tmp/dwl-state
    end
end
