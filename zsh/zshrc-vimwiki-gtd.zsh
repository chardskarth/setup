scriptPathVWG=$(realpath "$0")
scriptDirPathVWG=$(dirname $scriptPathVWG)


vcfgwg() {
	before=$(cat $scriptPathVWG | md5sum)
	nvim "$scriptPathVWG"
	after=$(cat $scriptPathVWG | md5sum)
	if [ "$before" != "$after" ]
	then
		source $scriptPathVWG
	else
		echo 'No  changes. Ignoring'
	fi
}

catcfgwg() {
	nvim -R $scriptPathVWG
}

vk.(){
	nvim -c "normal <leader>vk."
}

