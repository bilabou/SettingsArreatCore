;variables.au3

;;D�claration de variables g�n�rales
Global $Logs = ""
Global $Icon = @ScriptDir & "\lib\ico\icon.ico"
Global $IconOpt = @ScriptDir & "\lib\ico\options.ico"
Global $VersionAutoIT = "Version d'AutoIT : " & @AutoItVersion
Global $DossierProfils = @ScriptDir & "\settings\profils\"
Global $DossierProfilsSettings = @ScriptDir & "\settings\profils\settings\"
Global $DossierProfilsSettingsDefaut = @ScriptDir & "\lib\settings\Defaut\"
Global $D3PrefsNormal = $DossierProfilsSettingsDefaut & "D3Prefs_Normal.txt"
Global $D3PrefsD3 = @UserProfileDir & "\Documents\Diablo III\D3Prefs.txt"
Global $D3PrefsPourBot = $DossierProfilsSettingsDefaut & "D3Prefs_Bot.txt"
Global $FichierSettingsDefaut = $DossierProfilsSettingsDefaut & "settings_defaut.ini"
Global $FichierSettingsHeroDefaut = $DossierProfilsSettingsDefaut & "settingshero_Defaut.ini"
Global $DossierBuilds = @ScriptDir & "\settings\builds\"
Global $DossierLogs = @ScriptDir & "\settings\logs\"
Global $DossierStats = @ScriptDir & "\stats\"
Global $DossierSettingsIni = @ScriptDir & "\settings\"
Global $OptionsIni = @ScriptDir & "\settings\SettingsArreatCore.ini"
Global $DossierGrab = @ScriptDir & "\grablist\"
Global $SettingsIni = @ScriptDir& "\settings\settings.ini"
Global $SettingsHeroIni = @ScriptDir& "\settings\settingsHero1.ini"
Global $ProfilSel
Global $Version = "1.3c"

;Variables settings.ini
Global $PassD3 = ""
Global $PartieSolo = ""
Global $TakeABreak = ""
Global $Breakafterxxgames = ""
Global $BreakTime = ""
Global $PauseRepas = ""
Global $Recycle = ""
Global $QualityRecycle = ""
Global $Unidentified = ""
Global $Identified = ""
Global $TypeDeBot = ""
Global $difficulte = ""
Global $PuisMonstre = ""
Global $TypeDeGrabList = ""
Global $ChoixActRun = ""
Global $SequenceAleatoire = ""
Global $NbreRunChangSeqAlea = ""
Global $NombredeRun = ""
Global $NombreMiniAct1 = ""
Global $NombreMaxiAct1 = ""
Global $NombreMiniAct2 = ""
Global $NombreMaxiAct2 = ""
Global $NombreMiniAct3 = ""
Global $NombreMaxiAct3 = ""
Global $Act1HeroAxeZ = ""
Global $Act2HeroAxeZ = ""
Global $Act3HeroAxeZ = ""
Global $SequenceFileAct1 = ""
Global $SequenceFileAct2 = ""
Global $SequenceFileAct3PtSauve = ""
Global $SequenceFileAct3 = ""
Global $SequenceFileAct333 = ""
Global $SequenceFileAct362 = ""
Global $SequenceFileAct373 = ""
Global $monsterList = ""
Global $specialmonsterList = ""
Global $HeroAxeZ = ""
Global $SequenceFile = ""
Global $QualiteItem = ""

;;Variables settingsHero.ini
Global $Potions = ""
Global $key1 = ""
Global $key2 = ""
Global $key3 = ""
Global $key4 = ""
Global $PreBuff1 = ""
Global $ToucheBuff1 = ""
Global $delaiBuff1 = ""
Global $PreBuff2 = ""
Global $ToucheBuff2 = ""
Global $delaiBuff2 = ""
Global $PreBuff3 = ""
Global $ToucheBuff3 = ""
Global $delaiBuff3 = ""
Global $PreBuff4 = ""
Global $ToucheBuff4 = ""
Global $delaiBuff4 = ""
Global $SpellOnLeft = ""
Global $SpellDelayLeft = ""
Global $SpellTypeLeft = ""
Global $SpellEnergyNeedsLeft = ""
Global $SpellLifeLeft = ""
Global $SpellDistanceLeft = ""
Global $SpellOnRight = ""
Global $SpellDelayRight = ""
Global $SpellTypeRight = ""
Global $SpellEnergyNeedsRight = ""
Global $SpellLifeRight = ""
Global $SpellDistanceRight = ""
Global $SpellOn1 = ""
Global $SpellDelay1 = ""
Global $SpellType1 = ""
Global $SpellEnergyNeeds1 = ""
Global $SpellLife1 = ""
Global $SpellDistance1 = ""
Global $SpellOn2 = ""
Global $SpellDelay2 = ""
Global $SpellType2 = ""
Global $SpellEnergyNeeds2 = ""
Global $SpellLife2 = ""
Global $SpellDistance2 = ""
Global $SpellOn3 = ""
Global $SpellDelay3 = ""
Global $SpellType3 = ""
Global $SpellEnergyNeeds3 = ""
Global $SpellLife3 = ""
Global $SpellDistance3 = ""
Global $SpellOn4 = ""
Global $SpellDelay4 = ""
Global $SpellType4 = ""
Global $SpellEnergyNeeds4 = ""
Global $SpellLife4 = ""
Global $SpellDistance4 = ""
Global $LifeForPotion = ""
Global $PotionStock = ""
Global $NbPotionBuy= ""
Global $TakeShrines = ""
Global $repairafterxxgames = ""
Global $maxgamelength = ""
Global $attackRange = ""
Global $grabRange = ""
Global $MonsterTri = ""
Global $MonsterRefresh = ""
Global $ItemRefresh = ""
Global $MonsterPriority = ""
Global $InventoryCheck = ""
Global $attacktimeout = ""
Global $grabtimeout = ""
Global $Gestionaffixe = ""
Global $Gestionaffixeloot = ""
Global $BanAffixList = ""
Global $GestaffixeByClass = ""
Global $LifeArcane = ""
Global $LifeProj = ""
Global $LifePeste = ""
Global $LifeProfa = ""
Global $LifeIce = ""
Global $LifePoison = ""
Global $LifeExplo = ""
Global $LifeLave = ""
Global $LifeMine = ""
Global $LifeArm = ""
Global $LifeSpore = ""
Global $UsePath = ""
Global $ResActivated = ""
Global $ResLife = ""
Global $HCSecurity = ""
Global $MinHCLife = ""

;;Variable Options
Global $D3PrefsBot = ""
