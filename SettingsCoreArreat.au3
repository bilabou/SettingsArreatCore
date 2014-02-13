;*****************************************
;SettingsCoreArreat.au3 by Sebo
;Cr?? avec ISN AutoIt Studio v. 0.95 BETA
;*****************************************
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <InetConstants.au3>
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

#include "lib\settings\interface.au3" 		;Construction des diverses fen�tre
#include "lib\settings\variables.au3" 		;Variable globales
#include "lib\settings\fonctions.au3" 		;Traitement divers (listage, cr�ation de fichier ou dossier...)
#include "lib\settings\defaut.au3" 			;Valeur par d�faut
#include "lib\settings\traitementini.au3" 	;Permet Lecture et enregistrement des fichiers ini
#include "lib\settings\traitementgui.au3" 	;Permet d'ins�rer et de recup�rer les donn�es pour les fichiers ini

;;Si le script est d�j� lanc�, on emp�che un nouveau lancement.
_Singleton(@ScriptName, 0)

AjoutLog("----------------------------------------------------------------------------")
AjoutLog("D�marrage de Settings Arreat Core (version " & $Version & ")")
AjoutLog("----------------------------------------------------------------------------")
AjoutLog($VersionAutoIT)

;;On affiche l'interface principale
GUISetState(@SW_SHOW, $MainForm)

;;Test pour savoir si les dossiers profils,builds et logs existent
If FileExists($DossierProfils) = 0 or FileExists($DossierBuilds) = 0 or FileExists($DossierLogs) = 0 or FileExists($DossierProfilsSettings) = 0 Then
	DossierAcreer()
Else
	AjoutLog("Dossiers builds, profils et logs : OK")
EndIf

;;On test si diablo 3 est install� sur la machine
;If IsRegExists("HKEY_CURRENT_USER", "Software\Blizzard Entertainment\Diablo III Launcher") Then

;EndIf

If FileExists($OptionsIni) Then ;on test si le fichier de config existe
	LectureOptions()
	RempliOptions()
Else
	_FileCreate($OptionsIni) ;sinon on le cr��
	LectureOptions()
	GUICtrlSetState($CpuGpuItem, $GUI_DISABLE) ;on d�sactive Cpu/Gpu pour bot dans le menu
EndIf

;;on liste dans "$ListProfils" tous les profils dispos
ListerProfils($DossierProfils)


While 1
$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $AddProfil

			CreerProfil()
			ListerProfils($DossierProfils)

		Case $EditProfil

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

		Case $DeleteProfil

			SupprimerProfil($DossierProfils)
			ListerProfils($DossierProfils)

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

		Case $LogsMenu

			Logs();on ouvre la fen�tre Logs

		Case $GrablistsMenu

			Grablists();on ouvre la fen�tre Grablists

		Case $StatsMenu

			Stats();on ouvre la fen�tre Stats

		Case $BuildsMenu

			Builds();on ouvre la fen�tre Builds

		Case $EnreD3PrefsMenu

			FileCopy($D3PrefsD3, $D3PrefsNormal) ;on enregistre le fichier D3Prefs.txt
			AjoutLog("On enregistre le fichier D3Prefs original")
			LectureOptions();on d�grise l'option Gpu/Cpu pour bot

		Case $CpuGpuItem

			If BitAND(GUICtrlRead($CpuGpuItem), $GUI_CHECKED) = $GUI_CHECKED Then
                GUICtrlSetState($CpuGpuItem, $GUI_UNCHECKED)
				FileCopy($D3PrefsPourBot, $D3PrefsD3, 9)
				GUICtrlSetState($EnreD3PrefsMenu, $GUI_ENABLE)
				AjoutLog("On remplace D3Prefs.txt par la version de Toinou75")
            Else
                GUICtrlSetState($CpuGpuItem, $GUI_CHECKED)
				FileCopy($D3PrefsNormal, $D3PrefsD3, 9)
				GUICtrlSetState($EnreD3PrefsMenu, $GUI_DISABLE)
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
			IniWrite($SettingsIni, "Run info", "Devmode", $Devmode)

	EndSwitch
WEnd
