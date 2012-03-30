# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Show history
alias history='fc -l 1'
alias h='fc -l 1'

# List directory contents
alias ls='ls -sFC --color=auto'
alias ll='ls -l'
alias l.='ls -d .*'
alias la='ls -A'
alias lla='ls -Al'
alias ll.='ls -ld .*'

# Cleanup of vim and emacs backup, auto-save files
rmb() {
  { rm -f *~ } 2>/dev/null
  { rm -f .*~ } 2>/dev/null
}
rrmb() {
  { rm -f **/*~ } 2>/dev/null
  { rm -f **/.*~ } 2>/dev/null
}
rmswp() {
  { rm -f .*.swp } 2>/dev/null
  { rm -f \#*\# } 2>/dev/null
}
rrmswp() {
  { rm -f **/.*.swp } 2>/dev/null
  { rm -f **/\#*\# } 2>/dev/null
}
