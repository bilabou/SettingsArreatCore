;*****************************************
;SettingsCoreArreat.au3 by Sebo
;Cr?? avec ISN AutoIt Studio v. 0.95 BETA
;*****************************************
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <GuiListView.au3>
#Include <GuiButton.au3>
#include <GuiTab.au3>
#include <GuiMenu.au3>
#include <File.au3>

#include "lib\settings\interface.au3" 		;Construction des diverses fen�tre
#include "lib\settings\variables.au3" 		;Variable globales
#include "lib\settings\fonctions.au3" 		;Traitement divers (listage, cr�ation de fichier ou dossier...)
#include "lib\settings\defaut.au3" 			;Valeur par d�faut
#include "lib\settings\traitementini.au3" 	;Permet Lecture et enregistrement des fichiers ini
#include "lib\settings\traitementgui.au3" 	;Permet d'ins�rer et de recup�rer les donn�es pour les fichiers ini

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
				Local $index = ControlListView("Settings Core Arreat", "", $ListviewProfils, "GetSelected")
				Local $ProfilEdit = ControlListView("Settings Core Arreat", "", $ListviewProfils, "GetText", $index) ;On r�cup�re le nom du profil dans la listview
				EditProfil($ProfilEdit)
			Else
				MsgBox( 48, "", "Aucun profil de s�lectionn�", 3)
			EndIf
			ControlListView ("Settings Core Arreat", "", $ListviewProfils, "DeSelect", -1) ;Annule la s�lection de la listview
			$selection = "" ;On vide la variable pour le prochian chargement

		Case $DeleteProfil
			SupprimerProfil($DossierProfils)
			ListerProfils($DossierProfils)

		Case $ChargerProfil
			Local $selection = GUICtrlRead($ListviewProfils) ;On lit l'item s�lectionn�
			If $selection <> 0 Then ;On v�rifie qu'il ait bien s�lection
				Local $index = ControlListView("Settings Core Arreat", "", $ListviewProfils, "GetSelected")
				Local $ProfilCharge = ControlListView("Settings Core Arreat", "", $ListviewProfils, "GetText", $index) ;On r�cup�re le nom du profil dans la listview
				ChargeProfil($ProfilCharge)
			Else
				MsgBox( 48, "", "Aucun profil de s�lectionn�", 3)
			EndIf
			ControlListView ("Settings Core Arreat", "", $ListviewProfils, "DeSelect", -1) ;Annule la selection de la listview
			$selection = "" ;On vide la variable pour le prochian chargement

		Case $ButtonLogs
			Logs();on ouvre la fen�tre Logs

		Case $ButtonGrablists
			Grablists();on ouvre la fen�tre Grablists

		Case $ButtonStats
			Stats();on ouvre la fen�tre Stats

		Case $ButtonBuilds
			Builds();on ouvre la fen�tre Builds

	EndSwitch
WEnd
