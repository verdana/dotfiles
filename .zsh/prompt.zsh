
# Prompt
autoload -U promptinit && promptinit

# The max execution time of a process
# before its run time is shown
# when it exits.
# Defaults to 5 seconds.
PURE_CMD_MAX_EXEC_TIME=5

# Set PURE_GIT_PULL=0 to prevent Pure
# from checking whether the current
# Git remote has been updated.
PURE_GIT_PULL=1

# Set PURE_GIT_UNTRACKED_DIRTY=0 to
# not include untracked files in
# dirtiness check.
# Only really useful on extremely h
# uge repos like the WebKit repo.
PURE_GIT_UNTRACKED_DIRTY=0

# Defines the prompt symbol.
PURE_PROMPT_SYMBOL=$'\xe2\x9d\xaf '

# Apply it
prompt pure

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

