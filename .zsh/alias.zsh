uname=$(uname)

alias gst='git st -sb'
alias ga='git add'
alias gc='git commit -m'
alias gdf='git diff'
alias gp='git pull'
alias gpsh='git push'
alias gco='git checkout'
alias gb='git branch'
alias gch='git cherry-pick'

mac_setup(){
  
    alias vim='nvim'
    alias raspi_NAS='ssh pi@raspi_extender.local -p 50022 -i ~/.ssh/raspi3b'
    alias raspi_camera='ssh pi@raspicamera.local -p 50022 -i ~/.ssh/id_rsa_raspi3b'
    alias raspi4nas='ssh pi@raspi4nas.local -p 50022 -i ~/.ssh/raspi4_nas'
    alias py='python'

}

if [[ $uname = 'Darwin' ]]; then
    mac_setup
fi
