;lecture du fichier settings.ini
Func LoadConfigs($FichierINI)

	$PassD3 = IniRead($FichierINI, "Account info", "pass", "")
	$PartieSolo = IniRead($FichierINI, "Run info", "PartieSolo", "")
	$TakeABreak = IniRead($FichierINI, "Run info", "TakeABreak", "")
	$Breakafterxxgames = IniRead($FichierINI, "Run info", "Breakafterxxgames", "")
	$BreakTime = IniRead($FichierINI, "Run info", "BreakTime", "")
	$PauseRepas = IniRead($FichierINI, "Run info", "PauseRepas", "")
	$Recycle = IniRead($FichierINI, "Run info", "Recycle", "")
	$QualityRecycle = IniRead($FichierINI, "Run info", "QualityRecycle", "")
	$Unidentified = IniRead($FichierINI, "Run info", "Unidentified", "")
	$Identified = IniRead($FichierINI, "Run info", "Identified", "")
	$TypeDeBot = IniRead($FichierINI, "Run info", "TypeDeBot", "")
	$difficulte = IniRead($FichierINI, "Run info", "difficulte", "")
	$PuisMonstre = IniRead($FichierINI, "Run info", "PuisMonstre", "")
	$TypeDeGrabList = IniRead($FichierINI, "Run info", "TypeDeGrabList", "")
	$ChoixActRun = IniRead($FichierINI, "Run info", "Choix_Act_Run", "")
	$SequenceAleatoire = IniRead($FichierINI, "Run info", "Sequence_Aleatoire", "")
	$NbreRunChangSeqAlea = IniRead($FichierINI, "Run info", "NbreRunChangSeqAlea", "")
	$NombredeRun = IniRead($FichierINI, "Run info", "Nombre_de_Run", "")
	$NombreMiniAct1 = IniRead($FichierINI, "Run info", "NombreMiniAct1", "")
	$NombreMaxiAct1 = IniRead($FichierINI, "Run info", "NombreMaxiAct1", "")
	$NombreMiniAct2 = IniRead($FichierINI, "Run info", "NombreMiniAct2", "")
	$NombreMaxiAct2 = IniRead($FichierINI, "Run info", "NombreMaxiAct2", "")
	$NombreMiniAct3 = IniRead($FichierINI, "Run info", "NombreMiniAct3", "")
	$NombreMaxiAct3 = IniRead($FichierINI, "Run info", "NombreMaxiAct3", "")
	$Act1HeroAxeZ = IniRead($FichierINI, "Run info", "Act1_Hero_Axe_Z", "")
	$Act2HeroAxeZ = IniRead($FichierINI, "Run info", "Act2_Hero_Axe_Z", "")
	$Act3HeroAxeZ = IniRead($FichierINI, "Run info", "Act3_Hero_Axe_Z", "")
	$SequenceFileAct1 = IniRead($FichierINI, "Run info", "SequenceFileAct1", "")
	$SequenceFileAct2 = IniRead($FichierINI, "Run info", "SequenceFileAct2", "")
	$SequenceFileAct3PtSauve = IniRead($FichierINI, "Run info", "SequenceFileAct3PtSauve", "")
	$SequenceFileAct3 = IniRead($FichierINI, "Run info", "SequenceFileAct3", "")
	$SequenceFileAct333 = IniRead($FichierINI, "Run info", "SequenceFileAct333", "")
	$SequenceFileAct362 = IniRead($FichierINI, "Run info", "SequenceFileAct362", "")
	$SequenceFileAct373 = IniRead($FichierINI, "Run info", "SequenceFileAct373", "")
	$monsterList = IniRead($FichierINI, "Run info", "monsterList", "")
	$specialmonsterList = IniRead($FichierINI, "Run info", "specialmonsterList", "")
	$HeroAxeZ = IniRead($FichierINI, "Run info", "Hero_Axe_Z", "")
	$SequenceFile = IniRead($FichierINI, "Run info", "SequenceFile", "")
	$QualiteItem = IniRead($FichierINI, "Run info", "QualiteItem", "")

	AjoutLog("Chargement du fichier : " & $FichierINI)

EndFunc;==>LoadConfigs

;ecriture du fichier settings.ini
Func SaveConfigs($FichierINI)

	IniWrite($FichierINI, "Account info", "pass", $PassD3)
	IniWrite($FichierINI, "Run info", "PartieSolo", $PartieSolo)
	IniWrite($FichierINI, "Run info", "TakeABreak", $TakeABreak)
	IniWrite($FichierINI, "Run info", "Breakafterxxgames", $Breakafterxxgames)
	IniWrite($FichierINI, "Run info", "BreakTime", $BreakTime)
	IniWrite($FichierINI, "Run info", "PauseRepas", $PauseRepas)
	IniWrite($FichierINI, "Run info", "Recycle", $Recycle)
	IniWrite($FichierINI, "Run info", "QualityRecycle", $QualityRecycle)
	IniWrite($FichierINI, "Run info", "Unidentified", $Unidentified)
	IniWrite($FichierINI, "Run info", "Identified", $Identified)
	IniWrite($FichierINI, "Run info", "TypeDeBot", $TypeDeBot)
	IniWrite($FichierINI, "Run info", "difficulte", $difficulte)
	IniWrite($FichierINI, "Run info", "PuisMonstre", $PuisMonstre)
	IniWrite($FichierINI, "Run info", "TypeDeGrabList", $TypeDeGrabList)
	IniWrite($FichierINI, "Run info", "Choix_Act_Run", $ChoixActRun)
	IniWrite($FichierINI, "Run info", "Sequence_Aleatoire", $SequenceAleatoire)
	IniWrite($FichierINI, "Run info", "NbreRunChangSeqAlea", $NbreRunChangSeqAlea)
	IniWrite($FichierINI, "Run info", "Nombre_de_Run", $NombredeRun)
	IniWrite($FichierINI, "Run info", "NombreMiniAct1", $NombreMiniAct1)
	IniWrite($FichierINI, "Run info", "NombreMaxiAct1", $NombreMaxiAct1)
	IniWrite($FichierINI, "Run info", "NombreMiniAct2", $NombreMiniAct2)
	IniWrite($FichierINI, "Run info", "NombreMaxiAct2", $NombreMaxiAct2)
	IniWrite($FichierINI, "Run info", "NombreMiniAct3", $NombreMiniAct3)
	IniWrite($FichierINI, "Run info", "NombreMaxiAct3", $NombreMaxiAct3)
	IniWrite($FichierINI, "Run info", "Act1_Hero_Axe_Z", $Act1HeroAxeZ)
	IniWrite($FichierINI, "Run info", "Act2_Hero_Axe_Z", $Act2HeroAxeZ)
	IniWrite($FichierINI, "Run info", "Act3_Hero_Axe_Z", $Act3HeroAxeZ)
	IniWrite($FichierINI, "Run info", "SequenceFileAct1", $SequenceFileAct1)
	IniWrite($FichierINI, "Run info", "SequenceFileAct2", $SequenceFileAct2)
	IniWrite($FichierINI, "Run info", "SequenceFileAct3PtSauve", $SequenceFileAct3PtSauve)
	IniWrite($FichierINI, "Run info", "SequenceFileAct3", $SequenceFileAct3)
	IniWrite($FichierINI, "Run info", "SequenceFileAct333", $SequenceFileAct333)
	IniWrite($FichierINI, "Run info", "SequenceFileAct362", $SequenceFileAct362)
	IniWrite($FichierINI, "Run info", "SequenceFileAct373", $SequenceFileAct373)
	IniWrite($FichierINI, "Run info", "monsterList", $monsterList)
	IniWrite($FichierINI, "Run info", "specialmonsterList", $specialmonsterList)
	IniWrite($FichierINI, "Run info", "Hero_Axe_Z", $HeroAxeZ)
	IniWrite($FichierINI, "Run info", "SequenceFile", $SequenceFile)
	IniWrite($FichierINI, "Run info", "QualiteItem", $QualiteItem)

	AjoutLog("Enregistrement des modifs du fichier : " & $FichierINI)

EndFunc;==>SaveConfigs

;ecriture du fichier settingsHeroX.ini
Func SaveConfigsHero($FichierINI)

	IniWrite($FichierINI, "Run info", "Potions", $Potions)
	IniWrite($FichierINI, "Run info", "Key1", $key1)
	IniWrite($FichierINI, "Run info", "Key2", $key2)
	IniWrite($FichierINI, "Run info", "Key3", $key3)
	IniWrite($FichierINI, "Run info", "Key4", $key4)
	IniWrite($FichierINI, "Run info", "PreBuff1", $PreBuff1)
	IniWrite($FichierINI, "Run info", "ToucheBuff1", $ToucheBuff1)
	IniWrite($FichierINI, "Run info", "delaiBuff1", $delaiBuff1)
	IniWrite($FichierINI, "Run info", "PreBuff2", $PreBuff2)
	IniWrite($FichierINI, "Run info", "ToucheBuff2", $ToucheBuff2)
	IniWrite($FichierINI, "Run info", "delaiBuff2", $delaiBuff2)
	IniWrite($FichierINI, "Run info", "PreBuff3", $PreBuff3)
	IniWrite($FichierINI, "Run info", "ToucheBuff3", $ToucheBuff3)
	IniWrite($FichierINI, "Run info", "delaiBuff3", $delaiBuff3)
	IniWrite($FichierINI, "Run info", "PreBuff4", $PreBuff4)
	IniWrite($FichierINI, "Run info", "ToucheBuff4", $ToucheBuff4)
	IniWrite($FichierINI, "Run info", "delaiBuff4", $delaiBuff4)
	IniWrite($FichierINI, "Run info", "SpellOnLeft", $SpellOnLeft)
	IniWrite($FichierINI, "Run info", "SpellDelayLeft", $SpellDelayLeft)
	IniWrite($FichierINI, "Run info", "SpellTypeLeft", $SpellTypeLeft)
	IniWrite($FichierINI, "Run info", "SpellEnergyNeedsLeft", $SpellEnergyNeedsLeft)
	IniWrite($FichierINI, "Run info", "SpellLifeLeft", $SpellLifeLeft)
	IniWrite($FichierINI, "Run info", "SpellDistanceLeft", $SpellDistanceLeft)
	IniWrite($FichierINI, "Run info", "SpellOnRight", $SpellOnRight)
	IniWrite($FichierINI, "Run info", "SpellDelayRight", $SpellDelayRight)
	IniWrite($FichierINI, "Run info", "SpellTypeRight", $SpellTypeRight)
	IniWrite($FichierINI, "Run info", "SpellEnergyNeedsRight", $SpellEnergyNeedsRight)
	IniWrite($FichierINI, "Run info", "SpellLifeRight", $SpellLifeRight)
	IniWrite($FichierINI, "Run info", "SpellDistanceRight", $SpellDistanceRight)
	IniWrite($FichierINI, "Run info", "SpellOn1", $SpellOn1)
	IniWrite($FichierINI, "Run info", "SpellDelay1", $SpellDelay1)
	IniWrite($FichierINI, "Run info", "SpellType1", $SpellType1)
	IniWrite($FichierINI, "Run info", "SpellEnergyNeeds1", $SpellEnergyNeeds1)
	IniWrite($FichierINI, "Run info", "SpellLife1", $SpellLife1)
	IniWrite($FichierINI, "Run info", "SpellDistance1", $SpellDistance1)
	IniWrite($FichierINI, "Run info", "SpellOn2", $SpellOn2)
	IniWrite($FichierINI, "Run info", "SpellDelay2", $SpellDelay2)
	IniWrite($FichierINI, "Run info", "SpellType2", $SpellType2)
	IniWrite($FichierINI, "Run info", "SpellEnergyNeeds2", $SpellEnergyNeeds2)
	IniWrite($FichierINI, "Run info", "SpellLife2", $SpellLife2)
	IniWrite($FichierINI, "Run info", "SpellDistance2", $SpellDistance2)
	IniWrite($FichierINI, "Run info", "SpellOn3", $SpellOn3)
	IniWrite($FichierINI, "Run info", "SpellDelay3", $SpellDelay3)
	IniWrite($FichierINI, "Run info", "SpellType3", $SpellType3)
	IniWrite($FichierINI, "Run info", "SpellEnergyNeeds3", $SpellEnergyNeeds3)
	IniWrite($FichierINI, "Run info", "SpellLife3", $SpellLife3)
	IniWrite($FichierINI, "Run info", "SpellDistance3", $SpellDistance3)
	IniWrite($FichierINI, "Run info", "SpellOn4", $SpellOn4)
	IniWrite($FichierINI, "Run info", "SpellDelay4", $SpellDelay4)
	IniWrite($FichierINI, "Run info", "SpellType4", $SpellType4)
	IniWrite($FichierINI, "Run info", "SpellEnergyNeeds4", $SpellEnergyNeeds4)
	IniWrite($FichierINI, "Run info", "SpellLife4", $SpellLife4)
	IniWrite($FichierINI, "Run info", "SpellDistance4", $SpellDistance4)
	iniwrite($FichierINI, "Run info","LifeForPotion",$LifeForPotion)
	iniwrite($FichierINI, "Run info","PotionStock",$PotionStock)
	iniwrite($FichierINI, "Run info","NbPotionBuy",$NbPotionBuy)
	iniwrite($FichierINI, "Run info","TakeShrines",$TakeShrines)
	iniwrite($FichierINI, "Run info","repairafterxxgames",$repairafterxxgames)
	iniwrite($FichierINI, "Run info","maxgamelength",$maxgamelength)
	iniwrite($FichierINI, "Run info","attackRange",$attackRange)
	iniwrite($FichierINI, "Run info","grabRange",$grabRange)
	iniwrite($FichierINI, "Run info","MonsterTri",$MonsterTri)
	iniwrite($FichierINI, "Run info","MonsterRefresh",$MonsterRefresh)
	iniwrite($FichierINI, "Run info","ItemRefresh",$ItemRefresh)
	iniwrite($FichierINI, "Run info","MonsterPriority",$MonsterPriority)
	iniwrite($FichierINI, "Run info","InventoryCheck",$InventoryCheck)
	iniwrite($FichierINI, "Run info","attacktimeout",$attacktimeout)
	iniwrite($FichierINI, "Run info","grabtimeout",$grabtimeout)
	iniwrite($FichierINI, "Run info","Gestion_affixe",$Gestionaffixe)
	iniwrite($FichierINI, "Run info","Gestion_affixe_loot",$Gestionaffixeloot)
	iniwrite($FichierINI, "Run info","BanAffixList",$BanAffixList)
	iniwrite($FichierINI, "Run info","Gest_affixe_ByClass",$GestaffixeByClass)
    iniwrite($FichierINI, "Run info","Life_Arcane",$LifeArcane)
    iniwrite($FichierINI, "Run info","Life_Peste",$LifePeste)
    iniwrite($FichierINI, "Run info","Life_Profa",$LifeProfa)
    iniwrite($FichierINI, "Run info","Life_Mine",$LifeMine)
    iniwrite($FichierINI, "Run info","Life_Spore",$LifeSpore)
    iniwrite($FichierINI, "Run info","Life_Arm",$LifeArm)
    iniwrite($FichierINI, "Run info","Life_Lave",$LifeLave)
	iniwrite($FichierINI, "Run info","Life_Proj",$LifeProj)
    iniwrite($FichierINI, "Run info","Life_Ice",$LifeIce)
    iniwrite($FichierINI, "Run info","Life_Poison",$LifePoison)
    iniwrite($FichierINI, "Run info","Life_Explo",$LifeExplo)
	iniwrite($FichierINI, "Run info","ResLife",$ResLife)
	iniwrite($FichierINI, "Run info","ResActivated",$ResActivated)
	iniwrite($FichierINI, "Run info","UsePath",$UsePath)
	iniwrite($FichierINI, "Run info","HCSecurity",$HCSecurity)
	iniwrite($FichierINI, "Run info","MinHCLife",$MinHCLife)

	AjoutLog("Enregistrement des modifs du fichier : " & $FichierINI)

EndFunc;==>SaveConfigsHero

;lecture du fichier settingsHeroX.ini
Func LoadConfigsHero($FichierINI)

	$Potions = IniRead($FichierINI, "Run info", "Potions", "")
	$key1 = IniRead($FichierINI, "Run info", "key1", "")
	$key2 = IniRead($FichierINI, "Run info", "key2", "")
	$key3 = IniRead($FichierINI, "Run info", "key3", "")
	$key4 = IniRead($FichierINI, "Run info", "key4", "")
	$PreBuff1 = IniRead($FichierINI, "Run info", "PreBuff1", "")
	$ToucheBuff1 = IniRead($FichierINI, "Run info", "ToucheBuff1", "")
	$delaiBuff1 = IniRead($FichierINI, "Run info", "delaiBuff1", "")
	$PreBuff2 = IniRead($FichierINI, "Run info", "PreBuff2", "")
	$ToucheBuff2 = IniRead($FichierINI, "Run info", "ToucheBuff2", "")
	$delaiBuff2 = IniRead($FichierINI, "Run info", "delaiBuff2", "")
	$PreBuff3 = IniRead($FichierINI, "Run info", "PreBuff3", "")
	$ToucheBuff3 = IniRead($FichierINI, "Run info", "ToucheBuff3", "")
	$delaiBuff3 = IniRead($FichierINI, "Run info", "delaiBuff3", "")
	$PreBuff4 = IniRead($FichierINI, "Run info", "PreBuff4", "")
	$ToucheBuff4 = IniRead($FichierINI, "Run info", "ToucheBuff4", "")
	$delaiBuff4 = IniRead($FichierINI, "Run info", "delaiBuff4", "")
	$SpellOnLeft = IniRead($FichierINI, "Run info", "SpellOnLeft", "")
	$SpellDelayLeft = IniRead($FichierINI, "Run info", "SpellDelayLeft", "")
	$SpellTypeLeft = IniRead($FichierINI, "Run info", "SpellTypeLeft", "")
	$SpellEnergyNeedsLeft = IniRead($FichierINI, "Run info", "SpellEnergyNeedsLeft", "")
	$SpellLifeLeft = IniRead($FichierINI, "Run info", "SpellLifeLeft", "")
	$SpellDistanceLeft = IniRead($FichierINI, "Run info", "SpellDistanceLeft", "")
	$SpellOnRight = IniRead($FichierINI, "Run info", "SpellOnRight", "")
	$SpellDelayRight = IniRead($FichierINI, "Run info", "SpellDelayRight", "")
	$SpellTypeRight = IniRead($FichierINI, "Run info", "SpellTypeRight", "")
	$SpellEnergyNeedsRight = IniRead($FichierINI, "Run info", "SpellEnergyNeedsRight", "")
	$SpellLifeRight = IniRead($FichierINI, "Run info", "SpellLifeRight", "")
	$SpellDistanceRight = IniRead($FichierINI, "Run info", "SpellDistanceRight", "")
	$SpellOn1 = IniRead($FichierINI, "Run info", "SpellOn1", "")
	$SpellDelay1 = IniRead($FichierINI, "Run info", "SpellDelay1", "")
	$SpellType1 = IniRead($FichierINI, "Run info", "SpellType1", "")
	$SpellEnergyNeeds1 = IniRead($FichierINI, "Run info", "SpellEnergyNeeds1", "")
	$SpellLife1 = IniRead($FichierINI, "Run info", "SpellLife1", "")
	$SpellDistance1 = IniRead($FichierINI, "Run info", "SpellDistance1", "")
	$SpellOn2 = IniRead($FichierINI, "Run info", "SpellOn2", "")
	$SpellDelay2 = IniRead($FichierINI, "Run info", "SpellDelay2", "")
	$SpellType2 = IniRead($FichierINI, "Run info", "SpellType2", "")
	$SpellEnergyNeeds2 = IniRead($FichierINI, "Run info", "SpellEnergyNeeds2", "")
	$SpellLife2 = IniRead($FichierINI, "Run info", "SpellLife2", "")
	$SpellDistance2 = IniRead($FichierINI, "Run info", "SpellDistance2", "")
	$SpellOn3 = IniRead($FichierINI, "Run info", "SpellOn3", "")
	$SpellDelay3 = IniRead($FichierINI, "Run info", "SpellDelay3", "")
	$SpellType3 = IniRead($FichierINI, "Run info", "SpellType3", "")
	$SpellEnergyNeeds3 = IniRead($FichierINI, "Run info", "SpellEnergyNeeds3", "")
	$SpellLife3 = IniRead($FichierINI, "Run info", "SpellLife3", "")
	$SpellDistance3 = IniRead($FichierINI, "Run info", "SpellDistance3", "")
	$SpellOn4 = IniRead($FichierINI, "Run info", "SpellOn4", "")
	$SpellDelay4 = IniRead($FichierINI, "Run info", "SpellDelay4", "")
	$SpellType4 = IniRead($FichierINI, "Run info", "SpellType4", "")
	$SpellEnergyNeeds4 = IniRead($FichierINI, "Run info", "SpellEnergyNeeds4", "")
	$SpellLife4 = IniRead($FichierINI, "Run info", "SpellLife4", "")
	$SpellDistance4 = IniRead($FichierINI, "Run info", "SpellDistance4", "")
	$LifeForPotion = IniRead($FichierINI, "Run info", "LifeForPotion", "")
	$PotionStock = IniRead($FichierINI, "Run info", "PotionStock", "")
	$NbPotionBuy = IniRead($FichierINI, "Run info", "NbPotionBuy", "")
	$TakeShrines = IniRead($FichierINI, "Run info", "TakeShrines", "")
	$repairafterxxgames = IniRead($FichierINI, "Run info", "repairafterxxgames", "")
	$maxgamelength = IniRead($FichierINI, "Run info", "maxgamelength", "")
	$attackRange = IniRead($FichierINI, "Run info", "attackRange", "")
	$grabRange = IniRead($FichierINI, "Run info", "grabRange", "")
	$MonsterTri = IniRead($FichierINI, "Run info", "MonsterTri", "")
	$MonsterRefresh = IniRead($FichierINI, "Run info", "MonsterRefresh", "")
	$ItemRefresh = IniRead($FichierINI, "Run info", "ItemRefresh", "")
	$MonsterPriority = IniRead($FichierINI, "Run info", "MonsterPriority", "")
	$InventoryCheck = IniRead($FichierINI, "Run info", "InventoryCheck", "")
	$attacktimeout = IniRead($FichierINI, "Run info", "attacktimeout", "")
	$grabtimeout = IniRead($FichierINI, "Run info", "grabtimeout", "")
	$Gestionaffixe = IniRead($FichierINI, "Run info", "Gestion_affixe", "")
	$Gestionaffixeloot = IniRead($FichierINI, "Run info", "Gestion_affixe_loot", "")
	$BanAffixList = IniRead($FichierINI, "Run info", "BanAffixList", "")
	$GestaffixeByClass = IniRead($FichierINI, "Run info", "Gest_affixe_ByClass", "")
	$LifeArcane = IniRead($FichierINI, "Run info", "Life_Arcane", "")
	$LifeProj = IniRead($FichierINI, "Run info", "Life_Proj", "")
	$LifePeste = IniRead($FichierINI, "Run info", "Life_Peste", "")
	$LifeProfa = IniRead($FichierINI, "Run info", "Life_Profa", "")
	$LifeIce = IniRead($FichierINI, "Run info", "Life_Ice", "")
	$LifePoison = IniRead($FichierINI, "Run info", "Life_Poison", "")
	$LifeExplo = IniRead($FichierINI, "Run info", "Life_Explo", "")
	$LifeLave = IniRead($FichierINI, "Run info", "Life_Lave", "")
	$LifeMine = IniRead($FichierINI, "Run info", "Life_Mine", "")
	$LifeArm = IniRead($FichierINI, "Run info", "Life_Arm", "")
	$LifeSpore = IniRead($FichierINI, "Run info", "Life_Spore", "")
	$UsePath = IniRead($FichierINI, "Run info", "UsePath", "")
	$ResActivated = IniRead($FichierINI, "Run info", "ResActivated", "")
	$ResLife = IniRead($FichierINI, "Run info", "ResLife", "")
	$HCSecurity = IniRead($FichierINI, "Run info", "HCSecurity", "")
	$MinHCLife = IniRead($FichierINI, "Run info", "MinHCLife", "")

	AjoutLog("Chargement du fichier : " & $FichierINI)

EndFunc;==>LoadConfigsHero

;;Lecture des options de Settings Arreat Core
Func LectureOptions()

	$Devmode = IniRead($SettingsIni, "Run info", "Devmode", "")
	If $Devmode = "true" Then
		GUICtrlSetState($DevmodeItem, $GUI_CHECKED)
	Else
		GUICtrlSetState($DevmodeItem, $GUI_UNCHECKED)
	EndIf

	$D3PrefsBot = IniRead($OptionsIni, "Optimisations", "D3PrefsBot", "")
	If $D3PrefsBot = "true" Then
		GUICtrlSetState($CpuGpuItem, $GUI_CHECKED)
	Else
		GUICtrlSetState($CpuGpuItem, $GUI_UNCHECKED)
	EndIf

	AjoutLog("Chargement du fichier : " & $OptionsIni)

EndFunc;==>LectureOptions

;;Enregistrement des options de settings Arreat Core
Func EnregOptions()

	iniwrite($OptionsIni, "Optimisations","D3PrefsBot",$D3PrefsBot)

	AjoutLog("Enregistrement des modifs du fichier : " & $OptionsIni)

EndFunc;==>EnregOptions