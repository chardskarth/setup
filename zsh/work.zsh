scriptPathAb=$(readlink -f "$0")
scriptDirPathAb=$(dirname $scriptPathAb)

vcfgab() {
	nvim $scriptPathAb
	source $scriptPathAb
}

jworklog@() {
	jrnl @worklog | nvim -R -c 'set syntax=jrnl' -
}

worklog() {
	tempfile=$(mktemp)
	jrnl @worklog > $tempfile
	nvim -c "set syntax=jrnl" $tempfile
}


jretro() {
	j @forretro $@
}

jretroemman() {
	j @forretro @emman $@
}

jretrojm() {
	j @forretro @jm $@
}

jretrokana() {
	j @forretro @kana $@
}

jretroalwyn() {
	j @forretro @alwyn $@
}

