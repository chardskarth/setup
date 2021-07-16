#!/usr/bin/env kscript
//DEPS me.chardskarth:vimwiki-kts-jvm:1.0-SNAPSHOT

import me.chardskarth.vimwiki.init.InitializeApplication

val dateDiary = try { args[0] }
    catch (_: ArrayIndexOutOfBoundsException) { null }
val template = InitializeApplication.getDiaryTemplate(dateDiary)
println(template)
