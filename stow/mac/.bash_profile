# set -e

# open file descriptor 5 such that anything written to /dev/fd/5
# is piped through ts and then to /tmp/timestamps
# exec 5> >(ts -i "%.s" >> /tmp/timestamps)

# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
# export BASH_XTRACEFD="5"

# Enable tracing
# set -x

source $HOME/.alias
source $HOME/.env
source $HOME/.completion
source $HOME/.prompt

command -v mise >/dev/null 2>&1 && eval "$(mise activate bash)"

eval "$(zoxide init --cmd cd bash)"
eval "$(fzf --bash)"

# Add NRKSSH to PATH
[ -s $HOME/bin/nrkssh ] && eval "$($HOME/bin/nrkssh shellenv)"
