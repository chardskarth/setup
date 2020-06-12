scriptPathTw=$(readlink -f "$0")
scriptDirPathTw=$(dirname $scriptPathTw)

tdonetoday() {
	task +COMPLETED mod:today all
}

tadd() {
	task add $@
}

tadone() { #lols.
	text=$(task add $@)
	id=${${text#Created task }%.}
	task done $id
}

taddtom() {
	task add sch:tom $@
}

taddtoday() {
	task add sch:today $@
}

tdone() {
	task done $@
}

tanno() {
	paramStr="$@"
	annotext=${paramStr#* }
	task $1 anno $annotext
}

tmod() {
	paramStr="$@"
	annotext=${paramStr#* }
	eval "task $1 mod $annotext"
}

tmodtoday() {
	paramStr="$@"
	annotext=${paramStr#* }
	eval "task $1 mod sch:today"
}

tmodtom() {
	paramStr="$@"
	annotext=${paramStr#* }
	eval "task $1 mod sch:tom"
}

inbox() {
	task inbox
}

today() {
	task today
}

tom() {
	task tom
}

week() {
	task week
}

nxweek() {
	task nxweek
}

projects() {
	task projects
}

vcfgtw() {
	nvim "$scriptPathTw"
	omzr
}

catcfgtw() {
	cat "$scriptPathTw"
}

vtaskrc() {
	nvim "$HOME/.taskrc"
}

# create file OB
tadd_fileob() {
	if [[ -z $1 ]]
	then
		echo "scheduled date is required"
		return 1
	fi
	task add +eod +fileObSprout +timelog file OB on sprout sch:$1
}

tadd_bills1() {
	if [[ -z $1 ]]
	then
		echo "scheduled date is required"
		return 1
	fi
	task add +bills pay pldt bill sch:$1
	task add +bills pay globe bill sch:$1
}

tadd_bills2() {
	if [[ -z $1 ]]
	then
		echo "scheduled date is required"
		return 1
	fi
	task add +bills pay smart bill sch:$1
	task add +bills pay manulife bill sch:$1
	id=$(_taddgetid +bills pay glecy netflix,spotify sch:$1)
	echo "Created task $id"
	eval "tanno $id '$((250+50-250+140+50))=250(my nflix shre) + 50(my sptfy shre) - 250(ur scrbd shre) + 140(LeEnin nflix shre) + 50(bob sptfy shre)'"
	id=$(_taddgetid +paymentrequest post message in messenger sch:$1)
	echo "Created task $id"
	eval "tanno $id tig 70 pesos si enin and len. 50 pesos si uncle bob"
}

_taddgetid() {
	text=$(eval "tadd $@")
	id=${${text#Created task }%.}
	echo "$id"
}

addshop() {
	task add +buy +onlineshopping $@
}
