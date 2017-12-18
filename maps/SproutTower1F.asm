const_value set 2
	const SPROUTTOWER1F_SAGE1
	const SPROUTTOWER1F_SAGE2
	const SPROUTTOWER1F_GRANNY
	const SPROUTTOWER1F_TEACHER
	const SPROUTTOWER1F_SAGE3
	const SPROUTTOWER1F_POKE_BALL

SproutTower1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SproutTower1FSage1Script:
	jumptextfaceplayer SproutTower1FSage1Text

SproutTower1FSage2Script:
	jumptextfaceplayer SproutTower1FSage2Text

SproutTower1FGrannyScript:
	jumptextfaceplayer SproutTower1FGrannyText

SproutTower1FTeacherScript:
	jumptextfaceplayer SproutTower1FTeacherText

TrainerSageChow:
	trainer EVENT_BEAT_SAGE_CHOW, SAGE, CHOW, SageChowSeenText, SageChowBeatenText, 0, SageChowScript

SageChowScript:
	end_if_just_battled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

SproutTower1FParlyzHeal:
	itemball PARLYZ_HEAL

MapSproutTower1FSignpost1Script:
	jumptext UnknownText_0x1846d6

SageChowSeenText:
	text "We stand guard in"
	line "this tower."

	para "Here, we express"
	line "our gratitude to"
	cont "honor all #MON."
	done

SageChowBeatenText:
	text "Th-Thank you!"
	done

SageChowAfterBattleText:
	text "All living beings"
	line "coexist through"
	cont "cooperation."

	para "We must always be"
	line "thankful for this."
	done

SproutTower1FSage1Text:
	text "Only if you reach"
	line "the top will you"
	cont "obtain an HM."
	done

SproutTower1FSage2Text:
	text "SPROUT TOWER was"
	line "built long ago"

	para "as a place for"
	line "#MON training."
	done

SproutTower1FGrannyText:
	text "A BELLSPROUT over"
	line "100 feet tall…"

	para "People say that it"
	line "became the center"
	cont "pillar here."
	done

SproutTower1FTeacherText:
	text "See the pillar"
	line "shaking?"

	para "People are train-"
	line "ing upstairs."
	done

UnknownText_0x1846d6:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $f, $9, 7, VIOLET_CITY
	warp_def $f, $a, 7, VIOLET_CITY
	warp_def $4, $6, 1, SPROUT_TOWER_2F
	warp_def $6, $2, 2, SPROUT_TOWER_2F
	warp_def $3, $11, 3, SPROUT_TOWER_2F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 7, SIGNPOST_READ, MapSproutTower1FSignpost1Script
	signpost 15, 12, SIGNPOST_READ, MapSproutTower1FSignpost1Script

.PersonEvents:
	db 6
	person_event SPRITE_SAGE, 4, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, SproutTower1FSage1Script, -1
	person_event SPRITE_SAGE, 7, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, SproutTower1FSage2Script, -1
	person_event SPRITE_GRANNY, 12, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SproutTower1FGrannyScript, -1
	person_event SPRITE_TEACHER, 9, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SproutTower1FTeacherScript, -1
	person_event SPRITE_SAGE, 5, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_TRAINER, 4, TrainerSageChow, -1
	person_event SPRITE_POKE_BALL, 7, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower1FParlyzHeal, EVENT_SPROUT_TOWER1F_PARLYZ_HEAL
