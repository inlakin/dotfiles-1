#==============================================================================#
#                            init / general options                            #
#==============================================================================#

export EDITOR=vim
export BROWSER=firefox
export PAGER=less
export KEYTIMEOUT=1

umask 022

autoload -Uz compinit promptinit colors vcs_info
compinit
promptinit
colors
setopt completealiases
setopt promptsubst
setopt auto_remove_slash
setopt glob_dots

#==============================================================================#
#                                    history                                   #
#==============================================================================#

HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=500
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

#==============================================================================#
#                                autocompletion                                #
#==============================================================================#

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _match
zstyle ':completion:*' completions 0
zstyle ':completion:*' glob 0
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+m:{a-z}={A-Z} r:|[._-]=** r:|=**' '' '' '+m:{a-z}={A-Z} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' substitute 0
zstyle ':completion:*' rehash true
zstyle ':compinstall' filename "$HOME/.zshrc"

zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found' '(*/)#CVS'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(^rm):*' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

#==============================================================================#
#                                    prompt                                    #
#==============================================================================#

# git support
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*' formats "$fg_bold[green]%b%m$reset_color/$fg[yellow]%12.12i %c%u$reset_color"
precmd() {
    vcs_info
}

if [ -n "$SSH_CONNECTION" ]; then
    prmptssh="%{$fg[red]%}• "
fi

PROMPT='${prmptssh}%(!.%{$fg[red]%}.%{$fg[blue]%})%n%{$fg[white]%}@%{$fg[blue]%}%M%{$reset_color%} %{$fg_bold[magenta]%}%~%{$reset_color%} ${vcs_info_msg_0_}
%{$fg[yellow]%}%L%{$reset_color%} %{$fg[green]%}%T%{$reset_color%}%(?..%{$fg[red]%} %?%{$reset_color%}) %{$fg[white]%}▶%{$reset_color%} '

# vi mode
zle -N zle-line-init
zle -N zle-keymap-select
function zle-line-init zle-keymap-select {
VIM_PROMPT="%{$fg[white]%} [% NORMAL]% %{$reset_color%}"
RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
zle reset-prompt
}
#==============================================================================#
#                                  keybindings                                 #
#==============================================================================#

bindkey -v
autoload zkbd
if [ -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]; then
    source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
fi
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
bindkey '^R' history-incremental-search-backward

#==============================================================================#
#                                    aliases                                   #
#==============================================================================#

alias cd=' cd'
alias cx='chmod +x'
alias cmx='chmod -x'
alias cp='cp -iv'
alias cdusb='cd /mnt/usb'
alias fancydate='watch -n1 "date '+%D%n%T'|figlet -k"'
alias grep='grep --color=auto'
alias grepi='grep -i'
alias grin='grep -rin'
alias gst='git status'
alias gitkli="git log --graph --abbrev-commit --pretty=oneline --decorate"
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=auto'
alias ln='ln -v'
alias mkdir='mkdir -p -v'
alias mpdpc='mpd ~/.config/mpd/mpd.conf'
alias mv='mv -iv'
alias iftop='iftop -N -p -P'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias psns='ps xawf -eo pid,user,pidns,userns,utsns,netns,mntns,args'
alias psm='ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -10'
alias rm='rm -Iv --one-file-system'
alias rmdir='rmdir -v'
alias savepkglist='pacman -Qqe | grep -vx "$(pacman -Qqm)" > ~/vrac/pkg.list'
alias sz="source ~/.zshrc"
alias tlog='multitail /var/log/everything.log'
alias vi='vim'
alias ympv="mpv --ytdl-format=best --ytdl "

#==============================================================================#
#                                   dirstack                                   #
#==============================================================================#

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
fi
chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
DIRSTACKSIZE=20
setopt autopushd pushdsilent pushdtohome
setopt pushdignoredups
setopt pushdminus

#==============================================================================#
#                                   functions                                  #
#==============================================================================#

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1   ;;
            *.tar.gz)    tar xzvf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xvf $1    ;;
            *.tbz2)      tar xjvf $1   ;;
            *.tgz)       tar xzvf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.xz)        unxz $1      ;;
            *)           echo "'$1' cannot be extracted via extract()"
                ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

mkcd() {
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

cp_p() {
    if [ `echo "$2" | grep ".*\/$"` ]; then
        pv "$1" > "$2""$1";
    else pv "$1" > "$2"/"$1";
    fi  ;
}

mantopdf() {
    stuff=$1
    man -t $stuff | ps2pdf13 - "${stuff}.pdf"
}

mdread() {
    pandoc "$1" -f markdown -t html | w3m -T text/html
}

pwdgen() {
    NBCHAR=16
    x=${1:-$NBCHAR}
    cat /dev/urandom | tr -dc 'a-zA-Z0-9[$-:-?{-~!^_`\[\]]' | fold -w $x | head -n 1
}

randman() {
    check=1
    while [ $check -eq 1 ];
    do
        man $(ls "/bin" |sed -n "$(echo $(($RANDOM % $(ls "/bin" |wc -l | awk "{ print $1; }" ) + 1 )) ) p")
        if [ $? -eq 0 ] ; then
            check=0
        fi
        echo $RANDOM > /dev/null
    done
}

kernelgraph() {
    lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;
}

lock() {
    BG="/tmp/lockbg.png"
    scrot "$BG"
    convert "$BG" -blur "0x5" "$BG"
    i3lock -f -e -i "$BG"
    rm "$BG"
}

#==============================================================================#
#                                    colors                                    #
#==============================================================================#

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[default]='fg=white'
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=white'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=white'
fi

export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

if [ -f ~/.dircolors ]; then
    eval $(dircolors ~/.dircolors)
fi

#==============================================================================#
#                                 other options                                #
#==============================================================================#

# host specific configuration
if [ -f ~/.zshrc_spec ]; then
    source ~/.zshrc_spec
fi

