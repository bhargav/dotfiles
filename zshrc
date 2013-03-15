ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
alias zshconfig="sublime_text ~/.zshrc"
# alias ohmyzsh="sublime_text ~/.oh-my-zsh"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=10
# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"
# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

plugins=(git compleat command-not-found deb pip extract debian)
source $ZSH/oh-my-zsh.sh

alias pip='nocorrect pip'
alias g++='clang++'

export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PERL_LOCAL_LIB_ROOT="/home/bhargav/perl5";
export PERL_MB_OPT="--install_base /home/bhargav/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/bhargav/perl5";
export PERL5LIB="/home/bhargav/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/bhargav/perl5/lib/perl5";
export PATH="/home/bhargav/perl5/bin:$PATH";
export PATH=$PATH:/usr/local/go/bin

zstyle ':completion:*' hosts off
