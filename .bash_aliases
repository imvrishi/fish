# Show all logs in /var/log
#alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# clip
alias copy='xclip -sel clip'
alias paste='xclip -sel clip -o'

# boot
alias boot2bios='systemctl reboot --firmware-setup'

# apt
alias apt='sudo apt'

# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Automatically install the needed support files for this .bashrc file
setup_system ()
{
	sudo su
	apt update && apt upgrade -y
	apt install -y preload net-tools curl ufw gufw xclip
	apt install -y cowsay fortune lolcat
	apt install -y openjdk-11-jdk tlp tlp-rdw vlc redis git
	apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager
	apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev gcc g++ make
	ufw enable
	systemctl enable tlp
	exit
	# install fish node
	fish_add_path /opt/node/bin
	npm i -g yarn
	fish_add_path /home/<user>/.yarn/bin
	yarn global add typescript @nestjs/cli 0x autocannon nodemon pm2 expo-cli clinic
	yarn global bin
	yarn config get prefix
	yarn config set prefix ~/.yarn
	# install joplin dbeaver vscode slack meld android-studio flutter
	egrep -c '(vmx|svm)' /proc/cpuinfo
	kvm-ok
	flutter config --enable-linux-desktop
	fish_add_path /opt/flutter/bin
}
