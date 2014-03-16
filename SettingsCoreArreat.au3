#Region Include
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
;#include <InetConstants.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <GuiListView.au3>
#Include <GuiButton.au3>
#include <GuiTab.au3>
#include <GuiMenu.au3>
#include <Misc.au3>
#include <File.au3>

#include "lib\settings\variables.au3" 		;Variable globales
#include "lib\settings\interface.au3" 		;Construction des diverses fen�tre
#include "lib\settings\fonctions.au3" 		;Traitement divers (listage, cr�ation de fichier ou dossier...)
#include "lib\settings\defaut.au3" 			;Valeur par d�faut
#include "lib\settings\traitementini.au3" 	;Permet Lecture et enregistrement des fichiers ini
#include "lib\settings\traitementgui.au3" 	;Permet d'ins�rer et de recup�rer les donn�es pour les fichiers ini
#EndRegion

;;Si le script est d�j� lanc�, on emp�che un nouveau lancement.
_Singleton(@ScriptName, 0)

AjoutLog("----------------------------------------------------------------------------")
AjoutLog("D�marrage de Settings Arreat Core (version " & $Version & ")")
AjoutLog("----------------------------------------------------------------------------")
AjoutLog($VersionAutoIT)

If FileExists($OptionsIni) = 0 Then ;on test si le fichier de config existe
	_FileCreate($OptionsIni) ;sinon on le cr��
	;On met les valeurs par d�faut pour la cr�ation du fichier
	iniwrite($OptionsIni, "Infos","VersionUtilisee","")
	iniwrite($OptionsIni, "Optimisations","D3PrefsBot","false")
EndIf

;;Test pour savoir si les dossiers profils,builds et logs existent
If FileExists($DossierProfils) = 0 or FileExists($DossierBuilds) = 0 or FileExists($DossierLogs) = 0 _
	or FileExists($DossierProfilsModif) = 0 or FileExists($DossierProfilsOriginale) = 0 _
	or FileExists($DossierProfilsOriginale & "settings\") = 0 or FileExists($DossierProfilsOriginale & "settings\") = 0 Then
	DossierAcreer()
Else
	AjoutLog("Dossiers builds, profils et logs : OK")
EndIf

;;on lit SettingsArreatCore.ini
$VersionUtilisee = IniRead($OptionsIni,"Infos","VersionUtilisee","")

Switch $VersionUtilisee
	Case "" ;on lance la fen�tre de choix de la version
		ChoixVersion()
	Case "Originale";;on liste dans "$ListProfils" tous les profils dispos du dossier 'Originale'
		GUISetState(@SW_SHOW, $MainForm)
		ListerProfils($DossierProfilsOriginale)
	Case "Modif";;on liste dans "$ListProfils" tous les profils dispos du dossier 'Modif'
		GUISetState(@SW_SHOW, $MainForm)
		ListerProfils($DossierProfilsModif)
EndSwitch

LectureOptions();Lecture options pour le menu
RempliOptions();On r�percute les valeurs (VersionUtilisee, Devmode et D3PrefsBot) donn�es par la lecture

;;On test si diablo 3 est install� sur la machine
;If IsRegExists("HKEY_CURRENT_USER", "Software\Blizzard Entertainment\Diablo III Launcher") Then

;EndIf

While 1
$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $AddProfil

			CreerProfil()
			Switch $VersionUtilisee
				Case "Modif"
					ListerProfils($DossierProfilsModif)
				Case "Originale"
					ListerProfils($DossierProfilsOriginale)
				EndSwitch

		Case $EditProfil

			If $VersionUtilisee = "Modif" Then
				Local $selection = GUICtrlRead($ListviewProfils) ;On lit l'item s�lectionn�

				If $selection <> 0 Then ;On v�rifie qu'il ait bien s�lection
					Local $index = ControlListView("Settings Arreat Core", "", $ListviewProfils, "GetSelected")
					Local $ProfilEdit = ControlListView("Settings Arreat Core", "", $ListviewProfils, "GetText", $index) ;On r�cup�re le nom du profil dans la listview
					EditProfil($ProfilEdit)
				Else
					MsgBox( 48, "", "Aucun profil de s�lectionn�", 3)
				EndIf

				ControlListView ("Settings Arreat Core", "", $ListviewProfils, "DeSelect", -1) ;Annule la s�lection de la listview
				$selection = "" ;On vide la variable pour le prochian chargement
			Else
				EditProfilBis()
			EndIf

		Case $DeleteProfil

			Switch $VersionUtilisee
				Case "Modif"
					SupprimerProfil($DossierProfilsModif)
					ListerProfils($DossierProfilsModif)
				Case "Originale"
					SupprimerProfil($DossierProfilsOriginale)
					ListerProfils($DossierProfilsOriginale)
			EndSwitch

		Case $ChargerProfil

			Local $selection = GUICtrlRead($ListviewProfils) ;On lit l'item s�lectionn�

			If $selection <> 0 Then ;On v�rifie qu'il ait bien s�lection
				Local $index = ControlListView("Settings Arreat Core", "", $ListviewProfils, "GetSelected")
				Local $ProfilCharge = ControlListView("Settings Arreat Core", "", $ListviewProfils, "GetText", $index) ;On r�cup�re le nom du profil dans la listview
				ChargeProfil($ProfilCharge)
			Else
				MsgBox( 48, "", "Aucun profil de s�lectionn�", 3)
			EndIf

			ControlListView ("Settings Arreat Core", "", $ListviewProfils, "DeSelect", -1) ;Annule la selection de la listview
			$selection = "" ;On vide la variable pour le prochian chargement

		Case $LogsItem

			Logs();on ouvre la fen�tre Logs

		Case $GrablistsItem

			Grablists();on ouvre la fen�tre Grablists

		Case $StatsItem

			Stats();on ouvre la fen�tre Stats

		Case $BuildsItem

			Builds();on ouvre la fen�tre Builds

		Case $AproposItem
			Apropos()

		Case $EnreD3PrefsItem

			FileCopy($D3PrefsD3, $D3PrefsNormal) ;on enregistre le fichier D3Prefs.txt
			AjoutLog("On enregistre le fichier D3Prefs original")
			LectureOptions();on d�grise l'option Gpu/Cpu pour bot

		Case $CpuGpuItem

			If BitAND(GUICtrlRead($CpuGpuItem), $GUI_CHECKED) = $GUI_CHECKED Then
                GUICtrlSetState($CpuGpuItem, $GUI_UNCHECKED)
				FileCopy($D3PrefsPourBot, $D3PrefsD3, 9)
				GUICtrlSetState($EnreD3PrefsItem, $GUI_ENABLE)
				AjoutLog("On remplace D3Prefs.txt par la version de Toinou75")
            Else
                GUICtrlSetState($CpuGpuItem, $GUI_CHECKED)
				FileCopy($D3PrefsNormal, $D3PrefsD3, 9)
				GUICtrlSetState($EnreD3PrefsItem, $GUI_DISABLE)
				AjoutLog("On remet le D3Prefs.txt original")
            EndIf

			RecupOtions()
			EnregOptions()

		Case $DevmodeItem

			If BitAND(GUICtrlRead($DevmodeItem), $GUI_CHECKED) = $GUI_CHECKED Then
                GUICtrlSetState($DevmodeItem, $GUI_UNCHECKED)
				$Devmode = "false"
				AjoutLog("On d�sactive le Devmode")
			Else
				GUICtrlSetState($DevmodeItem, $GUI_CHECKED)
				$Devmode = "true"
				AjoutLog("On active le Devmode")
			EndIf

			If $VersionUtilisee = "Modif" Then
				IniWrite($SettingsIni, "Run info", "Devmode", $Devmode)
			Else
				IniWrite(@ScriptDir& "\settings.ini", "Run info", "Devmode", $Devmode)
			EndIf

		Case $DebugItem

			If BitAND(GUICtrlRead($DebugItem), $GUI_CHECKED) = $GUI_CHECKED Then
                GUICtrlSetState($DebugItem, $GUI_UNCHECKED)
				$Debug = 0
				AjoutLog("On d�sactive le Debug (logs)")
			Else
				GUICtrlSetState($DebugItem, $GUI_CHECKED)
				$Debug = 1
				AjoutLog("On active le Debug (logs)")
			EndIf

			If $VersionUtilisee = "Modif" Then
				IniWrite($SettingsIni, "Run info", "debug", $Debug)
			EndIf

		Case $VersionItem

			If BitAND(GUICtrlRead($VersionItem), $GUI_CHECKED) = $GUI_CHECKED Then
                GUICtrlSetState($VersionItem, $GUI_UNCHECKED)
				$VersionUtilisee = "Originale"
				AjoutLog("Version utilis�e : Origianle")
				GUICtrlSetState($BuildsItem, $GUI_DISABLE)
				GUICtrlSetState($DebugItem, $GUI_DISABLE)
				ListerProfils($DossierProfilsOriginale)
			Else
				GUICtrlSetState($VersionItem, $GUI_CHECKED)
				$VersionUtilisee = "Modif"
				AjoutLog("Version utilis�e : Modifi�e")
				GUICtrlSetState($BuildsItem, $GUI_ENABLE)
				GUICtrlSetState($DebugItem, $GUI_ENABLE)
				ListerProfils($DossierProfilsModif)
			EndIf
			IniWrite($OptionsIni, "Infos", "VersionUtilisee", $VersionUtilisee)

		Case $ListviewProfils

	EndSwitch
WEnd
