# Add Homebrew to PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Initialize zoxide
eval "$(zoxide init --cmd cd zsh)"

# zsh Options
setopt HIST_IGNORE_ALL_DUPS

# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# Work
[ -f "$HOME/.config/zsh/work.zsh" ] && source "$HOME/.config/zsh/work.zsh"

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/snap/bin:$PATH"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/snap/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

export NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"

export PATH="$HOME/.local/bin:$PATH"
# Homebrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/mongo/bin:$PATH"



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/titan/.opam/opam-init/init.zsh' ]] || source '/home/titan/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
export PATH="/home/titan/C/odin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
