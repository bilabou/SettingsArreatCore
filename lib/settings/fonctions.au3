;fonctions.au3

;;Création de dossiers
Func DossierAcreer()

	If FileExists($DossierProfils) = 0 then DirCreate($DossierProfils)
	If FileExists($DossierProfilsSettings) = 0 then DirCreate($DossierProfilsSettings)
	If FileExists($DossierBuilds) = 0 then DirCreate($DossierBuilds)
	If FileExists($DossierLogs) = 0 then DirCreate($DossierLogs)
	AjoutLog("Création des dossiers profils, builds et logs")

EndFunc;==>DossierAcreer

;;Fonction permettant de lister les profils
Func ListerProfils($CheminDuDossier)

	_GUICtrlListView_DeleteAllItems($ListviewProfils)
	Local $array = DirGetSize($CheminDuDossier, 1)
	Local $listeFichiers = _FileListToArray($CheminDuDossier,"*",1)

	If IsArray($array) Then
		If $array[1] > 0 Then
			For $i=1 to $listeFichiers[0]
				$NomPerso = IniRead($DossierProfils & $listeFichiers[$i], "Info", "NomPerso", "inconnu")
				$Build = IniRead($DossierProfils & $listeFichiers[$i], "Info", "Build", "inconnu")
				GUICtrlCreateListViewItem($listeFichiers[$i] & "|" & $NomPerso & "|" & $Build,$ListviewProfils)
			Next
			AjoutLog("Listage des profils")
		Else
			AjoutLog("Aucun profil")
		EndIf
	EndIf

EndFunc;==>ListerProfils

;;Fonction permettant de suprimer un profil
Func SupprimerProfil($CheminDuDossier)

	Local $selection = GUICtrlRead($ListviewProfils) ;On lit l'item sélectionné

	If $selection <> 0 Then ;On vérifie qu'il ait bien sélection
		Local $index = ControlListView("Settings Arreat Core", "", $ListviewProfils, "GetSelected")
		Local $ProfilSupp = ControlListView("Settings Arreat Core", "", $ListviewProfils, "GetText", $index)
		Local $Confirm = MsgBox( 20, "Suppression de " & $ProfilSupp, "Etes-vous sûr ?");ajout d'un prompt de confirmation de la suppression

		If $Confirm = 6 Then ;test la réponse du MsgBox
				FileDelete($CheminDuDossier & $ProfilSupp)
				FileDelete($DossierProfilsSettings & "settings_" & $ProfilSupp)
				FileDelete($DossierProfilsSettings & "settingshero_" & $ProfilSupp)
				AjoutLog("On supprime le profil : " & $ProfilSupp)
		Else
				GUIDelete($confirm)
		EndIf
		_GUICtrlListView_DeleteItemsSelected($ListviewProfils)
	Else
		MsgBox( 48, "", "Aucun profil de sélectionné", 3)
	EndIf

EndFunc;==>SupprimerProfil

;;Fonction permettant d'éditer un profil
Func EditProfil($Profil)

	Local $SettingsEdit = $DossierProfilsSettings & "settings_" & $Profil
	Local $SettingsHeroEdit = $DossierProfilsSettings & "settingshero_" & $Profil
	LoadConfigs($SettingsEdit)
	LoadConfigsHero($SettingsHeroEdit)
	EditSettings($Profil)

EndFunc;==>EditProfil

Func EnregistProfil($Profil)

	Local $SettingsLu = $DossierProfilsSettings & "settings_" & $Profil
	Local $SettingsHeroLu = $DossierProfilsSettings & "settingshero_" & $Profil
	SaveConfigs($SettingsLu)
	SaveConfigsHero($SettingsHeroLu)

EndFunc;==>EnregistProfil

;;Fonction permettant de charger un profil
Func ChargeProfil($Profil)

	Local $SettingsCharger = $DossierProfilsSettings & "settings_" & $Profil
	Local $SettingsHeroCharger = $DossierProfilsSettings & "settingshero_" & $Profil
	FileCopy($SettingsCharger, $DossierSettingsIni & "settings.ini",9)
	FileCopy($SettingsHeroCharger, $DossierSettingsIni & "settingsHero1.ini",9)
	MsgBox( 0, "", "Profil chargé !", 3)

EndFunc;==>ChargeProfil

;;Fonction permattant de créer un profil
Func CreationProfil($CheminDuDossier)

	Local $NomProfil = GUICtrlRead($InputProfil)
	Local $NomPerso = GUICtrlRead($InputNomPerso)
	Local $Build = GUICtrlRead($InputBuild)

	If $NomProfil = "" Then ;si pas de nom de profil, on ne le créé pas
		MsgBox( 48 + 262144, "", "Aucun nom de profil donné", 3)
	Else
		Local $FichierProfil = $CheminDuDossier & $NomProfil & ".ini"
		Local $FichierSettingsProfil = "settings_" & $NomProfil & ".ini"
		Local $FichierSettingsHeroProfil = "settingshero_" & $NomProfil & ".ini"
		_FileCreate($FichierProfil)
		ListerProfils($DossierProfils)
		FileCopy($FichierSettingsDefaut, $DossierProfilsSettings & $FichierSettingsProfil)
		FileCopy($FichierSettingsHeroDefaut, $DossierProfilsSettings & $FichierSettingsHeroProfil)
		IniWrite($FichierProfil, "Info", "NomPerso", $NomPerso)
		IniWrite($FichierProfil, "Info", "Build", $Build)
		AjoutLog("Création d'un nouveau profil : " & $NomProfil)
	EndIf

EndFunc;==>CreationProfil

;;On désactive certains champs
Func EtatGriser()

	If $ChoixActRun <> "-1" Then
		GUICtrlSetState($CheckboxSequencesAlea, $GUI_DISABLE)
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

	If $TakeABreak = "false" Then
		GUICtrlSetState($InputApresXparties, $GUI_DISABLE)
		GUICtrlSetState($InputTempsPause, $GUI_DISABLE)
		GUICtrlSetState($CheckboxPauseRepas, $GUI_DISABLE)
		AjoutLog("On grise la pause")
	EndIf

	If $Recycle = "false" Then
		GUICtrlSetState($InputQualit, $GUI_DISABLE)
		AjoutLog("On grise le recyclage")
	EndIf

EndFunc;==>EtatGriser

Func ListFichier($CheminDuDossier,$i)

	Switch $i
		Case 1
			GUICtrlSetData($ListStats,"")
			GUICtrlSetData($labelDateStats,"--")
			GUICtrlSetData($EditStats,"")
		Case 2
			GUICtrlSetData($ListBuilds,"")
		Case 3
			GUICtrlSetData($ListsBuildsProfils,"")
	EndSwitch

	Local $array = DirGetSize($CheminDuDossier, 1)
	Local $listeFichiers = _FileListToArray($CheminDuDossier,"*",1)

	If IsArray($array) Then
		Switch $i
			Case 1
				If $array[1] > 0 Then
					For $i=1 to $listeFichiers[0]
						GUICtrlSetData($ListStats,$listeFichiers[$i])
					Next
					AjoutLog("Stats chargées dans la ListBox")
				Else
					GUICtrlSetData($ListStats,"Aucune stat")
					AjoutLog("Aucune stat")
				EndIf
			Case 2
				If $array[1] > 0 Then
					For $i=1 to $listeFichiers[0]
						GUICtrlSetData($ListBuilds,$listeFichiers[$i])
					Next
					AjoutLog("Builds chargés dans la ListBox")
				Else
					GUICtrlSetData($ListBuilds,"Aucun Build")
					AjoutLog("Aucun Build")
				EndIf
			Case 3
				If $array[1] > 0 Then
					For $i=1 to $listeFichiers[0]
						GUICtrlSetData($ListsBuildsProfils,$listeFichiers[$i])
					Next
					AjoutLog("Profils chargés dans la ListBox")
				Else
					GUICtrlSetData($ListsBuildsProfils,"Aucun Profil")
					AjoutLog("Aucun profil")
				EndIf
		EndSwitch
	EndIf

EndFunc;==>ListFichier

Func AfficheStats($FichierStats)

	$ContenuStats = FileRead($FichierStats)
	GUICtrlSetData($EditStats, $ContenuStats)
	FileClose($FichierStats)
	AjoutLog("Affichage du fichier : " & $FichierStats)

EndFunc;==>AfficheStats

Func ParseFichierStats($NomFichierStats)

	Local $String = StringMid($NomFichierStats, 6, 16)
	Local $HeureStats = StringRight($String,5)
	Local $AnneeStats = StringLeft($String,4)
	Local $MoisStats = StringMid($String,6,2)
	Local $JourStats = StringMid($String,9,2)
	GUICtrlSetData($labelDateStats,$JourStats & "/" & $MoisStats & "/" & $AnneeStats & "  à " & $HeureStats)
	AjoutLog("On récupère date et heure du fichier : " & $NomFichierStats)

EndFunc;==>ParseFichierStats

;;Lecture du fichier grablist
Func LectureGrablist()

	Local $fichier = $DossierGrab & GUICtrlRead($ComboLectureGrablist)
	$nbr_lignes = _FileCountLines($fichier)
	$fp = FileOpen($fichier, 0)

	$contenu = ""
	For $i = 1 To $nbr_lignes
		$lignesX = FileReadLine($fp, $i)
		$contenu = $contenu & $lignesX & @CRLF
	Next
	FileClose($Fichier)
	GUICtrlSetData($EditGrablists, $contenu)
	AjoutLog("Lecture de " & GUICtrlRead($ComboLectureGrablist))

EndFunc;==>LectureGrablist

;;Modification de la grablist
Func CreerFichier()

	Local $fichier = $DossierGrab & GUICtrlRead($ComboLectureGrablist)
	Local $hFile = FileOpen($fichier, 2)
	Local $GrabModif = GUICtrlRead($EditGrablists)
	FileWrite($hFile, $GrabModif)
	FileClose($fichier)
	AjoutLog("Modification de " & $ComboLectureGrablist)

EndFunc;==>CreerFichier

;;Gestion des checkBox
Func IsChecked($control)

    Return BitAnd(GUICtrlRead($control),$GUI_CHECKED) = $GUI_CHECKED

EndFunc;==>IsChecked

;;Test clé registre
Func IsRegExists($mainkey, $key)

    If $mainkey == "HKEY_LOCAL_MACHINE" Then $mainkey =0x80000002
    If $mainkey == "HKEY_CLASSES_ROOT" Then $mainkey = 0x80000000
    If $mainkey == "HKEY_CURRENT_USER" Then $mainkey = 0x80000001
    If $mainkey == "HKEY_USERS" Then $mainkey = 0x80000003

    Local $openkey = DllCall("advapi32.dll", "long", "RegOpenKeyExW", "ulong_ptr", $mainkey, "wstr", $key, "dword", 0, "dword", 0x0001, "ulong_ptr*", 0)

    If $openkey[0] == "0" Then
        Return(1)
    Else
        Return(0)
    EndIf

EndFunc ;==>IsRegExists

;;Exportation du fichier log
Func CreerFichierLogs ()

	$File = $DossierLogs & "Logs_" & @MDAY & "-" & @MON & "-" & @YEAR & "_" & @HOUR & "-" & @MIN & "-" & @SEC & ".txt"
	AjoutLog("Fichier " & $File & " créé.")
	$hFile = FileOpen($File, 2)
	FileWrite($hFile, $logs)
	FileClose($hFile)
	MsgBox(262144, "Chemin", "Vous trouverez les fichiers Logs dans :" & @CRLF & @CRLF & $DossierLogs ,3)
	AjoutLog("Fichier Log créé : " & $File)
	;ShellExecuteWait($File) ; Affiche le fichier.

EndFunc;==>CreerFichierLogs

;;Ajout d'une ligne de Logs
Func AjoutLog($InfoLog)

	$Logs = "[" & @HOUR & ":" & @MIN & ":" & @SEC & "]" & " - " & $InfoLog & @CRLF & $Logs

EndFunc;==>AjoutLog


Func DLBot()

	inetget("https://github.com/Kyria/ArreatCore/archive/master.zip",@ScriptDir & "DL\master.zip")

EndFunc;==>DLBot

;===============================================================================
;
; Function Name:    GuiCtrlCreateHyperlink()
; Description:    Creates a label that acts as a hyperlink
;
; Parameter(s):     		$s_Text    	  - Label text
;                           $i_Left       - Label left coord
;                           [$i_Top]      - Label top coord
;                           [$i_Width]    - Label width
;                           [$i_Height]   - Label height
;                           [$i_Color]    - Text Color
;                           [$s_ToolTip]  - Hyperlink ToolTip
;                           [$i_Style]    - Label style
;                           [$i_ExStyle]  - Label extended style
;
; Requirement(s):   None
; Return Value(s):  Control ID
;
; Author(s):        Saunders <krawlie@hotmail.com>
;
;===============================================================================

Func GuiCtrlCreateHyperlink($S_TEXT, $I_LEFT, $I_TOP, _
        $I_WIDTH = -1, $I_HEIGHT = -1, $I_COLOR = 0x0000ff, $S_TOOLTIP = '', $I_STYLE = -1, $I_EXSTYLE = -1)

    Local $I_CTRLID
    $I_CTRLID = GUICtrlCreateLabel($S_TEXT, $I_LEFT, $I_TOP, $I_WIDTH, $I_HEIGHT, $I_STYLE, $I_EXSTYLE)
    If $I_CTRLID <> 0 Then
        GUICtrlSetFont($I_CTRLID, -1, -1, 4)
        GUICtrlSetColor($I_CTRLID, $I_COLOR)
        GUICtrlSetCursor($I_CTRLID, 0)
        If $S_TOOLTIP <> '' Then
            GUICtrlSetTip($I_CTRLID, $S_TOOLTIP)
        EndIf
    EndIf
    Return $I_CTRLID

EndFunc ;==>GuiCtrlCreateHyperlink