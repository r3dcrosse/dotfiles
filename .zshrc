PROMPT='🌈 %K{cyan}%F{blue} %1~ %f%k 🚀 %F{red}(っ◔◡◔)っ[̲̅%f '

# Load the shell dotfiles, and then some:
for file in ~/.{aliases}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file