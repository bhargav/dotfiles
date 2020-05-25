set fish_greeting '' # turn off greeting

# Alias
alias ag="rg -i"

# Configuration for Fisher packages
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
set -g fisher_path $XDG_CONFIG_HOME/fisher_home

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end

# Dotdrop config
set -x DOTDROP_CONFIG ~/dotfiles/dotdrop_config.yaml

# Add rust binaries to path
set PATH ~/.cargo/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/bhargav/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

