# Dossier zsh layer: colours, aliases, prompt.
#
# Source it at the END of your own ~/.zshrc, after oh-my-zsh.sh:
#   source /path/to/cosmic-dossier-theme/zsh/dossier.zsh
#
# Keep machine-specific or private lines (PATH, scaling, nvm, ...) in your
# own ~/.zshrc, not here.
#
#  bg:      #D0D0C8   fg:      #242424
#  rust:    #953B19   olive:   #51573B
#  brown:   #754E3E   red:     #A80026
#  khaki:   #43432B   muted:   #59574D
#  dim:     #6B7360
#
# Light terminal: every colour here is dark enough to read on stone grey.

# ── File colours (ls, lsd file names, completion menu) ─────────────────────────

export LS_COLORS="di=1;38;2;67;67;43:ln=3;38;2;107;31;47:ex=1;38;2;149;59;25:*.zip=4;38;2;117;78;62:*.tar=4;38;2;117;78;62:*.gz=4;38;2;117;78;62:*.xz=4;38;2;117;78;62:*.7z=4;38;2;117;78;62:*.deb=4;38;2;117;78;62:*.png=38;2;89;87;77:*.jpg=38;2;89;87;77:*.jpeg=38;2;89;87;77:*.webp=38;2;89;87;77:*.gif=38;2;89;87;77:*.mp4=3;38;2;89;87;77:*.mkv=3;38;2;89;87;77:*.rs=38;2;81;87;59:*.py=38;2;81;87;59:*.js=38;2;81;87;59:*.ts=38;2;81;87;59:*.sh=38;2;81;87;59:*.md=38;2;56;56;53:*.txt=38;2;56;56;53:or=9;38;2;168;0;38"

# oh-my-zsh reads LS_COLORS before this file loads, so refresh the menu colours
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ── zsh-autosuggestions / zsh-syntax-highlighting ──────────────────────────────

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#8A8A82'

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#953B19'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#953B19'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#953B19'
ZSH_HIGHLIGHT_STYLES[function]='fg=#953B19'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#953B19'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#953B19,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#51573B,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#43432B,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#A80026,bold,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=#383835,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#754E3E'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#754E3E'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#59574D'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#59574D'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#51573B'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#51573B'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#51573B'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#59574D'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#59574D'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6B7360'

# ── Aliases (only when the tool is installed) ──────────────────────────────────

if (( $+commands[lsd] )); then
    alias ls='lsd'
    alias la='lsd -a'
    alias ll='lsd -l'
    alias lla='lsd -la'
fi

# Debian/Ubuntu ship bat as batcat
if (( $+commands[batcat] )); then
    alias cat='batcat'
elif (( $+commands[bat] )); then
    alias cat='bat'
fi

(( $+commands[cosmic-edit] )) && alias edit='cosmic-edit'

if (( $+commands[nvim] )); then
    alias vi='nvim'
    alias vim='nvim'
    alias v='nvim'
fi

# ── Prompt ─────────────────────────────────────────────────────────────────────

# needs ZSH_THEME="" in ~/.zshrc
(( $+commands[starship] )) && eval "$(starship init zsh)"
