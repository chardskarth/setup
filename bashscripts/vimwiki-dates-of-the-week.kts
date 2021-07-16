#!/usr/bin/env kscript
//DEPS me.chardskarth:vimwiki-kts-jvm:1.0-SNAPSHOT

import me.chardskarth.vimwiki.init.InitializeApplication

val datesOfTheWeek = try {
	if(args[0][0] == '+' || args[0][0] == '-') {
		InitializeApplication.getDatesOfTheWeek(args[0])
	} else {
		InitializeApplication.getDatesOfTheWeek(args[0].toInt())
	}
} catch (_: Exception) {
	InitializeApplication.getDatesOfTheWeek(null)
}

datesOfTheWeek?.let {
	it.forEach { println(it) }
}
