;;Settings.ini et settingsHero.ini par d�faut
Func ValeurDefaut()
	;;Settings
	$PassD3 = ""
	$PartieSolo = "true"
	$TakeABreak = "true"
	$Breakafterxxgames = "15"
	$BreakTime = "360"
	$PauseRepas = "false"
	$Recycle = "true"
	$QualityRecycle = "6"
	$Unidentified = "true"
	$Identified = "true"
	$TypeDeBot = "2"
	$Heros = "1"
	$difficulte = "4"
	$PuisMonstre = "1"
	$TypeDeGrabList = "1"
	$Choix_Act_Run = "1"
	$Sequence_Aleatoire = "false"
	$NbreRunChangSeqAlea = "0"
	$Nombre_de_Run = "0"
	$NombreMiniAct1 = "3"
	$NombreMaxiAct1 = "6"
	$NombreMiniAct2 = "3"
	$NombreMaxiAct2 = "6"
	$NombreMiniAct3 = "3"
	$NombreMaxiAct3 = "6"
	$Act1_Hero_Axe_Z = "15"
	$Act2_Hero_Axe_Z = "35"
	$Act3_Hero_Axe_Z = "10"
	$monsterList = ""
	$specialmonsterList = "Goblin|brickhouse_|woodwraith_|Siege_wallMonster|DuneDervish_|Ghost_|Lamprey_|Uber"
	$QualiteItem = "9"

	;;S�quences
	$SequenceFileAct1 = "act1-manoir_[1-3]|act1-Val_[1-3]|act1-putride_[1-3]|act1-champs_[1-3]"
	$SequenceFileAct2 = "act2-alcarnus_[1-3]|act2-gorge_noire_[1-3]|act2-dalgur_[1-2]"
	$SequenceFileAct3PtSauve = "act3_pt_save_le_coeur_darreat_[1-5]|act3_tower_[1-5]|act3_field_[1-2]|act3_rempart_[1-2]|act3_fdp_[1-2]"
	$SequenceFileAct3 = "[CMD]safeportstart()|act3_core_start_[1-5]|act3_tower_[1-5]|act3_field_[1-2]|act3_rempart_[1-2]|act3_fdp_[1-2]"
	$SequenceFileAct333 = "act3_rempart_[1-2]|act3_tuer_Ghom"
	$SequenceFileAct362 = "act3_rempart_[1-2]|act3_field_[1-2]|act3-Tuer_Siegebreaker"
	$SequenceFileAct373 = "act3_tower_[1-5]|act3_field_[1-2]|act3-Tuer_Azmodan"

	;;SettingsHero.ini
	$Potions = "healthPotion_Mythic"
	$LifeForPotion = "60"
	$PotionStock = "100"
	$NbPotionBuy = "0"
	$TakeShrines = "true"
	$repairafterxxgames = "4"
	$maxgamelength = "1800000"
	$attackRange = "50"
	$grabRange = "130"
	$MonsterTri = "True"
	$MonsterRefresh = "True"
	$ItemRefresh = "True"
	$MonsterPriority = "false"
	$InventoryCheck = "True"
	$attacktimeout = "15000"
	$grabtimeout = "10000"
	$Gestion_affixe = "true"
	$Gestion_affixe_loot = "true"
	$BanAffixList = "poison|spore"
	$Gest_affixe_ByClass = "false"
	$Life_Arcane = "100"
	$Life_Proj = "100"
	$Life_Peste = "70"
	$Life_Profa = "100"
	$Life_Ice = "100"
	$Life_Poison = "100"
	$Life_Explo = "100"
	$Life_Lave = "70"
	$Life_Mine = "100"
	$Life_Arm = "100"
	$Life_Spore = "100"
	$UsePath = "True"
	$ResActivated = "True"
	$ResLife = "3"
	$HCSecurity = "false"
	$MinHCLife = "80"

	;;Touches, Pr�buffs et souris
	$key1 = "&"
	$key2 = "�"
	$key3 = '"'
	$key4 = "'"
	$PreBuff1 = "false"
	$ToucheBuff1 = ""
	$delaiBuff1 = ""
	$PreBuff2 = "false"
	$ToucheBuff2 = ""
	$delaiBuff2 = ""
	$PreBuff3 = "false"
	$ToucheBuff3 = ""
	$delaiBuff3 = ""
	$PreBuff4 = "false"
	$ToucheBuff4 = ""
	$delaiBuff4 = ""
	$SpellOnLeft = "true"
	$SpellDelayLeft = ""
	$SpellTypeLeft = ""
	$SpellEnergyNeedsLeft = ""
	$SpellLifeLeft = ""
	$SpellDistanceLeft = ""
	$SpellOnRight = "true"
	$SpellDelayRight = ""
	$SpellTypeRight = ""
	$SpellEnergyNeedsRight = ""
	$SpellLifeRight = ""
	$SpellDistanceRight = ""

	;;Touche 1 � 4
	$SpellOn1 = "true"
	$SpellDelay1 = ""
	$SpellType1 = ""
	$SpellEnergyNeeds1 = ""
	$SpellLife1 = ""
	$SpellDistance1 = ""
	$SpellOn2 = "true"
	$SpellDelay2 = ""
	$SpellType2 = ""
	$SpellEnergyNeeds2 = ""
	$SpellLife2 = ""
	$SpellDistance2 = ""
	$SpellOn3 = "true"
	$SpellDelay3 = ""
	$SpellType3 = ""
	$SpellEnergyNeeds3 = ""
	$SpellLife3 = ""
	$SpellDistance3 = ""
	$SpellOn4 = "true"
	$SpellDelay4 = ""
	$SpellType4 = ""
	$SpellEnergyNeeds4 = ""
	$SpellLife4 = ""
	$SpellDistance4 = ""
	AjoutLog("Chargement settings.ini et settingsHero.ini par d�faut")
EndFunc