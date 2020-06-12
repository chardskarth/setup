scriptPathAb=$(readlink -f "$0")
scriptDirPathAb=$(dirname $scriptPathAb)

vcfgab() {
	nvim $scriptPathAb
	omzr
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

