scriptPathJ=$(readlink -f "$0")
scriptDirPathJ=$(dirname $scriptPathJ)

jrnltoday() {
	tempfile=$(mktemp)
	datetoday=$(date +%Y-%m-%d)
	jrnl -on $datetoday > $tempfile
	nvim -c "set syntax=jrnl" $tempfile
}

jworklog() {
	if [ -z $1 ]
	then
		tempfile=$(mktemp)
		nvim -c ':exe "normal i@worklog \<Esc>"' $tempfile
		jrnl --import -i $tempfile
		rm $tempfile
	else
		jrnl @worklog $@
	fi
}

jworklog@() {
	jrnl @worklog | less
}

worklog() {
	tempfile=$(mktemp)
	jrnl @worklog > $tempfile
	nvim -c "set syntax=jrnl" $tempfile
}

vcfgj() {
	nvim "$scriptDirPath/jrnl.zsh"
	omzr
}

vjrnlrc() {
	nvim "$HOME/.config/jrnl/jrnl.yaml"
}

j() {
	jrnl $@
}

jdate() {
	ehh=$(eval "date --date='$@' +%Y-%m-%d")
	echo $ehh
}

jedit() {
	jrnl --edit
}

jmissionstatement() {
	jrnl @missionstatement -n 1 | less
}

jmissionstatementedit() {
	tempfile=$(mktemp)
	mstatement=$(jrnl @missionstatement -n 1 | sed 's/| //g')
	before=$(echo $mstatement | md5sum)
	echo $mstatement >> $tempfile
	nvim -c 'set syntax=jrnl' $tempfile
	after=$(cat $tempfile | md5sum)
	if [ "$before" != "$after" ]
	then 
		jrnl --import -i $tempfile
	else
		echo 'no changes. ignoring'
	fi

	rm $tempfile
}
