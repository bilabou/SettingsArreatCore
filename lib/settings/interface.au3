; -- Created with ISN Form Studio 2 for ISN AutoIt Studio -- ;

#NoTrayIcon

Global $MainForm = GUICreate("Settings Core Arreat",617,287,-1,-1,-1,-1)
GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
GUICtrlCreateGroup("Profils",5,5,441,272,-1,-1)
GUICtrlSetBkColor(-1,"0xF0F0F0")
Global $AddProfil = GUICtrlCreateButton("Ajouter Profil",10,250,100,22,-1,-1)
Global $EditProfil = GUICtrlCreateButton("Editer Profil",110,250,100,22,-1,-1)
Global $DeleteProfil = GUICtrlCreateButton("Effacer Profil",210,250,100,22,-1,-1)
Global $ChargerProfil = GUICtrlCreateButton("Charger Profil",340,250,100,22,-1,-1)
Global $ButtonStats = GUICtrlCreateButton("Stats",465,200,137,22,-1,-1)
GUICtrlSetTip(-1,"Permet l'affichage des fichiers du dossier 'stats'")
Global $ListviewProfils = GUICtrlCreatelistview("",10,20,430,225,-1,512)
Global $ButtonGrablists = GUICtrlCreateButton("Grablists",465,175,137,22,-1,-1)
GUICtrlSetTip(-1,"Gestion des grablists")
Global $ButtonLogs = GUICtrlCreateButton("Logs",465,225,137,22,-1,-1)
GUICtrlSetTip(-1,"Affichage des logs liés au soft")
Global $ImageLogo = GUICtrlCreatePic(@scriptdir & "\lib\images\logo.jpg",455,10,156,156,-1,-1)
GUICtrlCreateGroup("",455,166,156,111,-1,-1)
GUICtrlSetBkColor(-1,"0xF0F0F0")
Global $ButtonBuilds = GUICtrlCreateButton("Builds",465,250,137,22,-1,-1)
GUICtrlSetTip(-1,"Permet d'importer des builds et de les coller à vos profils")

_GUICtrlListView_InsertColumn($ListviewProfils, 0, "Profil", 100)
_GUICtrlListView_InsertColumn($ListviewProfils, 1, "Nom du perso", 100)
_GUICtrlListView_InsertColumn($ListviewProfils, 2, "Build", 226)

Func Builds()

	Global $Builds = GUICreate("Builds",377,302,-1,-1,-1,-1)
	GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
	Global $ListBuilds = GUICtrlCreatelist("",15,25,144,227,-1,512)
	Global $ListsBuildsProfils = GUICtrlCreatelist("",215,25,144,227,-1,512)
	GUICtrlCreateGroup("Builds",10,5,157,258,-1,-1)
	GUICtrlSetBkColor(-1,"0xF0F0F0")
	GUICtrlCreateGroup("Profils",210,5,156,258,-1,-1)
	GUICtrlSetBkColor(-1,"0xF0F0F0")
	Global $ButtonBuildsImporter = GUICtrlCreateButton("Importer",5,270,80,25,-1,-1)
	Global $ButtonBuildsSupprimer = GUICtrlCreateButton("Supprimer",90,270,80,25,-1,-1)
	Global $ButtonBuildsCharger = GUICtrlCreateButton("Charger",285,270,80,25,-1,-1)
	GUICtrlCreateLabel(">>",175,120,20,23,-1,-1)
	GUICtrlSetFont(-1,12,700,0,"MS Sans Serif")
	GUICtrlSetBkColor(-1,"-2")
	Global $ButtonBuildsFermer = GUICtrlCreateButton("Fermer",200,270,80,25,-1,-1)
	GUISetState(@SW_SHOW,$Builds)

	ListFichier($DossierBuilds,2) ; on list les builds
	ListFichier($DossierProfils,3) ; On list les profils

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg

			Case $GUI_EVENT_CLOSE
				GUIDelete($Builds)
				ExitLoop

			Case $ButtonBuildsFermer
				GUIDelete($Builds)
				ExitLoop

			Case $ButtonBuildsCharger

			Case $ButtonBuildsSupprimer
				$SuppBuild = GUICtrlRead($ListBuilds)
				If $SuppBuild = "" Then
					MsgBox( 48 + 262144, "", "Aucun build sélectionné", 3)
				Else
					FileDelete($DossierBuilds & $SuppBuild)
					ListFichier($DossierBuilds,2)
				EndIf

			Case $ButtonBuildsImporter


		EndSwitch
	WEnd
EndFunc;==>Builds

Func Logs()

 	Global $MainLogs = GUICreate("Logs",536,535,-1,-1,-1,-1)
	GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
	Global $EditLogs = GUICtrlCreateEdit("",5,5,525,495,3145728,-1)
	Global $ButtonExporterLogs = GUICtrlCreateButton("Exporter",430,505,100,25,-1,-1)
	Global $ButtonEffacerLogs = GUICtrlCreateButton("Effacer",220,505,100,25,-1,-1)
	Global $ButtonFermerLogs = GUICtrlCreateButton("Fermer",325,505,100,25,-1,-1)
	GUISetState(@SW_SHOW,$MainLogs)

	GUICtrlSetData($EditLogs,$Logs)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($MainLogs)
				ExitLoop
			Case $ButtonFermerLogs
				GUIDelete($MainLogs)
				ExitLoop
			Case $ButtonEffacerLogs
				GUICtrlSetData($EditLogs,"")
			Case $ButtonExporterLogs
				CreerFichierLogs ()
				GUICtrlSetData($EditLogs,$Logs)
		EndSwitch
	WEnd

EndFunc;==>Logs

Func Grablists()

	Global $Grablist = GUICreate("Grablists",668,420,-1,-1,-1,-1)
	Global $EditGrablists = GUICtrlCreateEdit("",5,40,659,376,-1,-1)
	Global $ComboLectureGrablist = GUICtrlCreateCombo("",80,10,150,21,-1,-1)
	GUICtrlSetData(-1,"grablistArma.txt|grablistArmaXp.txt|grablistArmaUnid.txt|grablistArmaRecycle.txt|grablistNormal.txt|grablistCauchemar.txt|grablistEnfer.txt")
	GUICtrlCreateLabel("Grablists :",15,15,50,15,-1,-1)
	GUICtrlSetFont(-1,8,400,4,"MS Sans Serif")
	GUICtrlSetBkColor(-1,"-2")
	Global $ButtonEnregistrerModif = GUICtrlCreateButton("Enregistrer les modifications",501,10,155,25,-1,-1)
	Global $ButtonFermerGrablist = GUICtrlCreateButton("Fermer",425,10,83,25,-1,-1)
	GUISetState(@SW_SHOW,$Grablist)


	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Grablist)
				ExitLoop

			Case $ButtonFermerGrablist
				GUIDelete($Grablist)
				ExitLoop

			Case $ButtonEnregistrerModif
				CreerFichier()


			Case $ComboLectureGrablist
				LectureGrablist()


		EndSwitch
	WEnd

EndFunc ;==>Grablists

Func Stats()

	Global $Stats = GUICreate("Stats",646,401,-1,-1,-1,-1)
	GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
	Global $EditStats = GUICtrlCreateEdit("",225,5,404,390,-1,-1)
	Global $ListStats = GUICtrlCreatelist("",15,52,200,266,-1,512)
	GUICtrlCreateLabel("Stats du :",15,10,50,15,-1,-1)
	GUICtrlSetFont(-1,8,400,4,"MS Sans Serif")
	GUICtrlSetBkColor(-1,"-2")
	Global $ButtonEffacerStats = GUICtrlCreateButton("Tout effacer",15,320,200,25,-1,-1)
	Global $ButtonCopierStats = GUICtrlCreateButton("Copier dans le presse-papier",15,370,200,25,-1,-1)
	Global $LabelDateStats = GUICtrlCreateLabel("",15,30,195,15,-1,-1)
	GUICtrlSetBkColor(-1,"-2")
	Global $ButtonFermerStats = GUICtrlCreateButton("Fermer",15,345,200,25,-1,-1)
	GUISetState(@SW_SHOW,$Stats)

	if FileExists($DossierStats) = 0 Then DirCreate($DossierStats)

	ListFichier($DossierStats,1)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Stats)
				ExitLoop

			Case $ButtonFermerStats
				GUIDelete($Stats)
				ExitLoop

			Case $ButtonEffacerStats

				DirRemove($DossierStats, 1)
				DirCreate($DossierStats)
				ListFichier($DossierStats,1)
				GUICtrlSetData($EditStats,"")
				AjoutLog("Effacement des stats")

			Case $ButtonCopierStats
				Local $StatsCopier = GUICtrlRead($Edit_Stats)
				ClipPut($StatsCopier)
				AjoutLog("Copie des stats dans le presse-papier")

			Case $ListStats

				GUICtrlSetData($EditStats,"")
				If GUICtrlRead($ListStats) = "" or GUICtrlRead($ListStats) = "Aucune stat" Then
					GUICtrlSetData($EditStats,"Aucune stat de dispo")
				Else
					Local $FichierLu = $DossierStats & GUICtrlRead($ListStats)
					ParseFichierStats(GUICtrlRead($ListStats))
					AfficheStats($FichierLu)
				EndIf

		EndSwitch
	WEnd

EndFunc;==>Stats

Func EditSettings($ProfilSel)

	Global $Main = GUICreate("Settings Arreat Core", 666, 426, -1, -1, -1, $WS_EX_TOPMOST)
	GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
	Global $Tab1 = GUICtrlCreateTab(8, 8, 649, 377)

	;;Onglet Settings.ini
	Global $TabSettingsIni = GUICtrlCreateTabItem("Settings")
	Global $InputPassD3 = GUICtrlCreateInput("", 363, 37, 121, 21)
	Global $Label2 = GUICtrlCreateLabel("Pass D3 :", 296, 45, 50, 17)
	Global $RadioBotSeul = GUICtrlCreateRadio("Bot seul", 496, 42, 65, 17)
	Global $RadioBotTeam = GUICtrlCreateRadio("Bot en team", 561, 42, 89, 17)
	Global $ComboTypeBot = GUICtrlCreateCombo("", 456, 80, 97, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$WS_BORDER))
	GUICtrlSetData(-1, "Semi-Manuel|Auto|Manuel")
	Global $Label5 = GUICtrlCreateLabel("Type de bot :", 344, 87, 67, 17)
	Global $GroupPause = GUICtrlCreateGroup("Pause :", 16, 66, 153, 113)
	Global $CheckboxPause = GUICtrlCreateCheckbox("Pause", 24, 82, 65, 17)
	Global $Label11 = GUICtrlCreateLabel("Après X parties :", 24, 106, 81, 17)
	Global $Label12 = GUICtrlCreateLabel("Temps de Pause :", 24, 130, 90, 17)
	Global $CheckboxPauseRepas = GUICtrlCreateCheckbox("Pause Repas", 24, 154, 97, 17)
	Global $InputApresXparties = GUICtrlCreateInput("", 120, 98, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputTempsPause = GUICtrlCreateInput("", 120, 122, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $GroupRecycler = GUICtrlCreateGroup("Recycler :", 176, 66, 153, 113)
	Global $CheckboxRecycler = GUICtrlCreateCheckbox("Recycler", 184, 82, 73, 17)
	Global $Label13 = GUICtrlCreateLabel("Qualité recyclée :", 184, 106, 86, 17)
	Global $CheckboxFiltreID = GUICtrlCreateCheckbox("Filtre Objet Identifié", 184, 130, 137, 17)
	Global $CheckboxFiltreNoID = GUICtrlCreateCheckbox("Filtre Objet Non Identifié", 184, 154, 137, 17)
	Global $InputQualit = GUICtrlCreateInput("", 280, 98, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $GroupRun = GUICtrlCreateGroup("Choix du run :", 16, 186, 313, 129)
	Global $CheckboxSequencesAlea = GUICtrlCreateCheckbox("Séquences aléatoires", 24, 234, 121, 17)
	Global $Label14 = GUICtrlCreateLabel("Run :", 24, 210, 30, 17)
	Global $ComboChoixRun = GUICtrlCreateCombo("", 56, 202, 265, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$WS_BORDER))
	GUICtrlSetData(-1, "Acte Aléatoire (Act1,Act2,Act3)|Séquence par défaut/Test/etc|Act 1|Act 2|Act 3|Act 3 quête 3 sous quête 3 --> Tuer Ghom|Act 3 quête 6 sous quête 2 --> Tuer le Briseur de Siège|Act 3 quête 7 sous quête 3 --> Terrasser Asmodan")
	Global $Label15 = GUICtrlCreateLabel("Changement acte :", 24, 266, 94, 17)
	Global $Label16 = GUICtrlCreateLabel("Changement run :", 24, 290, 88, 17)
	Global $Label17 = GUICtrlCreateLabel("Act1 (min-max) :", 184, 242, 79, 17)
	Global $Label18 = GUICtrlCreateLabel("Act2 (min-max) :", 184, 266, 79, 17)
	Global $Label19 = GUICtrlCreateLabel("Act3 (min-max) :", 184, 290, 79, 17)
	Global $InputChangementAct = GUICtrlCreateInput("", 128, 258, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputChangementRun = GUICtrlCreateInput("", 128, 282, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct1Min = GUICtrlCreateInput("", 264, 234, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct2Min = GUICtrlCreateInput("", 264, 258, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct3Min = GUICtrlCreateInput("", 264, 282, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct1Max = GUICtrlCreateInput("", 296, 234, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct2Max = GUICtrlCreateInput("", 296, 258, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct3Max = GUICtrlCreateInput("", 296, 282, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $ComboDifficulte = GUICtrlCreateCombo("", 456, 112, 97, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$WS_BORDER))
	GUICtrlSetData(-1, "Normal|Cauchemar|Enfer|Armageddon")
	Global $ComboPM = GUICtrlCreateCombo("", 456, 144, 97, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$WS_BORDER))
	GUICtrlSetData(-1, "Pm0|Pm1|Pm2|Pm3|Pm4|Pm5|Pm6|Pm7|Pm8|Pm9|Pm10")
	Global $ComboGrablist = GUICtrlCreateCombo("", 456, 176, 97, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$WS_BORDER))
	GUICtrlSetData(-1, "Arma|ArmaXp|ArmaUnid|ArmaRecycle")
	Global $Label7 = GUICtrlCreateLabel("Difficulté :", 344, 120, 51, 17)
	Global $Label8 = GUICtrlCreateLabel("PM :", 344, 152, 26, 17)
	Global $Label9 = GUICtrlCreateLabel("Type de grablist :", 344, 184, 85, 17)
	Global $InputQualiteItems = GUICtrlCreateInput("", 592, 208, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label10 = GUICtrlCreateLabel("Qualité items :", 512, 216, 70, 17)
	Global $Label20 = GUICtrlCreateLabel("L. monstre special :", 16, 360, 95, 17)
	Global $Label21 = GUICtrlCreateLabel("L. monstre:", 16, 336, 56, 17)
	Global $InputSpecialmonterList = GUICtrlCreateInput("", 112, 352, 529, 21)
	Global $InputMonsterList = GUICtrlCreateInput("", 112, 328, 529, 21)
	Global $Label22 = GUICtrlCreateLabel("Act1 Hero Axe Z :", 344, 216, 89, 17)
	Global $Label23 = GUICtrlCreateLabel("Act2 Hero Axe Z :", 344, 248, 89, 17)
	Global $Label24 = GUICtrlCreateLabel("Act3 Hero Axe Z :", 344, 280, 89, 17)
	Global $InputAct1HAZ = GUICtrlCreateInput("", 456, 208, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct2HAZ = GUICtrlCreateInput("", 456, 240, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct3HAZ = GUICtrlCreateInput("", 456, 272, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputHAZ = GUICtrlCreateInput("", 592, 240, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label25 = GUICtrlCreateLabel("Hero Axe Z :", 512, 248, 64, 17)
	Global $Label6 = GUICtrlCreateLabel("Profil :", 16, 40, 33, 17)
	Global $LabelSettingsProfil = GUICtrlCreateLabel("test", 56, 40, 109, 17)

	;;Onglet settingsHero.ini
	Global $TabHeroIni = GUICtrlCreateTabItem("Héros")
	Global $Label3 = GUICtrlCreateLabel("Potions :", 168, 64, 45, 17)
	Global $ComboPotions = GUICtrlCreateCombo("", 240, 56, 137, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "healthPotion_Minor|healthPotion_Lesser|healthPotion_Normal|healthPotion_Greater|HealthPotionLarge|healthPotion_Super|healthPotion_Heroic|healthPotion_Resplendent|healthPotion_Runic|healthPotion_Mythic")
	Global $Label4 = GUICtrlCreateLabel("Stock de potions :", 16, 64, 90, 17)
	Global $InputPotionStock = GUICtrlCreateInput("", 107, 56, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeForPotion = GUICtrlCreateInput("", 106, 120, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label27 = GUICtrlCreateLabel("Vie pour potions :", 16, 128, 86, 17)
	Global $CheckboxTakeShrines = GUICtrlCreateCheckbox("Prendre les sanctuaires", 168, 352, 137, 17)
	Global $Inputrepairafterxxgames = GUICtrlCreateInput("", 344, 216, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label28 = GUICtrlCreateLabel("Réparer après X parties :", 168, 224, 121, 17)
	Global $Label29 = GUICtrlCreateLabel("Temps max parties :", 168, 128, 98, 17)
	Global $Inputmaxgamelength = GUICtrlCreateInput("", 312, 120, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputattackRange = GUICtrlCreateInput("", 344, 152, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputgrabRange = GUICtrlCreateInput("", 344, 184, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label30 = GUICtrlCreateLabel("Attack Range :", 168, 160, 76, 17)
	Global $Label31 = GUICtrlCreateLabel("Grab Range :", 168, 192, 68, 17)
	Global $CheckboxMonsterTri = GUICtrlCreateCheckbox("tri des monstres", 16, 352, 97, 17)
	Global $CheckboxMonsterRefresh = GUICtrlCreateCheckbox("Rafraichir monstre", 16, 320, 121, 17)
	Global $CheckboxItemRefresh = GUICtrlCreateCheckbox("Rafraichir items", 16, 224, 97, 17)
	Global $CheckboxMonsterPriority = GUICtrlCreateCheckbox("Priorité monstre", 16, 256, 97, 17)
	Global $CheckboxInventoryCheck = GUICtrlCreateCheckbox("Check inventaire", 16, 288, 113, 17)
	Global $Inputattacktimeout = GUICtrlCreateInput("", 106, 152, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Inputgrabtimeout = GUICtrlCreateInput("", 106, 184, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $CheckboxGestionaffixe = GUICtrlCreateCheckbox("Gestion des affixes", 168, 256, 153, 17)
	Global $CheckboxGestionaffixeloot = GUICtrlCreateCheckbox("Gestion des affixe de loot", 168, 288, 169, 17)
	Global $InputBanAffixList = GUICtrlCreateInput("", 240, 88, 137, 21)
	Global $Label32 = GUICtrlCreateLabel("Attack Timeout :", 16, 160, 82, 17)
	Global $Label33 = GUICtrlCreateLabel("Grabtimeout :", 16, 192, 67, 17)
	Global $Label34 = GUICtrlCreateLabel("Bannir Affixe :", 168, 96, 69, 17)
	Global $CheckboxGestaffixeByClass = GUICtrlCreateCheckbox("Gestion des affixes par classe", 168, 320, 193, 17)
	Global $CheckboxUsePath = GUICtrlCreateCheckbox("UsePath", 536, 64, 97, 17)
	Global $CheckboxResActivated = GUICtrlCreateCheckbox("Res Activé", 536, 96, 97, 17)
	Global $InputResLife = GUICtrlCreateInput("", 592, 120, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label35 = GUICtrlCreateLabel("Nb res :", 536, 128, 41, 17)
	Global $InputLifeArcane = GUICtrlCreateInput("", 478, 55, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label36 = GUICtrlCreateLabel("Life_Arcane :", 400, 64, 67, 17)
	Global $InputLifeProj = GUICtrlCreateInput("", 478, 85, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifePeste = GUICtrlCreateInput("", 478, 115, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label37 = GUICtrlCreateLabel("Life_Proj :", 400, 94, 51, 17)
	Global $Label38 = GUICtrlCreateLabel("Life_Peste :", 400, 123, 60, 17)
	Global $InputLifeProfa = GUICtrlCreateInput("", 478, 144, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeIce = GUICtrlCreateInput("", 478, 173, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifePoison = GUICtrlCreateInput("", 478, 203, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeLave = GUICtrlCreateInput("", 478, 262, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeArm = GUICtrlCreateInput("", 478, 320, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeExplo = GUICtrlCreateInput("", 478, 233, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeMine = GUICtrlCreateInput("", 478, 291, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeSpore = GUICtrlCreateInput("", 478, 349, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label39 = GUICtrlCreateLabel("Life_Profa :", 400, 152, 58, 17)
	Global $Label40 = GUICtrlCreateLabel("Life_Ice :", 400, 181, 48, 17)
	Global $Label41 = GUICtrlCreateLabel("Life_Poison :", 400, 210, 65, 17)
	Global $Label42 = GUICtrlCreateLabel("Life_Explo :", 401, 240, 59, 17)
	Global $Label43 = GUICtrlCreateLabel("Life_Lave :", 401, 270, 57, 17)
	Global $Label44 = GUICtrlCreateLabel("Life_Mine :", 401, 298, 56, 17)
	Global $Label45 = GUICtrlCreateLabel("Life_Arm :", 401, 327, 51, 17)
	Global $Label46 = GUICtrlCreateLabel("Life_Spore :", 401, 356, 61, 17)
	Global $Label1 = GUICtrlCreateLabel("Potion achetée :", 16, 96, 82, 17)
	Global $InputNbPotionBuy = GUICtrlCreateInput("", 107, 88, 41, 21)

	;;Onglet Séquences
	Global $TabSequences = GUICtrlCreateTabItem("Séquences")
	Global $Label47 = GUICtrlCreateLabel("Sequence Act1 :", 18, 51, 84, 17)
	Global $InputSequenceAct1 = GUICtrlCreateInput("", 122, 43, 481, 21)
	Global $Label48 = GUICtrlCreateLabel("Sequence Act2 :", 18, 83, 84, 17)
	Global $InputSequenceAct2 = GUICtrlCreateInput("", 122, 75, 481, 21)
	Global $Label49 = GUICtrlCreateLabel("Sequence Act3 PtSauve :", 20, 114, 128, 17)
	Global $InputSequenceAct3Pt = GUICtrlCreateInput("", 148, 106, 457, 21)
	Global $InputSequenceAct3 = GUICtrlCreateInput("", 124, 138, 481, 21)
	Global $Label50 = GUICtrlCreateLabel("Sequence Act3 :", 20, 146, 84, 17)
	Global $Label51 = GUICtrlCreateLabel("Sequence Act333 :", 17, 180, 96, 17)
	Global $Label52 = GUICtrlCreateLabel("Sequence Act362 :", 17, 212, 96, 17)
	Global $Label53 = GUICtrlCreateLabel("Sequence Act373 :", 17, 244, 96, 17)
	Global $InputSequenceAct333 = GUICtrlCreateInput("", 123, 172, 481, 21)
	Global $InputSequenceAct362 = GUICtrlCreateInput("", 123, 204, 481, 21)
	Global $InputSequenceAct373 = GUICtrlCreateInput("", 123, 236, 481, 21)
	Global $ButtonResetAct1 = GUICtrlCreateButton("Reset", 608, 40, 35, 25)
	Global $ButtonResetAct2 = GUICtrlCreateButton("Reset", 608, 72, 35, 25)
	Global $ButtonResetAct3PT = GUICtrlCreateButton("Reset", 608, 104, 35, 25)
	Global $ButtonResetAct3 = GUICtrlCreateButton("Reset", 608, 136, 35, 25)
	Global $ButtonResetAct333 = GUICtrlCreateButton("Reset", 608, 168, 35, 25)
	Global $ButtonResetAct362 = GUICtrlCreateButton("Reset", 608, 200, 35, 25)
	Global $ButtonResetAct373 = GUICtrlCreateButton("Reset", 608, 232, 35, 25)

	;;Onglet Touche, Prébuffs et souris
	Global $TabPrebuffs = GUICtrlCreateTabItem("Prebuffs - Spells")
	Global $Group_Touches = GUICtrlCreateGroup("Touches", 152, 36, 369, 57)
	Global $Label76 = GUICtrlCreateLabel("Key1 :", 168, 60, 34, 17)
	Global $Inputkey1 = GUICtrlCreateInput("", 208, 52, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label77 = GUICtrlCreateLabel("Key2 :", 256, 61, 34, 17)
	Global $Inputkey2 = GUICtrlCreateInput("", 296, 53, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label78 = GUICtrlCreateLabel("Key3 :", 344, 62, 34, 17)
	Global $Inputkey3 = GUICtrlCreateInput("", 384, 54, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label79 = GUICtrlCreateLabel("Key4 :", 432, 63, 34, 17)
	Global $Inputkey4 = GUICtrlCreateInput("", 472, 55, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group_Prebuffs = GUICtrlCreateGroup("Prebuffs", 56, 256, 553, 121)
	Global $CheckboxPreBuff1 = GUICtrlCreateCheckbox("Prebuff1", 72, 280, 65, 17)
	Global $Label74 = GUICtrlCreateLabel("Touche :", 72, 312, 47, 17)
	Global $InputToucheBuff1 = GUICtrlCreateInput("", 136, 304, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputdelaiBuff1 = GUICtrlCreateInput("", 136, 336, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label75 = GUICtrlCreateLabel("Délai Buff :", 72, 344, 56, 17)
	Global $CheckboxPreBuff2 = GUICtrlCreateCheckbox("Prebuff2", 208, 280, 65, 17)
	Global $CheckboxPreBuff3 = GUICtrlCreateCheckbox("Prebuff3", 344, 280, 73, 17)
	Global $CheckboxPreBuff4 = GUICtrlCreateCheckbox("Prebuff4", 480, 280, 65, 17)
	Global $Label80 = GUICtrlCreateLabel("Touche :", 208, 312, 47, 17)
	Global $Label81 = GUICtrlCreateLabel("Délai Buff :", 208, 344, 56, 17)
	Global $Label82 = GUICtrlCreateLabel("Touche :", 344, 312, 47, 17)
	Global $Label83 = GUICtrlCreateLabel("Délai Buff :", 344, 344, 56, 17)
	Global $Label84 = GUICtrlCreateLabel("Touche :", 480, 312, 47, 17)
	Global $Label85 = GUICtrlCreateLabel("Délai Buff :", 480, 344, 56, 17)
	Global $InputToucheBuff2 = GUICtrlCreateInput("", 272, 304, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputdelaiBuff2 = GUICtrlCreateInput("", 272, 336, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputToucheBuff3 = GUICtrlCreateInput("", 408, 304, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputdelaiBuff3 = GUICtrlCreateInput("", 408, 336, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputToucheBuff4 = GUICtrlCreateInput("", 544, 304, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputdelaiBuff4 = GUICtrlCreateInput("", 544, 336, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group5 = GUICtrlCreateGroup("Spells principaux", 72, 96, 521, 153)
	Global $CheckboxSpellOnLeft = GUICtrlCreateCheckbox("Souris gauche", 88, 120, 97, 17)
	Global $CheckboxSpellOnRight = GUICtrlCreateCheckbox("Souris droite", 88, 184, 97, 17)
	Global $Label86 = GUICtrlCreateLabel("Délai :", 192, 120, 34, 17)
	Global $InputSpellDelayLeft = GUICtrlCreateInput("", 280, 112, 57, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellTypeLeft = GUICtrlCreateInput("", 448, 112, 121, 21)
	Global $Label87 = GUICtrlCreateLabel("Type :", 360, 120, 34, 17)
	Global $Label88 = GUICtrlCreateLabel("Energie nécessaire :", 88, 152, 100, 17)
	Global $InputSpellEnergyNeedsLeft = GUICtrlCreateInput("", 216, 144, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label89 = GUICtrlCreateLabel("Vie :", 280, 152, 25, 17)
	Global $InputSpellLifeLeft = GUICtrlCreateInput("", 360, 144, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label90 = GUICtrlCreateLabel("Distance :", 424, 152, 52, 17)
	Global $InputSpellDistanceLeft = GUICtrlCreateInput("", 528, 144, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label91 = GUICtrlCreateLabel("Délai :", 192, 184, 34, 17)
	Global $Label92 = GUICtrlCreateLabel("Type :", 360, 184, 34, 17)
	Global $InputSpellDelayRight = GUICtrlCreateInput("", 280, 176, 57, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellTypeRight = GUICtrlCreateInput("", 448, 176, 121, 21)
	Global $Label93 = GUICtrlCreateLabel("Energie nécessaire :", 88, 216, 100, 17)
	Global $InputSpellEnergyNeedsRight = GUICtrlCreateInput("", 216, 208, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label94 = GUICtrlCreateLabel("Vie :", 280, 216, 25, 17)
	Global $InputSpellLifeRight = GUICtrlCreateInput("", 360, 208, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label95 = GUICtrlCreateLabel("Distance :", 424, 216, 52, 17)
	Global $InputSpellDistanceRight = GUICtrlCreateInput("", 528, 208, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	;;Onglet Touche 1 à 4
	Global $TabSpells = GUICtrlCreateTabItem("Spells secondaires")
	Global $GroupTouche1 = GUICtrlCreateGroup("Touche 1", 24, 40, 473, 73)
	Global $CheckboxSpellOn1 = GUICtrlCreateCheckbox("Touche 1", 32, 58, 73, 17)
	Global $Label54 = GUICtrlCreateLabel("Délai :", 112, 58, 34, 17)
	Global $Label55 = GUICtrlCreateLabel("Energie nécessaire :", 32, 88, 100, 17)
	Global $InputSpellEnergyNeeds1 = GUICtrlCreateInput("", 144, 80, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellLife1 = GUICtrlCreateInput("", 272, 80, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDistance1 = GUICtrlCreateInput("", 432, 80, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDelay1 = GUICtrlCreateInput("", 184, 50, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label56 = GUICtrlCreateLabel("Type :", 256, 58, 34, 17)
	Global $inputSpellType1 = GUICtrlCreateInput("", 328, 50, 121, 21)
	Global $Label57 = GUICtrlCreateLabel("Vie :", 208, 88, 25, 17)
	Global $Label58 = GUICtrlCreateLabel("Distance :", 344, 88, 52, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $GroupTouche2 = GUICtrlCreateGroup("Touche 2", 24, 123, 473, 73)
	Global $CheckboxSpellOn2 = GUICtrlCreateCheckbox("Touche 2", 32, 141, 73, 17)
	Global $Label59 = GUICtrlCreateLabel("Délai :", 112, 141, 34, 17)
	Global $Label60 = GUICtrlCreateLabel("Energie nécessaire :", 32, 171, 100, 17)
	Global $InputSpellEnergyNeeds2 = GUICtrlCreateInput("", 144, 163, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellLife2 = GUICtrlCreateInput("", 272, 163, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDistance2 = GUICtrlCreateInput("", 432, 163, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDelay2 = GUICtrlCreateInput("", 184, 133, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label61 = GUICtrlCreateLabel("Type :", 256, 141, 34, 17)
	Global $InputSpellType2 = GUICtrlCreateInput("", 328, 133, 121, 21)
	Global $Label62 = GUICtrlCreateLabel("Vie :", 208, 171, 25, 17)
	Global $Label63 = GUICtrlCreateLabel("Distance :", 344, 171, 52, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $GroupTouche3 = GUICtrlCreateGroup("Touche 3", 24, 207, 473, 73)
	Global $CheckboxSpellOn3 = GUICtrlCreateCheckbox("Touche 3", 32, 225, 73, 17)
	Global $Label64 = GUICtrlCreateLabel("Délai :", 112, 225, 34, 17)
	Global $Label65 = GUICtrlCreateLabel("Energie nécessaire :", 32, 255, 100, 17)
	Global $InputSpellEnergyNeeds3 = GUICtrlCreateInput("", 144, 247, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellLife3 = GUICtrlCreateInput("", 272, 247, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDistance3 = GUICtrlCreateInput("", 432, 247, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDelay3 = GUICtrlCreateInput("", 184, 217, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label66 = GUICtrlCreateLabel("Type :", 256, 225, 34, 17)
	Global $InputSpellType3 = GUICtrlCreateInput("", 328, 217, 121, 21)
	Global $Label67 = GUICtrlCreateLabel("Vie :", 208, 255, 25, 17)
	Global $Label68 = GUICtrlCreateLabel("Distance :", 344, 255, 52, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $GroupTouche4 = GUICtrlCreateGroup("Touche 4", 24, 292, 473, 73)
	Global $CheckboxSpellOn4 = GUICtrlCreateCheckbox("Touche 4", 32, 310, 73, 17)
	Global $Label69 = GUICtrlCreateLabel("Délai :", 112, 310, 34, 17)
	Global $Label70 = GUICtrlCreateLabel("Energie nécessaire :", 32, 340, 100, 17)
	Global $InputSpellEnergyNeeds4 = GUICtrlCreateInput("", 144, 332, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellLife4 = GUICtrlCreateInput("", 272, 332, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDistance4 = GUICtrlCreateInput("", 432, 332, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputSpellDelay4 = GUICtrlCreateInput("", 184, 302, 49, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label71 = GUICtrlCreateLabel("Type :", 256, 310, 34, 17)
	Global $InputSpellType4 = GUICtrlCreateInput("", 328, 302, 121, 21)
	Global $Label72 = GUICtrlCreateLabel("Vie :", 208, 340, 25, 17)
	Global $Label73 = GUICtrlCreateLabel("Distance :", 344, 340, 52, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateTabItem("")
	Global $ButtonEnregistrer = GUICtrlCreateButton("Enregistrer les modifications", 496, 392, 163, 25)
	Global $ButtonAnnuler = GUICtrlCreateButton("Annuler", 416, 392, 75, 25)
	Global $ButtonParDefaut = GUICtrlCreateButton("Par défaut", 320, 392, 91, 25)
	GUISetState(@SW_SHOW)


	RemplirSettings()
	EtatGriser()

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Main)
				ExitLoop
			Case $ButtonAnnuler
				GUIDelete($Main)
				ExitLoop

			Case $CheckboxPause
				If GUICtrlRead($CheckboxPause) = $GUI_CHECKED Then
					GUICtrlSetState($InputApresXparties, $GUI_ENABLE)
					GUICtrlSetState($InputTempsPause, $GUI_ENABLE)
					GUICtrlSetState($CheckboxPauseRepas, $GUI_ENABLE)
					AjoutLog("On dégrise la pause")
				Else
					GUICtrlSetState($InputApresXparties, $GUI_DISABLE)
					GUICtrlSetState($InputTempsPause, $GUI_DISABLE)
					GUICtrlSetState($CheckboxPauseRepas, $GUI_DISABLE)
					GUICtrlSetState($CheckboxPauseRepas, $GUI_UNCHECKED)
					AjoutLog("On grise la pause")
				EndIf
			Case $CheckboxRecycler
				If GUICtrlRead($CheckboxRecycler) = $GUI_CHECKED Then
					GUICtrlSetState($InputQualit, $GUI_ENABLE)
					AjoutLog("On dégrise le recyclage")
				Else
					GUICtrlSetState($InputQualit, $GUI_DISABLE)
					AjoutLog("On grise le recyclage")
				EndIf
			Case $ComboChoixRun
				If GUICtrlRead($ComboChoixRun) = "Acte Aléatoire (Act1,Act2,Act3)" Then
					GUICtrlSetState($CheckboxSequencesAlea, $GUI_ENABLE)
					GUICtrlSetState($InputChangementAct, $GUI_ENABLE)
					GUICtrlSetState($InputChangementRun, $GUI_ENABLE)
					GUICtrlSetState($InputAct1min, $GUI_ENABLE)
					GUICtrlSetState($InputAct1max, $GUI_ENABLE)
					GUICtrlSetState($InputAct2min, $GUI_ENABLE)
					GUICtrlSetState($InputAct2max, $GUI_ENABLE)
					GUICtrlSetState($InputAct3min, $GUI_ENABLE)
					GUICtrlSetState($InputAct3max, $GUI_ENABLE)
					AjoutLog("On dégrise les séquences aléatoires")
				Else
					GUICtrlSetState($CheckboxSequencesAlea, $GUI_DISABLE)
					GUICtrlSetState($CheckboxSequencesAlea, $GUI_UNCHECKED)
					GUICtrlSetState($InputChangementAct, $GUI_DISABLE)
					GUICtrlSetState($InputChangementRun, $GUI_DISABLE)
					GUICtrlSetState($InputAct1min, $GUI_DISABLE)
					GUICtrlSetState($InputAct1max, $GUI_DISABLE)
					GUICtrlSetState($InputAct2min, $GUI_DISABLE)
					GUICtrlSetState($InputAct2max, $GUI_DISABLE)
					GUICtrlSetState($InputAct3min, $GUI_DISABLE)
					GUICtrlSetState($InputAct3max, $GUI_DISABLE)
					AjoutLog("On grise les séquences aléatoires")
				EndIf

			Case $ButtonParDefaut
				ValeurDefaut()
				RemplirSettings()
				MsgBox( 0, "", "Valeurs par défaut chargées !", 3)

			Case $ButtonEnregistrer
				RecupDonneesSettings()
				EnregistProfil($ProfilSel)
				GUIDelete($Main)
				MsgBox( 0, "", "Profil modifié !", 3)
				ExitLoop

			Case $ButtonResetAct1
				$SequenceFileAct1 = "act1-manoir_[1-8]|act1-Val_[1-8]|act1-putride_[1-6]|act1-champs_[1-8]"
				GUICtrlSetData($InputSequenceAct1,$SequenceFileAct1)

			Case $ButtonResetAct2
				$SequenceFileAct2 = "act2-alcarnus_[1-8]|act2-gorge_noire_[1-6]|act2-dalgur_[1-2]"
				GUICtrlSetData($InputSequenceAct2,$SequenceFileAct2)

			Case $ButtonResetAct3
				$SequenceFileAct3 = "[CMD]safeportstart()|act3_core_start_[1-5]|act3_tower_[1-5]|act3_field_[1-2]|[CMD]TakeWP=0,0,3,4"
				GUICtrlSetData($InputSequenceAct3,$SequenceFileAct3)

			Case $ButtonResetAct3PT
				$SequenceFileAct3PtSauve = "act3_pt_save_le_coeur_darreat_[1-5]|act3_tower_[1-5]|act3_field_[1-2]|[CMD]TakeWP=0,0,3,4"
				GUICtrlSetData($InputSequenceAct3Pt,$SequenceFileAct3PtSauve)

			Case $ButtonResetAct333
				$SequenceFileAct333 = "act3_rempart_[1-2]|act3_tuer_Ghom"
				GUICtrlSetData($InputSequenceAct333,$SequenceFileAct333)

			Case $ButtonResetAct362
				$SequenceFileAct362 = "act3_rempart_[1-2]|act3_field_[1-2]|act3-Tuer_Siegebreaker"
				GUICtrlSetData($InputSequenceAct362,$SequenceFileAct362)

			Case $ButtonResetAct373
				$SequenceFileAct373 = "act3_tower_[1-5]|act3_field_[1-2]|act3-Tuer_Azmodan"
				GUICtrlSetData($InputSequenceAct373,$SequenceFileAct373)

		EndSwitch
	WEnd
EndFunc;==>EditSettings

Func CreerProfil()
	Global $CreationProfil = GUICreate("Créer un profil",262,117,-1,-1,-1,$WS_EX_TOPMOST,$MainForm)
	GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
	Global $CreerProfil = GUICtrlCreateButton("Créer",170,85,82,25,-1,-1)
	Global $AnnulerProfil = GUICtrlCreateButton("Annuler",80,85,82,24,-1,-1)
	GUICtrlCreateLabel("Nom du profil :",15,10,74,15,-1,-1)
	GUICtrlSetBkColor(-1,"-2")
	Global $InputProfil = GUICtrlCreateInput("",100,5,150,20,-1,512)
	Global $InputNomPerso = GUICtrlCreateInput("",100,30,150,20,-1,512)
	Global $InputBuild = GUICtrlCreateInput("",100,55,150,20,-1,512)
	GUICtrlCreateLabel("Personnage :",15,35,76,15,-1,-1)
	GUICtrlSetBkColor(-1,"-2")
	GUICtrlCreateLabel("Build :",15,60,74,15,-1,-1)
	GUICtrlSetBkColor(-1,"-2")
	GUISetState(@SW_SHOW,$CreationProfil)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($CreationProfil)
				ExitLoop
			Case $AnnulerProfil
				GUIDelete($CreationProfil)
				ExitLoop
			Case $CreerProfil
				;If Not(GUICtrlRead($InputProfil) = "") Then
					CreationProfil($DossierProfils)
					GUIDelete($CreationProfil)
					ExitLoop
				;EndIf
		EndSwitch
	WEnd
EndFunc;==>CreerProfil