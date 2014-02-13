; -- Created with ISN Form Studio 2 for ISN AutoIt Studio -- ;

#NoTrayIcon

Global $MainForm = GUICreate("Settings Arreat Core",617,306,-1,-1,-1,-1)
GUISetIcon(@ScriptDir & "\lib\ico\icon.ico")
;;Menu
$OptionsMenu = GUICtrlCreateMenu("Options")
$LogsMenu = GUICtrlCreateMenuItem("Afficher les logs", $OptionsMenu)
$StatsMenu = GUICtrlCreateMenuItem("Afficher les stats", $OptionsMenu)
$GrablistsMenu = GUICtrlCreateMenuItem("Afficher les grablists", $OptionsMenu)
$BuildsMenu = GUICtrlCreateMenuItem("Afficher les builds", $OptionsMenu)
GUICtrlCreateMenuitem("", $OptionsMenu)
$EnreD3PrefsMenu = GUICtrlCreateMenuItem("Enregistrer le D3Prefs.txt", $OptionsMenu)
$CpuGpuItem = GUICtrlCreateMenuItem("Cpu/gpu pour Bot", $OptionsMenu)
GUICtrlCreateMenuitem("", $OptionsMenu)
$DevmodeItem = GUICtrlCreateMenuItem("Devmode", $OptionsMenu)
$HelpMenu = GUICtrlCreateMenu("?")
$InfoItem = GUICtrlCreateMenuItem("Aide", $HelpMenu)
$AproposItem = GUICtrlCreateMenuItem("A propos", $HelpMenu)
;;Fin Menu
GUICtrlCreateGroup("Profils",5,5,441,272,-1,-1)
GUICtrlSetBkColor(-1,"0xF0F0F0")
Global $AddProfil = GUICtrlCreateButton("Ajouter Profil",10,250,100,22,-1,-1)
Global $EditProfil = GUICtrlCreateButton("Editer Profil",110,250,100,22,-1,-1)
Global $DeleteProfil = GUICtrlCreateButton("Effacer Profil",210,250,100,22,-1,-1)
Global $ChargerProfil = GUICtrlCreateButton("Charger Profil",340,250,100,22,-1,-1)
Global $ListviewProfils = GUICtrlCreatelistview("",10,20,430,225,-1,512)
Global $ImageLogo = GUICtrlCreatePic(@ScriptDir & "\lib\images\logo.jpg",455,10,156,156,-1,-1)

_GUICtrlListView_InsertColumn($ListviewProfils, 0, "Profil", 100)
_GUICtrlListView_InsertColumn($ListviewProfils, 1, "Nom du perso", 100)
_GUICtrlListView_InsertColumn($ListviewProfils, 2, "Build", 226)


Func Builds()

	Global $Builds = GUICreate("Builds",377,302,-1,-1,-1,$WS_EX_TOPMOST)
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

	AjoutLog("Ouverture de la fenêtre Builds")
	ListFichier($DossierBuilds,2) ; on list les builds
	ListFichier($DossierProfils,3) ; On list les profils

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg

			Case $GUI_EVENT_CLOSE
				GUIDelete($Builds)
				AjoutLog("Fermeture de la fenêtre Builds")
				ExitLoop

			Case $ButtonBuildsFermer
				GUIDelete($Builds)
				AjoutLog("Fermeture de la fenêtre Builds")
				ExitLoop

			Case $ButtonBuildsCharger
				$BuildSel = $DossierBuilds & GUICtrlRead($ListBuilds)
				$ProfilBuildSel = $DossierProfilsSettings & "settingshero_" & GUICtrlRead($ListsBuildsProfils)
				FileCopy($BuildSel, $ProfilBuildSel, 9)
				AjoutLog("Chargement du build : " & $BuildSel & "dans le profil : " & $ProfilBuildSel)

			Case $ButtonBuildsSupprimer
				$SuppBuild = GUICtrlRead($ListBuilds)
				If $SuppBuild = "" Then
					MsgBox( 48 + 262144, "", "Aucun build sélectionné !!", 3)
				Else
					FileDelete($DossierBuilds & $SuppBuild)
					AjoutLog("Suppression du build : " & $SuppBuild)
					ListFichier($DossierBuilds,2)
				EndIf

			Case $ButtonBuildsImporter
				Local Const $sMessage = "Sélectionner le build à importer."
				Local $sFile = FileOpenDialog($sMessage, @WindowsDir & "\", "Settings (*.ini;)")
				If @error Then
					MsgBox( 48 + 262144, "", "Aucun fichier sélectionné !!", 3)
				Else
					$fName = StringRegExpReplace($sFile, "^.*\\", "")
					FileCopy($sFile, $DossierBuilds & $fName)
					AjoutLog("Importation Build : " & $fName)
					ListFichier($DossierBuilds,2)
				EndIf
		EndSwitch
	WEnd
EndFunc;==>Builds

Func CreerBuild()

	Global $CreerBuild = GUICreate("Nom du build",260,80,-1,-1,-1,$WS_EX_TOPMOST)
	GUICtrlCreateLabel("Nom du build :",15,15,74,15,-1,-1)
	GUICtrlSetBkColor(-1,"-2")
	Global $InputCreerBuild = GUICtrlCreateInput("",95,10,150,20,-1,512)
	Global $ButtonCreerBuild = GUICtrlCreateButton("Créer",145,40,100,30,-1,-1)
	Global $ButtonAnnulerCreerBuild = GUICtrlCreateButton("Annuler",15,40,100,30,-1,-1)
	GUISetState(@SW_SHOW,$CreerBuild)

	AjoutLog("Ouverture de la fenêtre 'Créer un build'")

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($CreerBuild)
				AjoutLog("Fermeture de la fenêtre 'Créer un build'")
				ExitLoop

			Case $ButtonCreerBuild
				$NomBuild = GUICtrlRead($InputCreerBuild) & ".ini"
				If FileExists($DossierBuilds & $NomBuild) Then
					MsgBox( 48 + 262144, "", "Build déjà éxistant", 3)
					ContinueLoop
				Else
					FileCopy($FichierSettingsHeroDefaut, $DossierBuilds & $NomBuild)
					AjoutLog("Création d'un nouveau build :" & $NomBuild)
				EndIf
				GUIDelete($CreerBuild)
				AjoutLog("Fermeture de la fenêtre 'Créer un build'")
				ExitLoop

			Case $ButtonAnnulerCreerBuild
				GUIDelete($CreerBuild)
				AjoutLog("Annulation de la création d'un build")
				ExitLoop

		EndSwitch
	WEnd

EndFunc;==>CreerBuild

Func Logs()

 	Global $MainLogs = GUICreate("Logs",536,535,-1,-1,-1,-1)
	GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
	Global $EditLogs = GUICtrlCreateEdit("",5,5,525,495,3145728,-1)
	Global $ButtonExporterLogs = GUICtrlCreateButton("Exporter",430,505,100,25,-1,-1)
	Global $ButtonEffacerLogs = GUICtrlCreateButton("Effacer",220,505,100,25,-1,-1)
	Global $ButtonFermerLogs = GUICtrlCreateButton("Fermer",325,505,100,25,-1,-1)
	GUISetState(@SW_SHOW,$MainLogs)

	AjoutLog("Ouverture de la fenêtre Logs")
	GUICtrlSetData($EditLogs,$Logs)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($MainLogs)
				AjoutLog("Fermeture de la fenêtre Logs")
				ExitLoop

			Case $ButtonFermerLogs
				GUIDelete($MainLogs)
				AjoutLog("Fermeture de la fenêtre Logs")
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
	Global $ButtonFermerGrablist = GUICtrlCreateButton("Fermer",415,10,83,25,-1,-1)
	GUISetState(@SW_SHOW,$Grablist)

	AjoutLog("Ouverture de la fenêtre Grablist")

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Grablist)
				AjoutLog("Fermeture de la fenêtre Grablist")
				ExitLoop

			Case $ButtonFermerGrablist
				GUIDelete($Grablist)
				AjoutLog("Fermeture de la fenêtre Grablist")
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

	AjoutLog("Ouverture de la fenêtre Stats")
	if FileExists($DossierStats) = 0 Then DirCreate($DossierStats)

	ListFichier($DossierStats,1)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Stats)
				AjoutLog("Fermeture de la fenêtre Stats")
				ExitLoop

			Case $ButtonFermerStats
				GUIDelete($Stats)
				AjoutLog("Fermeture de la fenêtre Stats")
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

	Global $Main = GUICreate("Edition de profils", 666, 426, -1, -1, -1, $WS_EX_TOPMOST)
	GUISetIcon(@scriptdir & "\lib\ico\icon.ico", -1)
	Global $Tab1 = GUICtrlCreateTab(8, 8, 649, 377)

	;;Onglet Settings.ini
	Global $TabSettingsIni = GUICtrlCreateTabItem("Settings")
	GUICtrlSetState(-1,$GUI_SHOW)
	Global $InputPassD3 = GUICtrlCreateInput("", 363, 37, 121, 21)
	Global $Label2 = GUICtrlCreateLabel("Pass D3 :", 296, 45, 50, 17)
	Global $RadioBotSeul = GUICtrlCreateRadio("Bot Seul", 496, 42, 65, 17)
	Global $RadioBotTeam = GUICtrlCreateRadio("Bot en Team", 561, 42, 89, 17)
	Global $ComboTypeBot = GUICtrlCreateCombo("", 456, 80, 97, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$WS_BORDER))
	GUICtrlSetData(-1, "Semi-Manuel|Auto|Manuel")
	Global $Label5 = GUICtrlCreateLabel("Type de Bot :", 344, 87, 67, 17)
	Global $GroupPause = GUICtrlCreateGroup("Pauses :", 16, 66, 153, 113)
	Global $CheckboxPause = GUICtrlCreateCheckbox("Pause", 24, 82, 65, 17)
	Global $Label11 = GUICtrlCreateLabel("Après X Parties :", 24, 106, 81, 17)
	Global $Label12 = GUICtrlCreateLabel("Temps de Pause :", 24, 130, 90, 17)
	Global $CheckboxPauseRepas = GUICtrlCreateCheckbox("Pause Repas", 24, 154, 97, 17)
	Global $InputApresXparties = GUICtrlCreateInput("", 120, 98, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputTempsPause = GUICtrlCreateInput("", 120, 122, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlSetTip(-1,"Temps de pause en seconde ==> 6 min x 60 s = 360 s")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $GroupRecycler = GUICtrlCreateGroup("Recyclage :", 176, 66, 153, 113)
	Global $CheckboxRecycler = GUICtrlCreateCheckbox("Recycler", 184, 82, 73, 17)
	Global $Label13 = GUICtrlCreateLabel("Qualité Recyclée :", 184, 106, 86, 17)
	Global $CheckboxFiltreID = GUICtrlCreateCheckbox("Filtre Objet Identifié", 184, 130, 137, 17)
	Global $CheckboxFiltreNoID = GUICtrlCreateCheckbox("Filtre Objet Non Identifié", 184, 154, 137, 17)
	Global $InputQualit = GUICtrlCreateInput("", 280, 98, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $GroupRun = GUICtrlCreateGroup("Choix du run :", 16, 186, 313, 129)
	Global $CheckboxSequencesAlea = GUICtrlCreateCheckbox("Séquences Aléatoires", 24, 234, 121, 17)
	Global $Label14 = GUICtrlCreateLabel("Run :", 24, 210, 30, 17)
	Global $ComboChoixRun = GUICtrlCreateCombo("", 56, 202, 265, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL,$WS_BORDER))
	GUICtrlSetData(-1, "Acte Aléatoire (Act1,Act2,Act3)|Séquence par défaut/Test/etc|Act 1|Act 2|Act 3|Act 3 quête 3 sous quête 3 --> Tuer Ghom|Act 3 quête 6 sous quête 2 --> Tuer le Briseur de Siège|Act 3 quête 7 sous quête 3 --> Terrasser Asmodan")
	Global $Label15 = GUICtrlCreateLabel("Changement Acte :", 24, 266, 94, 17)
	Global $Label16 = GUICtrlCreateLabel("Changement Run :", 24, 290, 94, 17)
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
	Global $Label9 = GUICtrlCreateLabel("Type de Grablist :", 344, 184, 85, 17)
	Global $InputQualiteItems = GUICtrlCreateInput("", 592, 208, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label10 = GUICtrlCreateLabel("Qualité Objet :", 512, 216, 70, 17)
	Global $Label20 = GUICtrlCreateLabel("Liste Monstres Spéciaux :", 16, 360, 125, 17)
	Global $Label21 = GUICtrlCreateLabel("Liste Monstres :", 16, 336, 150, 17)
	Global $InputSpecialmonterList = GUICtrlCreateInput("", 140, 352, 500, 21)
	Global $InputMonsterList = GUICtrlCreateInput("", 140, 328, 500, 21)
	Global $Label22 = GUICtrlCreateLabel("Act1 Hero Axe Z :", 344, 216, 89, 17)
	Global $Label23 = GUICtrlCreateLabel("Act2 Hero Axe Z :", 344, 248, 89, 17)
	Global $Label24 = GUICtrlCreateLabel("Act3 Hero Axe Z :", 344, 280, 89, 17)
	Global $InputAct1HAZ = GUICtrlCreateInput("", 456, 208, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct2HAZ = GUICtrlCreateInput("", 456, 240, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputAct3HAZ = GUICtrlCreateInput("", 456, 272, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputHAZ = GUICtrlCreateInput("", 592, 240, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label25 = GUICtrlCreateLabel("Hero Axe Z :", 512, 248, 64, 17)
	Global $Label6 = GUICtrlCreateLabel("Profil :", 16, 42, 32, 17)
	Global $LabelSettingsProfil = GUICtrlCreateLabel("test", 56, 42, 237, 17)

	;;Onglet settingsHero.ini
	Global $TabHeroIni = GUICtrlCreateTabItem("Héros")
	Global $CheckboxUsePath = GUICtrlCreateCheckbox("UsePath", 536, 216, 97, 17)
	Global $Group1 = GUICtrlCreateGroup("Pause HC", 528, 128, 121, 81)
	Global $CheckboxSecuHC = GUICtrlCreateCheckbox("Activée", 536, 152, 97, 17)
	GUICtrlSetTip(-1,"Active de la sécurité pour le mode Hard Core")
	Global $Label26 = GUICtrlCreateLabel("Vie Mini :", 536, 184, 47, 17)
	Global $InputViemini = GUICtrlCreateInput("", 608, 176, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlSetTip(-1,"Spécifie la vie minimum pour activer la sécurité HC")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group2 = GUICtrlCreateGroup("Résurrection", 528, 40, 121, 81)
	Global $CheckboxResActivated = GUICtrlCreateCheckbox("Activée", 536, 64, 97, 17)
	Global $Label35 = GUICtrlCreateLabel("Nombre :", 536, 96, 47, 17)
	Global $InputResLife = GUICtrlCreateInput("", 608, 88, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group3 = GUICtrlCreateGroup("Affixes :", 184, 120, 193, 129)
	Global $CheckboxGestionaffixe = GUICtrlCreateCheckbox("Gestion des Affixes", 193, 145, 153, 17)
	Global $CheckboxGestionaffixeloot = GUICtrlCreateCheckbox("Gestion des Affixe de Loot", 193, 169, 169, 17)
	Global $CheckboxGestaffixeByClass = GUICtrlCreateCheckbox("Gestion des Affixes par Classe", 193, 194, 193, 17)
	Global $Label34 = GUICtrlCreateLabel("Bannir Affixe :", 193, 223, 69, 17)
	Global $InputBanAffixList = GUICtrlCreateInput("", 263, 216, 105, 21)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group4 = GUICtrlCreateGroup("Potions :", 16, 40, 361, 81)
	Global $Label3 = GUICtrlCreateLabel("Type :", 23, 63, 34, 17)
	Global $ComboPotions = GUICtrlCreateCombo("", 75, 59, 137, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "healthPotion_Minor|healthPotion_Lesser|healthPotion_Normal|healthPotion_Greater|HealthPotionLarge|healthPotion_Super|healthPotion_Heroic|healthPotion_Resplendent|healthPotion_Runic|healthPotion_Mythic")
	Global $Label4 = GUICtrlCreateLabel("Stock de Potions :", 225, 63, 91, 17)
	Global $InputPotionStock = GUICtrlCreateInput("", 327, 59, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label1 = GUICtrlCreateLabel("Potion achetée :", 23, 93, 82, 17)
	Global $InputNbPotionBuy = GUICtrlCreateInput("", 171, 88, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlSetTip(-1,"Spécifie le nombre de potions à acheter au début du run (0 = Désactivé)")
	Global $Label27 = GUICtrlCreateLabel("Vie pour Potions :", 226, 94, 87, 17)
	Global $InputLifeForPotion = GUICtrlCreateInput("", 327, 88, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group6 = GUICtrlCreateGroup("", 16, 120, 161, 137)
	Global $Label32 = GUICtrlCreateLabel("Tempo. Attaque :", 23, 145, 86, 17)
	Global $Inputattacktimeout = GUICtrlCreateInput("", 127, 137, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlSetTip(-1,"Temps avant de passer à une autre cible (en ms)")
	Global $Label33 = GUICtrlCreateLabel("Tempo. Collecte :", 23, 173, 87, 17)
	Global $Inputgrabtimeout = GUICtrlCreateInput("", 127, 167, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlSetTip(-1,"Temps avant de passer à un autre objet (en ms)")
	Global $Label30 = GUICtrlCreateLabel("Distance d'Attaque :", 24, 205, 100, 17)
	Global $InputattackRange = GUICtrlCreateInput("", 135, 197, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputgrabRange = GUICtrlCreateInput("", 135, 227, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label31 = GUICtrlCreateLabel("Distance de Collecte :", 23, 234, 108, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group7 = GUICtrlCreateGroup("", 184, 248, 193, 129)
	Global $CheckboxItemRefresh = GUICtrlCreateCheckbox("Vérif.si Objet", 191, 260, 81, 17)
	GUICtrlSetTip(-1,"Le bot vérifie s'il y a des objets au sol")
	Global $CheckboxMonsterRefresh = GUICtrlCreateCheckbox("Vérif. si Monstre", 191, 350, 97, 17)
	GUICtrlSetTip(-1,"Le bot vérifie s'il y a encore des monstres autour")
	Global $CheckboxInventoryCheck = GUICtrlCreateCheckbox("Vérif. Inventaire", 191, 284, 113, 17)
	GUICtrlSetTip(-1,"Vérifie l'inventaire au début du run")
	Global $CheckboxMonsterPriority = GUICtrlCreateCheckbox("Priorité aux Monstres", 191, 306, 121, 17)
	GUICtrlSetTip(-1,"Le bot tuera d'abord tous les monstres autour de lui, puis ramassera les objets au sol")
	Global $CheckboxMonsterTri = GUICtrlCreateCheckbox("Tri des Monstres", 191, 328, 97, 17)
	GUICtrlSetTip(-1,"Le bot attaquera les monstres proches en premier")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group8 = GUICtrlCreateGroup("", 16, 256, 161, 121)
	Global $Label29 = GUICtrlCreateLabel("Temps Max/Parties :", 23, 270, 102, 17)
	Global $Inputmaxgamelength = GUICtrlCreateInput("", 23, 292, 105, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	GUICtrlSetTip(-1,"Durée d'une partie (en ms) ==> 1800000 = 30 minutes / 1350000 = 22,5 minutes")
	Global $Label28 = GUICtrlCreateLabel("Rép. après X Parties :", 23, 325, 107, 17)
	Global $Inputrepairafterxxgames = GUICtrlCreateInput("", 137, 318, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $CheckboxTakeShrines = GUICtrlCreateCheckbox("Prendre les Sanctuaires", 23, 351, 137, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Group9 = GUICtrlCreateGroup("Affixes", 384, 40, 137, 337)
	Global $InputLifeArcane = GUICtrlCreateInput("", 480, 54, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label36 = GUICtrlCreateLabel("Arcane  (% vie) :", 391, 62, 81, 17)
	Global $Label37 = GUICtrlCreateLabel("Proj        (%vie) :", 391, 90, 80, 17)
	Global $InputLifeProj = GUICtrlCreateInput("", 480, 83, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label38 = GUICtrlCreateLabel("Peste    (% vie) :", 391, 119, 80, 17)
	Global $InputLifePeste = GUICtrlCreateInput("", 480, 112, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label43 = GUICtrlCreateLabel("Lave     (% vie) :", 391, 149, 80, 17)
	Global $InputLifeLave = GUICtrlCreateInput("", 480, 141, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label44 = GUICtrlCreateLabel("Mine      (% vie) :", 391, 179, 82, 17)
	Global $InputLifeMine = GUICtrlCreateInput("", 480, 171, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label45 = GUICtrlCreateLabel("Arm       (% vie) :", 391, 209, 80, 17)
	Global $InputLifeArm = GUICtrlCreateInput("", 480, 201, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label46 = GUICtrlCreateLabel("Spore    (% vie) :", 391, 237, 81, 17)
	Global $InputLifeSpore = GUICtrlCreateInput("", 480, 231, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeProfa = GUICtrlCreateInput("", 480, 261, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeIce = GUICtrlCreateInput("", 480, 291, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifePoison = GUICtrlCreateInput("", 480, 321, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $InputLifeExplo = GUICtrlCreateInput("", 480, 351, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
	Global $Label39 = GUICtrlCreateLabel("Profa    (% vie) :", 391, 267, 78, 17)
	Global $Label40 = GUICtrlCreateLabel("Glace   (% vie) :", 391, 297, 78, 17)
	Global $Label41 = GUICtrlCreateLabel("Poison  (% vie) :", 391, 327, 79, 17)
	Global $Label42 = GUICtrlCreateLabel("Explo    (% vie) :", 391, 357, 79, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

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
	Global $ButtonCreerBuild = GUICtrlCreateButton("Créer un build", 8, 392, 99, 25)
	GUISetState(@SW_SHOW)

	AjoutLog("Ouverture de la fenêtre 'Edition de profil'")

	RemplirSettings()
	EtatGriser()

	$NPerso = IniRead($DossierProfils & $ProfilSel, "Info", "NomPerso", "")
	GUICtrlSetData($LabelSettingsProfil,$ProfilSel & "  -- Pseudo : " & $NPerso)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg

			Case $GUI_EVENT_CLOSE
				GUIDelete($Main)
				AjoutLog("Fermeture de la fenêtre 'Edition de profil'")
				ExitLoop

			Case $ButtonAnnuler
				GUIDelete($Main)
				AjoutLog("Fermeture de la fenêtre 'Edition de profil'")
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
				AjoutLog("Fermeture de la fenêtre 'Edition de profil'")
				MsgBox( 0, "", "Profil modifié !", 3)
				ExitLoop

			Case $ButtonCreerBuild

				CreerBuild()

			Case $ButtonResetAct1

				$SequenceFileAct1 = "act1-manoir_[1-8]|act1-Val_[1-8]|act1-putride_[1-6]|act1-champs_[1-8]"
				GUICtrlSetData($InputSequenceAct1,$SequenceFileAct1)
				AjoutLog("Séquence Act1 par défaut")

			Case $ButtonResetAct2

				$SequenceFileAct2 = "act2-alcarnus_[1-8]|act2-gorge_noire_[1-6]|act2-dalgur_[1-2]"
				GUICtrlSetData($InputSequenceAct2,$SequenceFileAct2)
				AjoutLog("Séquence Act2 par défaut")

			Case $ButtonResetAct3

				$SequenceFileAct3 = "[CMD]safeportstart()|act3_core_start_[1-5]|act3_tower_[1-5]|act3_field_[1-2]|[CMD]TakeWP=0,0,3,4"
				GUICtrlSetData($InputSequenceAct3,$SequenceFileAct3)
				AjoutLog("Séquence Act3 par défaut")

			Case $ButtonResetAct3PT

				$SequenceFileAct3PtSauve = "act3_pt_save_le_coeur_darreat_[1-5]|act3_tower_[1-5]|act3_field_[1-2]|[CMD]TakeWP=0,0,3,4"
				GUICtrlSetData($InputSequenceAct3Pt,$SequenceFileAct3PtSauve)
				AjoutLog("Séquence Act3PT par défaut")

			Case $ButtonResetAct333

				$SequenceFileAct333 = "act3_rempart_[1-2]|act3_tuer_Ghom"
				GUICtrlSetData($InputSequenceAct333,$SequenceFileAct333)
				AjoutLog("Séquence Act333 par défaut")

			Case $ButtonResetAct362

				$SequenceFileAct362 = "act3_rempart_[1-2]|act3_field_[1-2]|act3-Tuer_Siegebreaker"
				GUICtrlSetData($InputSequenceAct362,$SequenceFileAct362)
				AjoutLog("Séquence Act362 par défaut")

			Case $ButtonResetAct373

				$SequenceFileAct373 = "act3_tower_[1-5]|act3_field_[1-2]|act3-Tuer_Azmodan"
				GUICtrlSetData($InputSequenceAct373,$SequenceFileAct373)
				AjoutLog("Séquence Act373 par défaut")

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

	AjoutLog("Ouverture de la fenêtre 'Créer un profil'")

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg

			Case $GUI_EVENT_CLOSE

				GUIDelete($CreationProfil)
				AjoutLog("Fermeture de la fenêtre 'Créer un profil'")
				ExitLoop

			Case $AnnulerProfil

				GUIDelete($CreationProfil)
				AjoutLog("Fermeture de la fenêtre 'Créer un profil'")
				ExitLoop

			Case $CreerProfil

				CreationProfil($DossierProfils)
				GUIDelete($CreationProfil)
				AjoutLog("Fermeture de la fenêtre 'Créer un profil'")
				ExitLoop

		EndSwitch
	WEnd
EndFunc;==>CreerProfil