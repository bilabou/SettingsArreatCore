;;fonction pour remplir la GUI avec settings.ini et settingsHero.ini
Func RemplirSettings()

	;;Settings.ini
	GUICtrlSetData($InputPassD3,$PassD3)
	If $PartieSolo="true" Then
		GUICtrlSetState($RadioBotSeul ,$GUI_CHECKED)
	Else
		GUICtrlSetState($RadioBotTeam ,$GUI_CHECKED)
	EndIf
	If $TakeABreak="true" Then
		GUICtrlSetState($CheckboxPause ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxPause ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputApresXparties,$Breakafterxxgames)
	GUICtrlSetData($InputTempsPause,$BreakTime)
	If $PauseRepas = "true" Then
		GUICtrlSetState($CheckboxPauseRepas ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxPauseRepas ,$GUI_UNCHECKED)
	EndIf
	If $Recycle = "true" Then
		GUICtrlSetState($CheckboxRecycler ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxRecycler ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputQualit,$QualityRecycle)
	If $Unidentified = "true" Then
		GUICtrlSetState($CheckboxFiltreNoID ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxFiltreNoID ,$GUI_UNCHECKED)
	EndIf
	If $Identified = "true" Then
		GUICtrlSetState($CheckboxFiltreID ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxFiltreID ,$GUI_UNCHECKED)
	EndIf
	Switch $TypeDeBot + 1
		Case 1
			GUICtrlSetData($ComboTypeBot, "Semi-Manuel")
		Case 2
			GUICtrlSetData($ComboTypeBot, "Auto")
		Case 3
			GUICtrlSetData($ComboTypeBot, "Manuel")
	EndSwitch
	Switch $difficulte
		Case 1
			GUICtrlSetData($ComboDifficulte, "Normal")
		Case 2
			GUICtrlSetData($ComboDifficulte, "Cauchemar")
		Case 3
			GUICtrlSetData($ComboDifficulte, "Enfer")
		Case 4
			GUICtrlSetData($ComboDifficulte, "Armageddon")
	EndSwitch
	Switch $PuisMonstre + 1
		Case 1
			GUICtrlSetData($ComboPM, "Pm0")
		Case 2
			GUICtrlSetData($ComboPM, "Pm1")
		Case 3
			GUICtrlSetData($ComboPM, "Pm2")
		Case 4
			GUICtrlSetData($ComboPM, "Pm3")
		Case 5
			GUICtrlSetData($ComboPM, "Pm4")
		Case 6
			GUICtrlSetData($ComboPM, "Pm5")
		Case 7
			GUICtrlSetData($ComboPM, "Pm6")
		Case 8
			GUICtrlSetData($ComboPM, "Pm7")
		Case 9
			GUICtrlSetData($ComboPM, "Pm8")
		Case 10
			GUICtrlSetData($ComboPM, "Pm9")
		Case 11
			GUICtrlSetData($ComboPM, "Pm10")
	EndSwitch
	Switch $TypeDeGrabList
		Case 1
			GUICtrlSetData($ComboGrablist, "Arma")
		Case 2
			GUICtrlSetData($ComboGrablist, "ArmaXp")
		Case 3
			GUICtrlSetData($ComboGrablist, "ArmaUnid")
		Case 4
			GUICtrlSetData($ComboGrablist, "ArmaRecycle")
	EndSwitch
	Switch $ChoixActRun + 2
		Case 1
			GUICtrlSetData($ComboChoixRun, "Acte Aléatoire (Act1,Act2,Act3)")
		Case 2
			GUICtrlSetData($ComboChoixRun, "Séquence par défaut/Test/etc")
		Case 3
			GUICtrlSetData($ComboChoixRun, "Act 1")
		Case 4
			GUICtrlSetData($ComboChoixRun, "Act 2")
		Case 5
			GUICtrlSetData($ComboChoixRun, "Act 3")
		Case 6
			GUICtrlSetData($ComboChoixRun, "Act 3 quête 3 sous quête 3 --> Tuer Ghom")
		Case 7
			GUICtrlSetData($ComboChoixRun, "Act 3 quête 6 sous quête 2 --> Tuer le Briseur de Siège")
		Case 8
			GUICtrlSetData($ComboChoixRun, "Act 3 quête 7 sous quête 3 --> Terrasser Asmodan")
	EndSwitch
	If $SequenceAleatoire = "true" Then
		GUICtrlSetState($CheckboxSequencesAlea ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSequencesAlea ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputChangementAct,$NbreRunChangSeqAlea)
	GUICtrlSetData($InputChangementRun,$NombredeRun)
	GUICtrlSetData($InputAct1Min,$NombreMiniAct1)
	GUICtrlSetData($InputAct1Max,$NombreMaxiAct1)
	GUICtrlSetData($InputAct2Min,$NombreMiniAct2)
	GUICtrlSetData($InputAct2Max,$NombreMaxiAct2)
	GUICtrlSetData($InputAct3Min,$NombreMiniAct3)
	GUICtrlSetData($InputAct3Max,$NombreMaxiAct3)
	GUICtrlSetData($InputAct1HAZ,$Act1HeroAxeZ)
	GUICtrlSetData($InputAct2HAZ,$Act2HeroAxeZ)
	GUICtrlSetData($InputAct3HAZ,$Act3HeroAxeZ)
	GUICtrlSetData($InputMonsterList,$monsterList)
	GUICtrlSetData($InputSpecialmonterList,$specialmonsterList)
	GUICtrlSetData($InputHAZ,$HeroAxeZ)
	GUICtrlSetData($InputQualiteItems,$QualiteItem)

	;;SettingsHero.ini
	Switch $Potions
		Case "healthPotion_Minor"
			GUICtrlSetData($ComboPotions,"healthPotion_Minor")
		Case "healthPotion_Lesser"
			GUICtrlSetData($ComboPotions,"healthPotion_Lesser")
		Case "healthPotion_Greater"
			GUICtrlSetData($ComboPotions,"healthPotion_Greater")
		Case "HealthPotionLarge"
			GUICtrlSetData($ComboPotions,"HealthPotionLarge")
		Case "healthPotion_Super"
			GUICtrlSetData($ComboPotions,"healthPotion_Super")
		Case "healthPotion_Heroic"
			GUICtrlSetData($ComboPotions,"healthPotion_Heroic")
		Case "healthPotion_Resplendent"
			GUICtrlSetData($ComboPotions,"healthPotion_Resplendent")
		Case "healthPotion_Runic"
			GUICtrlSetData($ComboPotions,"healthPotion_Runic")
		Case "healthPotion_Mythic"
			GUICtrlSetData($ComboPotions,"healthPotion_Mythic")
	EndSwitch
	GUICtrlSetData($InputLifeForPotion,$LifeForPotion)
	GUICtrlSetData($InputPotionStock,$PotionStock)
	GUICtrlSetData($InputNbPotionBuy,$NbPotionBuy)
	If $TakeShrines="true" Then
		GUICtrlSetState($CheckboxTakeShrines ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxTakeShrines ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($Inputrepairafterxxgames,$repairafterxxgames)
	GUICtrlSetData($Inputmaxgamelength,$maxgamelength)
	GUICtrlSetData($InputattackRange,$attackRange)
	GUICtrlSetData($InputgrabRange,$grabRange)
	If $MonsterTri="true" Then
		GUICtrlSetState($CheckboxMonsterTri ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxMonsterTri ,$GUI_UNCHECKED)
	EndIf
	If $MonsterRefresh="true" Then
		GUICtrlSetState($CheckboxMonsterRefresh ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxMonsterRefresh ,$GUI_UNCHECKED)
	EndIf
	If $ItemRefresh="true" Then
		GUICtrlSetState($CheckboxItemRefresh ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxItemRefresh ,$GUI_UNCHECKED)
	EndIf
	If $MonsterPriority="true" Then
		GUICtrlSetState($CheckboxMonsterPriority ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxMonsterPriority ,$GUI_UNCHECKED)
	EndIf
	If $InventoryCheck="true" Then
		GUICtrlSetState($CheckboxInventoryCheck ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxInventoryCheck ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($Inputattacktimeout,$attacktimeout)
	GUICtrlSetData($Inputgrabtimeout,$grabtimeout)
	If $Gestionaffixe="true" Then
		GUICtrlSetState($CheckboxGestionaffixe ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxGestionaffixe ,$GUI_UNCHECKED)
	EndIf
	If $Gestionaffixeloot="true" Then
		GUICtrlSetState($CheckboxGestionaffixeloot ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxGestionaffixeloot ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputBanAffixList,$BanAffixList)
	If $GestaffixeByClass="true" Then
		GUICtrlSetState($CheckboxGestaffixeByClass ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxGestaffixeByClass ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputLifeArcane,$LifeArcane)
	GUICtrlSetData($InputLifeProj,$LifeProj)
	GUICtrlSetData($InputLifePeste,$LifePeste)
	GUICtrlSetData($InputLifeProfa,$LifeProfa)
	GUICtrlSetData($InputLifeIce,$LifeIce)
	GUICtrlSetData($InputLifePoison,$LifePoison)
	GUICtrlSetData($InputLifeExplo,$LifeExplo)
	GUICtrlSetData($InputLifeLave,$LifeLave)
	GUICtrlSetData($InputLifeMine,$LifeMine)
	GUICtrlSetData($InputLifeArm,$LifeArm)
	GUICtrlSetData($InputLifeSpore,$LifeSpore)
	If $UsePath = "true" Then
		GUICtrlSetState($CheckboxUsePath ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxUsePath ,$GUI_UNCHECKED)
	EndIf
	If $ResActivated = "true" Then
		GUICtrlSetState($CheckboxResActivated ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxResActivated ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputResLife,$ResLife)
	If $HCSecurity = "true" Then
		GUICtrlSetState($CheckboxSecuHC ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSecuHC ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputViemini,$MinHCLife)

	;;Touche, Prébuffs et souris
	GUICtrlSetData($Inputkey1,$key1)
	GUICtrlSetData($Inputkey2,$key2)
	GUICtrlSetData($Inputkey3,$key3)
	GUICtrlSetData($Inputkey4,$key4)
	If $PreBuff1 = "true" Then
		GUICtrlSetState($CheckboxPreBuff1 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxPreBuff1 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputToucheBuff1,$ToucheBuff1)
	GUICtrlSetData($InputdelaiBuff1,$delaiBuff1)
	If $PreBuff2 = "true" Then
		GUICtrlSetState($CheckboxPreBuff2 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxPreBuff2 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputToucheBuff2,$ToucheBuff2)
	GUICtrlSetData($InputdelaiBuff2,$delaiBuff2)
	If $PreBuff3 = "true" Then
		GUICtrlSetState($CheckboxPreBuff3 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxPreBuff3 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputToucheBuff3,$ToucheBuff3)
	GUICtrlSetData($InputdelaiBuff3,$delaiBuff3)
	If $PreBuff4 = "true" Then
		GUICtrlSetState($CheckboxPreBuff4 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxPreBuff4 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputToucheBuff4,$ToucheBuff4)
	GUICtrlSetData($InputdelaiBuff4,$delaiBuff4)
	If $SpellOnLeft = "true" Then
		GUICtrlSetState($CheckboxSpellOnLeft ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSpellOnLeft ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputSpellDelayLeft,$SpellDelayLeft)
	GUICtrlSetData($InputSpellTypeLeft,$SpellTypeLeft)
	GUICtrlSetData($InputSpellEnergyNeedsLeft,$SpellEnergyNeedsLeft)
	GUICtrlSetData($InputSpellLifeLeft,$SpellLifeLeft)
	GUICtrlSetData($InputSpellDistanceLeft,$SpellDistanceLeft)
	If $SpellOnRight = "true" Then
		GUICtrlSetState($CheckboxSpellOnRight ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSpellOnRight ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputSpellDelayRight,$SpellDelayRight)
	GUICtrlSetData($InputSpellTypeRight,$SpellTypeRight)
	GUICtrlSetData($InputSpellEnergyNeedsRight,$SpellEnergyNeedsRight)
	GUICtrlSetData($InputSpellLifeRight,$SpellLifeRight)
	GUICtrlSetData($InputSpellDistanceRight,$SpellDistanceRight)

	;;Touche 1 à 4
	If $SpellOn1 = "true" Then
		GUICtrlSetState($CheckboxSpellOn1 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSpellOn1 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputSpellDelay1,$SpellDelay1)
	GUICtrlSetData($InputSpellType1,$SpellType1)
	GUICtrlSetData($InputSpellEnergyNeeds1,$SpellEnergyNeeds1)
	GUICtrlSetData($InputSpellLife1,$SpellLife1)
	GUICtrlSetData($InputSpellDistance1,$SpellDistance1)
	If $SpellOn2 = "true" Then
		GUICtrlSetState($CheckboxSpellOn2 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSpellOn2 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputSpellDelay2,$SpellDelay2)
	GUICtrlSetData($InputSpellType2,$SpellType2)
	GUICtrlSetData($InputSpellEnergyNeeds2,$SpellEnergyNeeds2)
	GUICtrlSetData($InputSpellLife2,$SpellLife2)
	GUICtrlSetData($InputSpellDistance2,$SpellDistance2)
	If $SpellOn3 = "true" Then
		GUICtrlSetState($CheckboxSpellOn3 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSpellOn3 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputSpellDelay3,$SpellDelay3)
	GUICtrlSetData($InputSpellType3,$SpellType3)
	GUICtrlSetData($InputSpellEnergyNeeds3,$SpellEnergyNeeds3)
	GUICtrlSetData($InputSpellLife3,$SpellLife3)
	GUICtrlSetData($InputSpellDistance3,$SpellDistance3)
	If $SpellOn4 = "true" Then
		GUICtrlSetState($CheckboxSpellOn4 ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CheckboxSpellOn4 ,$GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($InputSpellDelay4,$SpellDelay4)
	GUICtrlSetData($InputSpellType4,$SpellType4)
	GUICtrlSetData($InputSpellEnergyNeeds4,$SpellEnergyNeeds4)
	GUICtrlSetData($InputSpellLife4,$SpellLife4)
	GUICtrlSetData($InputSpellDistance4,$SpellDistance4)

	;;Séquences
	GUICtrlSetData($InputSequenceAct1,$SequenceFileAct1)
	GUICtrlSetData($InputSequenceAct2,$SequenceFileAct2)
	GUICtrlSetData($InputSequenceAct3Pt,$SequenceFileAct3PtSauve)
	GUICtrlSetData($InputSequenceAct3,$SequenceFileAct3)
	GUICtrlSetData($InputSequenceAct333,$SequenceFileAct333)
	GUICtrlSetData($InputSequenceAct362,$SequenceFileAct362)
	GUICtrlSetData($InputSequenceAct373,$SequenceFileAct373)
	AjoutLog("Remplissage des données avec le settings.ini et le settingsHero.ini")
EndFunc;==>RemplirSettings

;;On récupère les données de la GUI pour settings.ini et settingsHero.ini
Func RecupDonneesSettings()

	;;Settings
	$PassD3=GUICtrlRead($InputPassD3)
	If IsChecked($RadioBotSeul) Then
		$PartieSolo="true"
	Else
		$PartieSolo="false"
	EndIf
	If IsChecked($CheckboxPause) Then
		$TakeABreak="true"
	Else
		$TakeABreak="false"
	EndIf
	$Breakafterxxgames = GUICtrlRead($InputApresXparties)
	$BreakTime = GUICtrlRead($InputTempsPause)
	If IsChecked($CheckboxPauseRepas) Then
		$PauseRepas = "true"
	Else
		$PauseRepas = "false"
	EndIf
	If IsChecked($CheckboxRecycler) Then
		$Recycle = "true"
	Else
		$Recycle = "false"
	EndIf
	$QualityRecycle = GUICtrlRead($InputQualit)
	If IsChecked($CheckboxFiltreID) Then
		$Identified = "true"
	Else
		$Identified = "false"
	EndIf
	If IsChecked($CheckboxFiltreNoID) Then
		$Unidentified = "true"
	Else
		$Unidentified = "false"
	EndIf
	Local $ValComboTypeBot = GUICtrlRead($ComboTypeBot)
	Switch $ValComboTypeBot
		Case "Semi-Manuel"
			$TypeDeBot = 0
		Case "Auto"
			$TypeDeBot = 1
		Case "Manuel"
			$TypeDeBot = 2
	EndSwitch
	Local $ValComboDiff = GUICtrlRead($ComboDifficulte)
	Switch $ValComboDiff
		Case "Normal"
			$difficulte = 1
		Case "Cauchemar"
			$difficulte = 2
		case "Enfer"
			$difficulte = 3
		Case "Armageddon"
			$difficulte = 4
	EndSwitch
	Local $ValComboPM = GUICtrlRead($ComboPM)
	Switch $ValComboPM
		Case "Pm0"
			$PuisMonstre = 0
		Case "Pm1"
			$PuisMonstre = 1
		Case "Pm2"
			$PuisMonstre = 2
		Case "Pm3"
			$PuisMonstre = 3
		Case "Pm4"
			$PuisMonstre = 4
		Case "Pm5"
			$PuisMonstre = 5
		Case "Pm6"
			$PuisMonstre = 6
		Case "Pm7"
			$PuisMonstre = 7
		Case "Pm8"
			$PuisMonstre = 8
		Case "Pm9"
			$PuisMonstre = 9
		Case "Pm10"
			$PuisMonstre = 10
	EndSwitch
	Local $ValComboGrab =  GUICtrlRead($ComboGrablist)
	Switch $ValComboGrab
		Case "Arma"
			$TypeDeGrabList = 1
		Case "ArmaXp"
			$TypeDeGrabList = 2
		Case "ArmaUnid"
			$TypeDeGrabList = 3
		Case "ArmaRecycle"
			$TypeDeGrabList = 4
	EndSwitch
	Local $ValComboRun =  GUICtrlRead($ComboChoixRun)
	Switch $ValComboRun
		Case "Acte Aléatoire (Act1,Act2,Act3)"
			$ChoixActRun = -1
		Case "Séquence par défaut/Test/etc"
			$ChoixActRun = 0
		Case "Act 1"
			$ChoixActRun = 1
		Case "Act 2"
			$ChoixActRun = 2
		Case "Act 3"
			$ChoixActRun = 3
		Case "Act 3 quête 3 sous quête 3 --> Tuer Ghom"
			$ChoixActRun = 333
		Case "Act 3 quête 6 sous quête 2 --> Tuer le Briseur de Siège"
			$ChoixActRun = 362
		Case "Act 3 quête 7 sous quête 3 --> Terraser Asmodan"
			$ChoixActRun = 373
	EndSwitch
	If IsChecked($CheckboxSequencesAlea) Then
		$SequenceAleatoire = "true"
	Else
		$SequenceAleatoire = "false"
	EndIf
	$NbreRunChangSeqAlea = GUICtrlRead($InputChangementAct)
	$NombredeRun = GUICtrlRead($InputChangementRun)
	$NombreMiniAct1 = GUICtrlRead($InputAct1min)
	$NombreMaxiAct1 = GUICtrlRead($InputAct1max)
	$NombreMiniAct2 = GUICtrlRead($InputAct2min)
	$NombreMaxiAct2 = GUICtrlRead($InputAct2max)
	$NombreMiniAct3 = GUICtrlRead($InputAct3min)
	$NombreMaxiAct3 = GUICtrlRead($InputAct3max)
	$Act1HeroAxeZ = GUICtrlRead($InputAct1HAZ)
	$Act2HeroAxeZ = GUICtrlRead($InputAct2HAZ)
	$Act3HeroAxeZ = GUICtrlRead($InputAct3HAZ)
	$HeroAxeZ = GUICtrlRead($InputHAZ)
	;$SequenceFile = GUICtrlRead($Input_s)
	$monsterList = GUICtrlRead($InputMonsterList)
	$specialmonsterList = GUICtrlRead($InputSpecialmonterList)
	$QualiteItem = GUICtrlRead($InputQualiteItems)

	$key1 = GUICtrlRead($Inputkey1)
	$key2 = GUICtrlRead($Inputkey2)
	$key3 = GUICtrlRead($Inputkey3)
	$key4 = GUICtrlRead($Inputkey4)
	If IsChecked($CheckboxPreBuff1) Then
		$PreBuff1="true"
	Else
		$PreBuff1="false"
	EndIf
	$ToucheBuff1 = GUICtrlRead($InputToucheBuff1)
	$delaiBuff1 = GUICtrlRead($InputdelaiBuff1)
	If IsChecked($CheckboxPreBuff2) Then
		$PreBuff2="true"
	Else
		$PreBuff2="false"
	EndIf
	$ToucheBuff2 = GUICtrlRead($InputToucheBuff2)
	$delaiBuff2 = GUICtrlRead($InputdelaiBuff2)
	If IsChecked($CheckboxPreBuff3) Then
		$PreBuff3="true"
	Else
		$PreBuff3="false"
	EndIf
	$ToucheBuff3 = GUICtrlRead($InputToucheBuff3)
	$delaiBuff3 = GUICtrlRead($InputdelaiBuff3)
	If IsChecked($CheckboxPreBuff4) Then
		$PreBuff4="true"
	Else
		$PreBuff4="false"
	EndIf
	$ToucheBuff4 = GUICtrlRead($InputToucheBuff4)
	$delaiBuff4 = GUICtrlRead($InputdelaiBuff4)
	If IsChecked($CheckboxSpellOnLeft) Then
		$SpellOnLeft="true"
	Else
		$SpellOnLeft="false"
	EndIf
	$SpellDelayLeft = GUICtrlRead($InputSpellDelayLeft)
	$SpellTypeLeft = GUICtrlRead($InputSpellTypeLeft)
	$SpellEnergyNeedsLeft = GUICtrlRead($InputSpellEnergyNeedsLeft)
	$SpellLifeLeft = GUICtrlRead($InputSpellLifeLeft)
	$SpellDistanceLeft = GUICtrlRead($InputSpellDistanceLeft)
	If IsChecked($CheckboxSpellOnRight) Then
		$SpellOnRight="true"
	Else
		$SpellOnRight="false"
	EndIf
	$SpellDelayRight = GUICtrlRead($InputSpellDelayRight)
	$SpellTypeRight = GUICtrlRead($InputSpellTypeRight)
	$SpellEnergyNeedsRight = GUICtrlRead($InputSpellEnergyNeedsRight)
	$SpellLifeRight = GUICtrlRead($InputSpellLifeRight)
	$SpellDistanceRight = GUICtrlRead($InputSpellDistanceRight)
		If IsChecked($CheckboxSpellOn1) Then
		$SpellOn1="true"
	Else
		$SpellOn1="false"
	EndIf
	$SpellDelay1 = GUICtrlRead($InputSpellDelay1)
	$SpellType1 = GUICtrlRead($InputSpellType1)
	$SpellEnergyNeeds1 = GUICtrlRead($InputSpellEnergyNeeds1)
	$SpellLife1 = GUICtrlRead($InputSpellLife1)
	$SpellDistance1 = GUICtrlRead($InputSpellDistance1)
	If IsChecked($CheckboxSpellOn2) Then
		$SpellOn2="true"
	Else
		$SpellOn2="false"
	EndIf
	$SpellDelay2 = GUICtrlRead($InputSpellDelay2)
	$SpellType2 = GUICtrlRead($InputSpellType2)
	$SpellEnergyNeeds2 = GUICtrlRead($InputSpellEnergyNeeds2)
	$SpellLife2 = GUICtrlRead($InputSpellLife2)
	$SpellDistance2 = GUICtrlRead($InputSpellDistance2)
	If IsChecked($CheckboxSpellOn3) Then
		$SpellOn3="true"
	Else
		$SpellOn3="false"
	EndIf
	$SpellDelay3 = GUICtrlRead($InputSpellDelay3)
	$SpellType3 = GUICtrlRead($InputSpellType3)
	$SpellEnergyNeeds3 = GUICtrlRead($InputSpellEnergyNeeds3)
	$SpellLife3 = GUICtrlRead($InputSpellLife3)
	$SpellDistance3 = GUICtrlRead($InputSpellDistance3)
	If IsChecked($CheckboxSpellOn4) Then
		$SpellOn4="true"
	Else
		$SpellOn4="false"
	EndIf
	$SpellDelay4 = GUICtrlRead($InputSpellDelay4)
	$SpellType4 = GUICtrlRead($InputSpellType4)
	$SpellEnergyNeeds4 = GUICtrlRead($InputSpellEnergyNeeds4)
	$SpellLife4 = GUICtrlRead($InputSpellLife4)
	$SpellDistance4 = GUICtrlRead($InputSpellDistance4)

	;;Séquences
	$SequenceFileAct1 = GUICtrlRead($InputSequenceAct1)
	$SequenceFileAct2 = GUICtrlRead($InputSequenceAct2)
	$SequenceFileAct3PtSauve = GUICtrlRead($InputSequenceAct3Pt)
	$SequenceFileAct3 = GUICtrlRead($InputSequenceAct3)
	$SequenceFileAct333 = GUICtrlRead($InputSequenceAct333)
	$SequenceFileAct362 = GUICtrlRead($InputSequenceAct362)
	$SequenceFileAct373 = GUICtrlRead($InputSequenceAct373)

	;;SettingsHero.ini
	$Potions = GUICtrlRead($ComboPotions)
	$LifeForPotion = GUICtrlRead($InputLifeForPotion)
	$PotionStock = GUICtrlRead($InputPotionStock)
	$NbPotionBuy = GUICtrlRead($InputNbPotionBuy)
	If IsChecked($CheckboxTakeShrines) Then
		$TakeShrines = "true"
	Else
		$TakeShrines = "false"
	EndIf
	$repairafterxxgames = GUICtrlRead($Inputrepairafterxxgames)
	$maxgamelength = GUICtrlRead($Inputmaxgamelength)
	$attackRange = GUICtrlRead($InputattackRange)
	$grabRange = GUICtrlRead($InputgrabRange)
	If IsChecked($CheckboxMonsterTri) Then
		$MonsterTri = "true"
	Else
		$MonsterTri = "false"
	EndIf
	If IsChecked($CheckboxMonsterRefresh) Then
		$MonsterRefresh = "true"
	Else
		$MonsterRefresh = "false"
	EndIf
	If IsChecked($CheckboxItemRefresh) Then
		$ItemRefresh = "true"
	Else
		$ItemRefresh = "false"
	EndIf
	If IsChecked($CheckboxMonsterPriority) Then
		$MonsterPriority = "true"
	Else
		$MonsterPriority = "false"
	EndIf
	If IsChecked($CheckboxInventoryCheck) Then
		$InventoryCheck = "true"
	Else
		$InventoryCheck = "false"
	EndIf
	$attacktimeout = GUICtrlRead($Inputattacktimeout)
	$grabtimeout = GUICtrlRead($Inputgrabtimeout)
	If IsChecked($CheckboxGestionaffixe) Then
		$Gestionaffixe = "true"
	Else
		$Gestionaffixe = "false"
	EndIf
	If IsChecked($CheckboxGestionaffixeloot) Then
		$Gestionaffixeloot = "true"
	Else
		$Gestionaffixeloot = "false"
	EndIf
	$BanAffixList = GUICtrlRead($InputBanAffixList)
	If IsChecked($CheckboxGestaffixeByClass) Then
		$GestaffixeByClass = "true"
	Else
		$GestaffixeByClass = "false"
	EndIf
	$LifeArcane = GUICtrlRead($InputLifeArcane)
	$LifeProj = GUICtrlRead($InputLifeProj)
	$LifePeste = GUICtrlRead($InputLifePeste)
	$LifeProfa = GUICtrlRead($InputLifeProfa)
	$LifeIce = GUICtrlRead($InputLifeIce)
	$LifePoison = GUICtrlRead($InputLifePoison)
	$LifeExplo = GUICtrlRead($InputLifeExplo)
	$LifeLave = GUICtrlRead($InputLifeLave)
	$LifeArm = GUICtrlRead($InputLifeArm)
	$LifeSpore = GUICtrlRead($InputLifeSpore)
	$LifeMine = GUICtrlRead($InputLifeMine)
	If IsChecked($CheckboxResActivated) Then
		$ResActivated = "true"
	Else
		$ResActivated = "false"
	EndIf
	If IsChecked($CheckboxUsePath) Then
		$UsePath = "true"
	Else
		$UsePath = "false"
	EndIf
	$ResLife = GUICtrlRead($InputResLife)
	If IsChecked($CheckboxSecuHC) Then
		$HCSecurity = "true"
	Else
		$HCSecurity = "false"
	EndIf
	$MinHCLife = GUICtrlRead($InputViemini)
	AjoutLog("On récupère les données pour le settings.ini et le settingsHero.ini")
EndFunc;==>RecupDonneesSettings


Func RempliOptions()

	If $D3PrefsBot = "true" Then
		GUICtrlSetState($CpuGpuItem ,$GUI_CHECKED)
	Else
		GUICtrlSetState($CpuGpuItem ,$GUI_UNCHECKED)
	EndIf
	AjoutLog("Remplissage des options : " & $OptionsIni)
EndFunc;==>RempliOtions


Func RecupOtions()

	If IsChecked($CpuGpuItem) Then
		$D3PrefsBot = "true"
	Else
		$D3PrefsBot = "false"
	EndIf
	AjoutLog("On récupère les options : " & $OptionsIni)
EndFunc;==>RecupOtions