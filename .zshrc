export ZSH=/home/a/.oh-my-zsh
export DOTNET_CLI_TELEMETRY_OPTOUT=1
ZSH_THEME="gentoo"
##############
PATH="${PATH}:${HOME}/.local/bin/"
PATH="${PATH}:/home/a/.cargo/bin"
alias U="sudo apt-get update; sudo apt-get dist-upgrade -y; sudo apt-get autoremove --purge -y"
alias wifi="nmtui-connect"
alias dropdown="st -n dropdown &> /dev/null &" 
alias nipple="xinput enable $(xinput list | grep 'DualPoint Stick' | cut -d '=' -f2 | cut -d '[' -f1) && xinput enable $(xinput list | grep 'DualPoint TouchPad' | cut -d '=' -f2 | cut -d '[' -f1)"
alias nonipple="xinput disable $(xinput list | grep 'DualPoint Stick' | cut -d '=' -f2 | cut -d '[' -f1) && xinput disable $(xinput list | grep 'DualPoint TouchPad' | cut -d '=' -f2 | cut -d '[' -f1)"
alias lsb="lsblk -o name,size,RM,RO,mountpoint,label"
alias skolepc="vboxmanage startvm 'SKOLE-PC-Windows 10' &> /dev/null &"
alias nano="vim"
alias GITPUSH="git push origin master"
function myip {
	wget "https://www.dnsleaktest.com/" -q -O - | grep '<p class="hello"' -A 1 | cut -d ">" -f2 | cut -d "<" -f1 | sed 's/Hello /WAN IP:   /' | sed 's/from /LOCATION: /'
}
function VPN {
	case $1 in
	home)
	sudo openvpn /home/a/.VPN/home.ovpn
	;;
	pia)
	sudo openvpn /home/a/.VPN/pia.ovpn
	;;
	*)
	echo "Usage: $0 {home|pia}"
	;;
	esac
}
function LOOP {
while : 
do 
	$@
 	sleep 0.5 
done
}
function GIT {
	git add .
	git commit -m "$@"
}
function x {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ${0} <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       ${0} <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
plugins=(git)
source $ZSH/oh-my-zsh.sh
