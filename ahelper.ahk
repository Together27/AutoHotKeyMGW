
buildscr = 18
downlurl := "https://github.com/Dub0Shit/Admin-Helper/blob/master/updt.exe?raw=true"
downllen := "https://github.com/Dub0Shit/Admin-Helper/raw/master/vers.ini"
Utf8ToAnsi(ByRef Utf8String, CodePage = 1251)
{
    If (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
    BOM = 3
    Else
    BOM = 0
    UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "Int", 0, "Int", 0)
    VarSetCapacity(UniBuf, UniSize * 2)
    DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "UInt", &UniBuf, "Int", UniSize)
    AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Int", 0, "Int", 0
    , "Int", 0, "Int", 0)
    VarSetCapacity(AnsiString, AnsiSize)
    DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Str", AnsiString, "Int", AnsiSize
    , "Int", 0, "Int", 0)
    Return AnsiString
}
WM_HELP(){
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi(updupd)
    msgbox, , Список изменений версии %vupd%, %updupd%
    return
}
OnMessage(0x53, "WM_HELP")
Gui +OwnDialogs
SplashTextOn, , 60,Автообновление, Запуск скрипта. Ожидайте..`nПроверяем наличие обновлений.
URLDownloadToFile, %downllen%, %a_temp%/verlen.ini
IniRead, buildupd, %a_temp%/verlen.ini, UPD, build
if buildupd =
{
    SplashTextOn, , 60,Автообновление, Запуск скрипта. Ожидайте..`nОшибка. Нет связи с сервером.
    sleep, 2000
}
if buildupd > % buildscr
{
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    SplashTextOn, , 60,Автообновление, Запуск скрипта. Ожидайте..`nОбнаружено обновление до версии %vupd%!
    sleep, 2000
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi(updupd)
    SplashTextoff
    msgbox, 16384, Обновление скрипта до версии %vupd%, %desupd%
    IfMsgBox OK
    {
        msgbox, 1, Обновление скрипта до версии %vupd%, Хотите ли Вы обновиться?
        IfMsgBox OK
        {
            put2 := % A_ScriptFullPath
            RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP ,put2 , % put2
            SplashTextOn, , 60,Автообновление, Обновление. Ожидайте..`nОбновляем скрипт до версии %vupd%!
            URLDownloadToFile, %downlurl%, %a_temp%/updt.exe
            sleep, 1000
            run, %a_temp%/updt.exe
            exitapp
        }
    }
}
SplashTextoff
#NoEnv
#SingleInstance force
#InstallKeybdHook
#MaxThreads, 20
#MaxThreadsPerHotkey, 255
#ifWinActive GTA:SA:MP
SetBatchLines, -1
global ERROR_OK                     := 0
global ERROR_PROCESS_NOT_FOUND      := 1
global ERROR_OPEN_PROCESS           := 2
global ERROR_INVALID_HANDLE         := 3
global ERROR_MODULE_NOT_FOUND       := 4
global ERROR_ENUM_PROCESS_MODULES   := 5
global ERROR_ZONE_NOT_FOUND         := 6
global ERROR_CITY_NOT_FOUND         := 7
global ERROR_READ_MEMORY            := 8
global ERROR_WRITE_MEMORY           := 9
global ERROR_ALLOC_MEMORY           := 10
global ERROR_FREE_MEMORY            := 11
global ERROR_WAIT_FOR_OBJECT        := 12
global ERROR_CREATE_THREAD          := 13
global ADDR_ZONECODE                := 0xA49AD4
global ADDR_POSITION_X              := 0xB6F2E4
global ADDR_POSITION_Y              := 0xB6F2E8
global ADDR_POSITION_Z              := 0xB6F2EC
global ADDR_CPED_PTR                := 0xB6F5F0
global ADDR_CPED_HPOFF              := 0x540
global ADDR_CPED_ARMOROFF           := 0x548
global ADDR_CPED_MONEY              := 0x0B7CE54
global ADDR_CPED_INTID              := 0xA4ACE8
global ADDR_CPED_SKINIDOFF          := 0x22
global ADDR_VEHICLE_PTR             := 0xBA18FC
global ADDR_VEHICLE_HPOFF           := 0x4C0
global ADDR_VEHICLE_DOORSTATE       := 0x4F8
global ADDR_VEHICLE_ENGINESTATE     := 0x428
global ADDR_VEHICLE_LIGHTSTATE      := 0x584
global ADDR_VEHICLE_MODEL           := 0x22
global ADDR_VEHICLE_TYPE            := 0x590
global ADDR_VEHICLE_DRIVER          := 0x460
global ADDR_VEHICLE_X               := 0x44
global ADDR_VEHICLE_Y               := 0x48
global ADDR_VEHICLE_Z               := 0x4C
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]
global ovehicleNames := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global oweaponNames := ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana","Chainsaw","Purple Dildo","Dildo","Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "9mm","Silenced 9mm","Desert Eagle","Shotgun","Sawnoff Shotgun","Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge","Detonator","Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]
global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]
global ADDR_SAMP_INCHAT_PTR             := 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF         := 0x55
global ADDR_SAMP_USERNAME               := 0x219A6F
global FUNC_SAMP_SENDCMD                := 0x65c60
global FUNC_SAMP_SENDSAY                := 0x57f0
global FUNC_SAMP_ADDTOCHATWND           := 0x64520
global ADDR_SAMP_CHATMSG_PTR            := 0x21a0e4
global FUNC_SAMP_SHOWGAMETEXT           := 0x9c2c0
global FUNC_SAMP_PLAYAUDIOSTR           := 0x62da0
global FUNC_SAMP_STOPAUDIOSTR           := 0x629a0
global DIALOG_STYLE_MSGBOX			:= 0
global DIALOG_STYLE_INPUT 			:= 1
global DIALOG_STYLE_LIST			:= 2
global DIALOG_STYLE_PASSWORD		:= 3
global DIALOG_STYLE_TABLIST			:= 4
global DIALOG_STYLE_TABLIST_HEADERS	:= 5
global SAMP_DIALOG_STRUCT_PTR					:= 0x21A0B8
global SAMP_DIALOG_PTR1_OFFSET				:= 0x1C
global SAMP_DIALOG_LINES_OFFSET 			:= 0x44C
global SAMP_DIALOG_INDEX_OFFSET				:= 0x443
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET	:= 0x465
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET	:= 0x466
global SAMP_DIALOG_PTR2_OFFSET 				:= 0x20
global SAMP_DIALOG_LINECOUNT_OFFSET			:= 0x150
global SAMP_DIALOG_OPEN_OFFSET				:= 0x28
global SAMP_DIALOG_STYLE_OFFSET				:= 0x2C
global SAMP_DIALOG_ID_OFFSET				:= 0x30
global SAMP_DIALOG_TEXT_PTR_OFFSET			:= 0x34
global SAMP_DIALOG_CAPTION_OFFSET			:= 0x40
global FUNC_SAMP_SHOWDIALOG				 	:= 0x6B9C0
global FUNC_SAMP_CLOSEDIALOG				:= 0x6C040
global FUNC_UPDATESCOREBOARD                := 0x8A10
global SAMP_INFO_OFFSET                     := 0x21A0F8
global ADDR_SAMP_CRASHREPORT 				:= 0x5CF2C
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_PLAYER_MAX                      := 1004
global CheckpointCheck 						:= 0xC7DEEA
global rmaddrs 								:= [0xC7DEC8, 0xC7DECC, 0xC7DED0]
global SIZE_SAMP_CHATMSG := 0xFC
global hGTA := 0x0
global dwGTAPID := 0x0
global dwSAMP := 0x0
global pMemory := 0x0
global pParam1 := 0x0
global pParam2 := 0x0
global pParam3 := 0x0
global pParam4                         := 0x0
global pParam5                         := 0x0
global pInjectFunc := 0x0
global nZone := 1
global nCity := 1
global bInitZaC := 0
global iRefreshScoreboard := 0
global oScoreboardData := ""
global iRefreshHandles := 0
global iUpdateTick := 2500
UpdateScrollBar(hGui, ScrollHeight)
{
    static SIF_RANGE := 0x1, SIF_PAGE := 0x2, SB_VERT := 1
    VarSetCapacity(si, 28, 0)
    NumPut(28, si)
    NumPut(SIF_RANGE | SIF_PAGE, si, 4)
    NumPut(ScrollHeight, si, 12)
    NumPut(GuiHeight, si, 16)
    DllCall("SetScrollInfo", Ptr, hGui, UInt, SB_VERT, Ptr, &si, Int, 1)
    ControlGetPos,, Top,,,, % "ahk_id " hGBs[1]
    if (Top = 114)
    Return
    Top -= 114
    ControlGetPos,, y,, h,, % "ahk_id " hGBs[Blocks]
    bottom := y + h - 74
    if (top < 0 && bottom < GuiHeight)
    {
        y := (a := Abs(top)) > (b := GuiHeight-bottom) ? b : a
        DllCall("ScrollWindow", Ptr, hGui, Int, 0, Int, y, Ptr, 0, Ptr, 0)
    }
}
WM_VSCROLL(wParam, lParam, msg, hwnd)
{
    static SIF_ALL:=0x17, SCROLL_STEP:=10
    bar := msg=0x115
    VarSetCapacity(si, 28, 0)
    NumPut(28, si, "UInt")
    NumPut(SIF_ALL, si, 4, "UInt")
    if !DllCall("GetScrollInfo", Ptr, hwnd, Int, bar, Ptr, &si)
    return
    VarSetCapacity(rect, 16)
    DllCall("GetClientRect", Ptr, hwnd, Ptr, &rect)
    new_pos := NumGet(si, 20, "UInt")
    action := wParam & 0xFFFF
    if action = 0
    new_pos -= SCROLL_STEP
    else if action = 1
    new_pos += SCROLL_STEP
    else if action = 2
    new_pos -= NumGet(rect, 12, "Int") - SCROLL_STEP
    else if action = 3
    new_pos += NumGet(rect, 12, "Int") - SCROLL_STEP
    else if (action = 5 || action = 4)
    new_pos := wParam>>16
    else if action = 6
    new_pos := NumGet(si, 8, "Int")
    else if action = 7
    new_pos := NumGet(si, 12, "Int")
    else
    return
    min := NumGet(si, 8, "Int")
    max := NumGet(si, 12, "Int") - NumGet(si, 16, "UInt")
    new_pos := new_pos > max ? max : new_pos
    new_pos := new_pos < min ? min : new_pos
    old_pos := NumGet(si, 20, "Int")
    y := old_pos-new_pos
    DllCall("ScrollWindow", Ptr, hwnd, Int, 0, Int, y, UInt, 0, UInt, 0)
    NumPut(new_pos, si, 20, "Int")
    DllCall("SetScrollInfo", Ptr, hwnd, Int, bar, Ptr, &si, Int, 1)
}
VSCROLL_To(hwnd, msg){
    WM_VSCROLL(msg, 0, WM_VSCROLL, hWnd)
}
WM_MOUSEWHEEL(hWnd, wp)
{
    global tabId
    if(tabId != 5)
    return
    WM_VSCROLL(wp>>16 & 0xFFFF < 0x7FFF ? SB_LINEUP : SB_LINEDOWN, 0, WM_VSCROLL, hWnd)
}
restartGameEx() {
    if(!checkHandles())
    return -1
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwFunc := dwSAMP + 0xA060
    VarSetCapacity(injectData, 11, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
getIP() {
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ipAddr := readString(hGTA, dwAddress + SAMP_SZIP_OFFSET, 257)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    return ipAddr
}
disconnectEx() {
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ecx := dwAddress
    dwAddress := readDWORD(hGTA, dwAddress)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    VarSetCapacity(injectData, 24, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(ecx, injectData, 1, "UInt")
    NumPut(0xB8, injectData, 5, "UChar")
    NumPut(dwAddress, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(0, injectData, 11, "UInt")
    NumPut(0x68, injectData, 15, "UChar")
    NumPut(500, injectData, 16, "UInt")
    NumPut(0x50FF, injectData, 20, "UShort")
    NumPut(0x08, injectData, 22, "UChar")
    NumPut(0xC3, injectData, 23, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 24)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
setrestart()
{
    VarSetCapacity(old, 4, 0)
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    NumPut(9,old,0,"Int")
    writeRaw(hGTA, dwAddress + 957, &old, 4)
}
restart()
{
    restartGameEx()
    disconnectEx()
    Sleep 1000
    setrestart()
}
LoadIni()
{
    global
    DefHide := ReadIni("settings", "hide")
    OpenMemDialog := ReadIni("settings", "memDialog")
    isLastSms := ReadIni("settings", "lastsms")
    Clist := ReadIni("settings", "clist")
    isClist := ReadIni("settings", "isDefClist")
    Tag := ReadIni("settings", "tagR")
    OpenChatInT := ReadIni("settings", "ChatInT")
    AntiFlood := ReadIni("settings", "antiflood")
    KeyLock := ReadIni("keys", "KeyLock")
    KeyMM := ReadIni("keys", "KeyMM")
    KeyStats := ReadIni("keys", "KeyStats")
    KeyMem := ReadIni("keys", "KeyMem")
    KeyWare := ReadIni("keys", "KeyWare")
    KeyClist := ReadIni("keys", "KeyClist")
    KeyBanda := ReadIni("keys", "KeyBanda")
    KeyTime := ReadIni("keys", "KeyTime")
    KeyR := ReadIni("keys", "KeyR")
    KeyROoc := ReadIni("keys", "KeyROoc")
    KeySMS := ReadIni("keys", "KeySMS")
    KeyLec := ReadIni("keys", "KeyLec")
    KeyPLec := ReadIni("keys", "KeyPLec")
    KeyOOC := ReadIni("keys", "KeyOOC")
    Keys := Object()
    Keys[KeyLock] := "gKeyLock"
    Keys[KeyMM] := "gKeyMM"
    Keys[KeyStats] := "gKeyStats"
    Keys[KeyMem] := "gKeyMem"
    Keys[KeyWare] := "gKeyWare"
    Keys[KeyClist] := "gKeyClist"
    Keys[KeyBanda] := "gKeyBanda"
    Keys[KeyTime] := "gKeyTime"
    Keys[KeyR] := "gKeyR"
    Keys[KeyROoc] := "gKeyROoc"
    Keys[KeySMS] := "gKeySMS"
    Keys[KeyOOC] := "gKeyOOC"
    return
}
LoadKeys()
{
    global
    LoadIni()
    for var, varr in Keys
    {
        addHotKey(var, varr)
    }
    return
}
unLoadKeys()
{
    global
    for var, varr in Keys
    {
        delHotKey(var)
    }
    return
}
HKToStr(HK) {
    Static LRPrefix := [["<^","LCtrl"],[">^","RCtrl"],["<!","LAlt"],[">!","RAlt"]
    ,["<+","LShift"],[">+","RShift"],["<#","LWin"],[">#","RWin"]]
    , Prefix := [["^","Ctrl"],["!","Alt"],["+","Shift"],["#","Win"]]
    , EngSym := {"vkBB":"=","vkBC":",","vkBD":"-","vkBE":".","vkBF":"/","vkC0":"``","vkBA":"`;"
        ,"vkDB":"[","vkDC":"\","vkDD":"]","vkDE":"'","vk41":"A","vk42":"B","vk43":"C"
        ,"vk44":"D","vk45":"E","vk46":"F","vk47":"G","vk48":"H","vk49":"I","vk4A":"J"
        ,"vk4B":"K","vk4C":"L","vk4D":"M","vk4E":"N","vk4F":"O","vk50":"P","vk51":"Q"
        ,"vk52":"R","vk53":"S","vk54":"T","vk55":"U","vk56":"V","vk57":"W","vk58":"X"
    ,"vk59":"Y","vk5A":"Z"}
    Local K, K1, K2, I, V, M, R
RegExMatch(HK, "S)^\s*([~\*\$\^\+!#<>]*)\{?(.*?)}?\s*$", K)
    If (K2 = "")
    Return ""
    If InStr("|" K2, "|vk")
    K2 := K2 = "vkBF" ? "/" : (EngSym.HasKey(K2) ? EngSym[K2] : GetKeyName(K2))
    If (K1 != "")
    For I, V in K1 ~= "[<>]" ? LRPrefix : Prefix
    K1 := StrReplace(K1, V[1], "", R), R && (M .= V[2] "+")
Return M . (StrLen(K2) = 1 ? Format("{:U}", K2) : K2)
}
GetChatText()
{
    if(!checkHandles())
    return
    dwAddrr1 := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR) + 0x258F4
    res := readMem(hGTA, dwAddrr1)
    return res
}
isChatOpen() {
    dwPointer := readDWORD(hGTA, dwSAMP + 0x21A0C4)
    if (ErrorLevel || !dwPointer)
    return false
    dwIsOpen := readMem(hGTA, dwPointer + 0x4E54, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return dwIsOpen ? true : false
}
ReadIni(param1, param2)
{
    iniRead, Res, %iniFile%, %param1%, %param2%
    if(Res = "ERROR" || Res = "^" || Res = "!" || Res = "+" || Res = "#")
    {
        if(param1 = "settings")
        return 0
        else
        return
    }
    return Res
}
WriteIni(val, param1, param2)
{
    global
    iniWrite, %val%, %iniFile%, %param1%, %param2%
    return
}
addHotKey(varKey, Lab)
{
    global
    if(strlen(varKey) = 0 || RegExMatch(varKey,"^(\!|\#|\^|\+|ERROR)$"))
    return
    if(WarnKey(varKey))
    {
        HotKey, ~%varKey%, %Lab%
        HotKey, ~%varKey%, On
    }
    else
    {
        HotKey, $%varKey%, %Lab%
        HotKey, $%varKey%, On
    }
    return
}
delHotKey(vardKey)
{
    global
    if(strlen(vardKey) = 0 || RegExMatch(vardKey,"^(\!|\#|\^|\+|ERROR)$"))
    return
    if(WarnKey(vardKey))
    HotKey, ~%vardKey%, off
    else
    HotKey, $%vardKey%, off
    return
}
WarnKey(Key)
{
    if(RegExMatch(Key, "^(\+(vk|[0-9])|vk|[0-9])"))
    return 1
    else
    return 0
}
colorToStr(color)
{
    color += 0
    color >>= 8
    color &= 0xffffff
    SetFormat, IntegerFast, hex
    color += 0
    color .= ""
    StringTrimLeft, color, color, 2
    SetFormat, IntegerFast, d
    if(strlen(color) < 6)
    {
        count := 6-strlen(color)
        loop %count%
        color := "0" color
    }
color :=  "{" color "}"
    return color
}
getPlayerColor(id)
{
    id += 0
    if(!checkHandles())
    return -1
    color := readDWORD(hGTA, dwSAMP + 0x216378 + 4*id)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return color
}
GetKeysVK(Hotkey) {
    RegExMatch(Hotkey, "S)^([\^\+!]*)(.*?)$", K)
    If (StrLen(K2) = 1 && !Instr("1234567890-=", K2))
Return K1 . Format("vk{:X}", GetKeyVK(K2))
    Return Hotkey
}
isRu()
{
    if(DllCall("GetKeyboardLayout", "Int", DllCall("GetWindowThreadProcessId", "Int", WinExist("A"), "Int", "0")) == 0x4190419)
    return 1
    else
    return 0
}
getChatLineEx(line) {
    if(!checkHandles())
    return -1
    dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
    dwAddress := readDWORD(hGTA,dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    chatLine := readString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), 252)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return chatLine
}
ClipPutText(Text, LocaleID=0x419)
{
    CF_TEXT:=1, CF_LOCALE:=16, GMEM_MOVEABLE:=2
    TextLen   :=StrLen(Text)
    HmemText  :=DllCall("GlobalAlloc", "UInt", GMEM_MOVEABLE, "UInt", TextLen+1)
    HmemLocale:=DllCall("GlobalAlloc", "UInt", GMEM_MOVEABLE, "UInt", 4)
    If(!HmemText || !HmemLocale)
    Return
    PtrText   :=DllCall("GlobalLock",  "UInt", HmemText)
    PtrLocale :=DllCall("GlobalLock",  "UInt", HmemLocale)
    DllCall("msvcrt\memcpy", "UInt", PtrText, "Str", Text, "UInt", TextLen+1, "Cdecl")
    NumPut(LocaleID, PtrLocale+0)
    DllCall("GlobalUnlock",     "UInt", HmemText)
    DllCall("GlobalUnlock",     "UInt", HmemLocale)
    If not DllCall("OpenClipboard", "UInt", 0)
    {
        DllCall("GlobalFree", "UInt", HmemText)
        DllCall("GlobalFree", "UInt", HmemLocale)
        Return
    }
    DllCall("EmptyClipboard")
    DllCall("SetClipboardData", "UInt", CF_TEXT,   "UInt", HmemText)
    DllCall("SetClipboardData", "UInt", CF_LOCALE, "UInt", HmemLocale)
    DllCall("CloseClipboard")
}
ClipGetText(CodePage=1251)
{
    CF_TEXT:=1, CF_UNICODETEXT:=13, Format:=0
    If not DllCall("OpenClipboard", "UInt", 0)
    Return
    Loop
    {
        Format:=DllCall("EnumClipboardFormats", "UInt", Format)
        If(Format=0 || Format=CF_TEXT || Format=CF_UNICODETEXT)
        Break
    }
    If(Format=0) {
        DllCall("CloseClipboard")
        Return
    }
    If(Format=CF_TEXT)
    {
        HmemText:=DllCall("GetClipboardData", "UInt", CF_TEXT)
        PtrText :=DllCall("GlobalLock",       "UInt", HmemText)
        TextLen :=DllCall("msvcrt\strlen",    "UInt", PtrText, "Cdecl")
        VarSetCapacity(Text, TextLen+1)
        DllCall("msvcrt\memcpy", "Str", Text, "UInt", PtrText, "UInt", TextLen+1, "Cdecl")
        DllCall("GlobalUnlock", "UInt", HmemText)
    }
    Else If(Format=CF_UNICODETEXT)
    {
        HmemTextW:=DllCall("GetClipboardData", "UInt", CF_UNICODETEXT)
        PtrTextW :=DllCall("GlobalLock",       "UInt", HmemTextW)
        TextLen  :=DllCall("msvcrt\wcslen",    "UInt", PtrTextW, "Cdecl")
        VarSetCapacity(Text, TextLen+1)
        DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0, "UInt", PtrTextW
        , "Int", TextLen+1, "Str", Text, "Int", TextLen+1
        , "UInt", 0, "Int", 0)
        DllCall("GlobalUnlock", "UInt", HmemTextW)
    }
    DllCall("CloseClipboard")
    Return Text
}
HexToDec(str)
{
    local newStr := ""
static comp := {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, "a":10, "b":11, "c":12, "d":13, "e":14, "f":15}
    StringLower, str, str
    str := RegExReplace(str, "^0x|[^a-f0-9]+", "")
    Loop, % StrLen(str)
    newStr .= SubStr(str, (StrLen(str)-A_Index)+1, 1)
    newStr := StrSplit(newStr, "")
    local ret := 0
    for i,char in newStr
    ret += comp[char]*(16**(i-1))
    return ret
}
addChatMessageEx(Color, wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    VarSetCapacity(data2, 4, 0)
    NumPut(HexToDec(Color),data2,0,"Int")
    Addrr := readDWORD(hGTA, dwSAMP+ADDR_SAMP_CHATMSG_PTR)
    VarSetCapacity(data1, 4, 0)
    NumPut(readDWORD(hGTA, Addrr + 0x12A), data1,0,"Int")
    WriteRaw(hGTA, Addrr + 0x12A, &data2, 4)
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    WriteRaw(hGTA, Addrr + 0x12A, &data1, 4)
    ErrorLevel := ERROR_OK
    return true
}
deg2rad(deg)
{
    rad := deg * .01745329252
    Return rad
}
distance(lat1, lng1, lat2, lng2)
{
    lat1 := deg2rad(lat1)
    lng1 := deg2rad(lng1)
    lat2 := deg2rad(lat2)
    lng2 := deg2rad(lng2)
    delta_lat := (lat2 - lat1)
    delta_lng := (lng2 - lng1)
    Return Round(6378137 * ACOS(COS(lat1) * COS(lat2) * COS(lng1 - lng2) + SIN(lat1) * SIN(lat2)))
}
GetReadLine(i)
{
    dwAddrr1 := readDWORD(hGTA, dwSAMP + SAMP_CHAT_INFO_OFFSET)
    ReadLine := dwAddrr1 + 0x1E2 + ( (99-i) * 0xFC)
    read := readString(hGTA, ReadLine, 144)
    return read
}
WaitChat(text, callFuncChatWait, timeout = 0)
{
    global
    if(!IsObject(ChatLine))
    ChatLine := Object()
    if(!IsObject(isWait))
    isWait := Object()
    if(!IsObject(stTime))
    stTime := Object()
    if(isWait[txt])
    return
    isWait[text] := true
    if(timeout > 0)
    {
        stTime[text]  := A_TickCount
    }
    dwAddrr1 := readDWORD(hGTA, dwSAMP +ADDR_SAMP_CHATMSG_PTR)
    Loop
    {
        if(!isWait[text])
        return
        if(A_TickCount - stTime[text] >= timeout  && timeout > 0)
        {
            ErrorLevel := 1
            isWait[text] := false
            %callFuncChatWait%(text, text, 1)
            return
        }
        i := 0
        loop 99
        {
            RLine := 0x132 + ((99 - i) * 0xFC) + 125
            Reading := readMem(hGTA, dwAddrr1 + RLine)
            if(ChatLine[text] = Reading)
            i := 0
            if(RegExMatch(GetChatLineEx(i), text, result))
            {
                ErrorLevel := 0
                VarSetCapacity(TimeTime, 4, 0)
                NumPut(A_Hour A_Min A_Sec,TimeTime,0,"Int")
                WriteRaw(hGTA, dwAddrr1 + RLine, &TimeTime, 4)
                ChatLine[text] := readMem(hGTA, dwAddrr1 + RLine)
                isWait[text] := false
                %callFuncChatWait%(result, text, 0)
                return
            }
            i++
        }
    }
    return
}
IsSAMPAvailable() {
    if(!checkHandles())
    return false
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(dwChatInfo == 0 || dwChatInfo == "ERROR")
    {
        return false
    }
    else
    {
        return true
    }
}
isInChat() {
    if(!checkHandles())
    return -1
    dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR
    dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwInChat := readDWORD(hGTA, dwAddress)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    if(dwInChat > 0) {
        return true
    } else {
        return false
    }
}
getUsername() {
    if(!checkHandles())
    return ""
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    sUsername := readString(hGTA, dwAddress, 25)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return sUsername
}
getId() {
    s:=getUsername()
    return getPlayerIdByName(s)
}
SendChat(wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    dwFunc:=0
    if(SubStr(wText, 1, 1) == "/") {
        dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    } else {
        dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    }
    callWithParams(hGTA, dwFunc, [["s", wText]], false)
    ErrorLevel := ERROR_OK
    return true
}
addChatMessage(wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    ErrorLevel := ERROR_OK
    return true
}
showGameText(wText, dwTime, dwSize) {
    wText := "" wText
    dwTime += 0
    dwTime := Floor(dwTime)
    dwSize += 0
    dwSize := Floor(dwSize)
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT
    callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwSize]], false)
    ErrorLevel := ERROR_OK
    return true
}
playAudioStream(wUrl) {
    wUrl := "" wUrl
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    patchRadio()
    callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
    unPatchRadio()
    ErrorLevel := ERROR_OK
    return true
}
stopAudioStream() {
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    patchRadio()
    callWithParams(hGTA, dwFunc, [["i", 1]], false)
    unPatchRadio()
    ErrorLevel := ERROR_OK
    return true
}
patchRadio()
{
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 4, 0)
    NumPut(0x90909090,nop,0,"UInt")
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    return true
}
unPatchRadio()
{
    if(!checkHandles())
    return false
    VarSetCapacity(old, 4, 0)
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x39,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x09,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    return true
}
blockChatInput() {
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 2, 0)
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0x04C2,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    return true
}
unBlockChatInput() {
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 2, 0)
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0xA164,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    return true
}
getServerName() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerName := readString(hGTA, dwAdress + 0x121, 200)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerName
}
getServerIP() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerIP := readString(hGTA, dwAdress + 0x20, 100)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerIP
}
getServerPort() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerPort := readMem(hGTA, dwAdress + 0x225, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerPort
}
getWeatherID() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    WeatherID := readMem(hGTA, dwGTA + 0xC81320, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return WeatherID
}
getWeatherName() {
    if(isPlayerInAnyVehicle() == 0)
    return -1
    if(id >= 0 && id < 23)
    {
        return oweatherNames[id-1]
    }
    return ""
}
getTargetPed() {
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddress)
    return 0
    dwAddress := readDWORD(hGTA, dwAddress+0x79C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
calcScreenCoors(fX,fY,fZ)
{
    if(!checkHandles())
    return false
    dwM := 0xB6FA2C
    m_11 := readFloat(hGTA, dwM + 0*4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    m_12 := readFloat(hGTA, dwM + 1*4)
    m_13 := readFloat(hGTA, dwM + 2*4)
    m_21 := readFloat(hGTA, dwM + 4*4)
    m_22 := readFloat(hGTA, dwM + 5*4)
    m_23 := readFloat(hGTA, dwM + 6*4)
    m_31 := readFloat(hGTA, dwM + 8*4)
    m_32 := readFloat(hGTA, dwM + 9*4)
    m_33 := readFloat(hGTA, dwM + 10*4)
    m_41 := readFloat(hGTA, dwM + 12*4)
    m_42 := readFloat(hGTA, dwM + 13*4)
    m_43 := readFloat(hGTA, dwM + 14*4)
    dwLenX := readDWORD(hGTA, 0xC17044)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    dwLenY := readDWORD(hGTA, 0xC17048)
    frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
    frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
    frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
    fRecip := 1.0/frZ
    frX *= fRecip * dwLenX
    frY *= fRecip * dwLenY
    if(frX<=dwLenX && frY<=dwLenY && frZ>1)
    return [frX,frY,frZ]
}
getPedById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return 0
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return oScoreboardData[dwId].PED
        }
        return 0
    }
    if(!updateOScoreboardData())
    return 0
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return oScoreboardData[dwId].PED
    }
    return 0
}
getIdByPed(dwPed) {
    dwPed += 0
    dwPed := Floor(dwPed)
    if(!dwPed)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                if(o.PED==dwPed)
                return i
            }
        }
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            if(o.PED==dwPed)
            return i
        }
    }
    return -1
}
getStreamedInPlayersInfo() {
    r:=[]
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                p := getPedCoordinates(o.PED)
                if(p)
                {
                    h := p
                    r[i] := o
                }
            }
        }
        return r
    }
    if(!updateOScoreboardData())
    return ""
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            p := getPedCoordinates(o.PED)
            if(p)
            {
                o.POS := p
                r[i] := o
            }
        }
    }
    return r
}
callFuncForAllStreamedInPlayers(cfunc,dist=0x7fffffff) {
    cfunc := "" cfunc
    dist += 0
    if(!IsFunc(cfunc))
    return false
    p := getStreamedInPlayersInfo()
    if(!p)
    return false
    if(dist<0x7fffffff)
    {
        lpos := getCoordinates()
        if(!lpos)
        return false
        For i, o in p
        {
            if(dist>getDist(lpos,o.POS))
            %cfunc%(o)
        }
    }
    else
    {
        For i, o in p
        %cfunc%(o)
    }
    return true
}
getDist(pos1,pos2) {
    if(!pos1 || !pos2)
    return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}
getClosestPlayerPed() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    PED := getPedById(id)
    return PED
}
getClosestPlayerId() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    return id
}
CountOnlinePlayers() {
    if(!checkHandles())
    return -1
    dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwOnline + 0x4
    OnlinePlayers := readDWORD(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return OnlinePlayers
}
getPedCoordinates(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
    return ""
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwPED + 0x14)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fX := readFloat(hGTA, dwAddress + 0x30)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, dwAddress + 0x34)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, dwAddress + 0x38)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
getTargetPos(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return getPedCoordinates(oScoreboardData[dwId].PED)
            if(oScoreboardData[dwId].HasKey("MPOS"))
            return oScoreboardData[dwId].MPOS
        }
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return getPedCoordinates(oScoreboardData[dwId].PED)
        if(oScoreboardData[dwId].HasKey("MPOS"))
        return oScoreboardData[dwId].MPOS
    }
    return ""
}
getTargetPlayerSkinIdByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
getTargetPlayerSkinIdById(dwId) {
    if(!checkHandles())
    return -1
    dwPED := getPedById(dwId)
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
getVehiclePointerByPed(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
    return 0
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, dwPED + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
getVehiclePointerById(dwId) {
    if(!dwId)
    return 0
    if(!checkHandles())
    return 0
    dwPed_By_Id := getPedById(dwId)
    dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
isTargetInAnyVehicleByPed(dwPED)
{
    if(!checkHandles())
    return -1
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}
isTargetInAnyVehiclebyId(dwId)
{
    if(!checkHandles())
    return -1
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}
getTargetVehicleHealthByPed(dwPed) {
    if(!checkHandles())
    return -1
    dwVehPtr := getVehiclePointerByPed(dwPed)
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getTargetVehicleHealthById(dwId) {
    if(!checkHandles())
    return -1
    dwVehPtr := getVehiclePointerById(dwId)
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getTargetVehicleTypeByPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getTargetVehicleTypeById(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getTargetVehicleModelIdByPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleModelIdById(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleModelNameByPed(dwPED) {
    id := getTargetVehicleModelIdByPed(dwPED)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getTargetVehicleModelNameById(dwId) {
    id := getTargetVehicleModelIdById(dwId)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getTargetVehicleLightStateByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getTargetVehicleLightStateById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getTargetVehicleLockStateByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getTargetVehicleLockStateById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getTargetVehicleColor1byPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor1byId(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor2byPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor2byId(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleSpeedByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getTargetVehicleSpeedById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getPlayerNameById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].NAME
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].NAME
    return ""
}
getPlayerIdByName(wName) {
    wName := "" wName
    if(StrLen(wName) < 1 || StrLen(wName) > 24)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(InStr(o.NAME,wName))
            return i
        }
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    For i, o in oScoreboardData
    {
        if(InStr(o.NAME,wName)==1)
        return i
    }
    return -1
}
getPlayerScoreById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].SCORE
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].SCORE
    return ""
}
getPlayerPingById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].PING
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].PING
    return -1
}
isNPCById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].ISNPC
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].ISNPC
    return -1
}
updateScoreboardDataEx() {
    if(!checkHandles())
    return false
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
    VarSetCapacity(injectData, 11, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
updateOScoreboardData() {
    if(!checkHandles())
    return 0
    oScoreboardData := []
    if(!updateScoreboardDataEx())
    return 0
    iRefreshScoreboard := A_TickCount
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    sUsername := ""
    if(dwTemp <= 0xf) {
        sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    else {
        dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayer==0)
        continue
        dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := ""
        if(dwTemp <= 0xf)
        {
            sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        else {
            dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
            if(ErrorLevel || dwAddress==0) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            sUsername := readString(hGTA, dwAddress, 25)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
        oScoreboardData[i] := o
        dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayerData==0)
        continue
        dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwAddress)
        {
            ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            o.MPOS := [ix, iy, iz]
        }
        dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwpSAMP_Actor==0)
        continue
        dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwPed==0)
        continue
        o.PED := dwPed
        fHP := readFloat(hGTA, dwRemoteplayerData + 444)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        o.HP := fHP
        o.ARMOR := fARMOR
    }
    ErrorLevel := ERROR_OK
    return 1
}
GetChatLine(Line, ByRef Output, timestamp=0, color=0){
    chatindex := 0
    FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    loop, Parse, file, `n, `r
    {
        if(A_LoopField)
        chatindex := A_Index
    }
    loop, Parse, file, `n, `r
    {
        if(A_Index = chatindex - line){
            output := A_LoopField
            break
        }
    }
    file := ""
    if(!timestamp)
output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
    if(!color)
output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
    return
}
getPlayerHealth() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getPlayerArmor() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getPlayerInteriorId() {
    if(!checkHandles())
    return -1
    iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return iid
}
getPlayerSkinID() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
getPlayerMoney() {
    if(!checkHandles())
    return ""
    money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return money
}
getPlayerWanteds() {
    if(!checkHandles())
    return -1
    dwPtr := 0xB7CD9C
    dwPtr := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    Wanteds := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Wanteds
}
getPlayerWeaponId() {
    if(!checkHandles())
    return 0
    WaffenId := readMem(hGTA, 0xBAA410, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return WaffenId
}
getPlayerWeaponName() {
    id := getPlayerWeaponId()
    if(id >= 0 && id < 44)
    {
        return oweaponNames[id+1]
    }
    return ""
}
getPlayerState() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    State := readDWORD(hGTA, dwCPedPtr + 0x530)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return State
}
IsPlayerInMenu() {
    if(!checkHandles())
    return -1
    IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return IsInMenu
}
getPlayerMapPosX() {
    if(!checkHandles())
    return -1
    MapPosX := readFloat(hGTA, 0xBA67B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapPosX
}
getPlayerMapPosY() {
    if(!checkHandles())
    return -1
    MapPosY := readFloat(hGTA, 0xBA67BC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapPosY
}
getPlayerMapZoom() {
    if(!checkHandles())
    return -1
    MapZoom := readFloat(hGTA, 0xBA67AC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapZoom
}
IsPlayerFreezed() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    IPF := readMem(hGTA, dwGTA + 0x690495, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return IPF
}
isPlayerInAnyVehicle()
{
    if(!checkHandles())
    return -1
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return (dwVehPtr > 0)
}
isPlayerDriver() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==dwCPedPtr)
}
getVehicleHealth() {
    if(!checkHandles())
    return -1
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getVehicleType() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getVehicleModelId() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getVehicleModelName() {
    id:=getVehicleModelId()
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getVehicleLightState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getVehicleEngineState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}
getVehicleLockState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getVehicleColor1() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getVehicleColor2() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getVehicleSpeed() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getPlayerRadiostationID() {
    if(!checkHandles())
    return -1
    if(isPlayerInAnyVehicle() == 0)
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    RadioStationID := readMem(hGTA, dwGTA + 0x4CB7E1, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return RadioStationID
}
getPlayerRadiostationName() {
    if(isPlayerInAnyVehicle() == 0)
    return -1
    id := getPlayerRadiostationID()
    if(id == 0)
    return -1
    if(id >= 0 && id < 14)
    {
        return oradiostationNames[id]
    }
    return ""
}
setCheckpoint(fX, fY, fZ, fSize ) {
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + 0x9D340
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(buf, 16, 0)
    NumPut(fX, buf, 0, "Float")
    NumPut(fY, buf, 4, "Float")
    NumPut(fZ, buf, 8, "Float")
    NumPut(fSize, buf, 12, "Float")
    writeRaw(hGTA, pParam1, &buf, 16)
    dwLen := 31
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(pParam1+12, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam1, injectData, 11, "UInt")
    NumPut(0xE8, injectData, 15, "UChar")
    offset := dwFunc - (pInjectFunc + 20)
    NumPut(offset, injectData, 16, "Int")
    NumPut(0x05C7, injectData, 20, "UShort")
    NumPut(dwAddress+0x24, injectData, 22, "UInt")
    NumPut(1, injectData, 26, "UInt")
    NumPut(0xC3, injectData, 30, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    ErrorLevel := ERROR_OK
    return true
}
disableCheckpoint()
{
    if(!checkHandles())
    return false
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(enablecp, 4, 0)
    NumPut(0,enablecp,0,"Int")
    writeRaw(hGTA, dwAddress+0x24, &enablecp, 4)
    ErrorLevel := ERROR_OK
    return true
}
IsMarkerCreated(){
    If(!checkHandles())
    return false
    active := readMem(hGTA, CheckpointCheck, 1, "byte")
    If(!active)
    return 0
    else return 1
}
CoordsFromRedmarker(){
    if(!checkhandles())
    return false
    for i, v in rmaddrs
    f%i% := readFloat(hGTA, v)
    return [f1, f2, f3]
}
getCoordinates() {
    if(!checkHandles())
    return ""
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
GetPlayerPos(ByRef fX,ByRef fY,ByRef fZ) {
    if(!checkHandles())
    return 0
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
}
getDialogStructPtr() {
    if (!checkHandles()) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    dwPointer := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return dwPointer
}
isDialogOpen() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwIsOpen := readMem(hGTA, dwPointer + SAMP_DIALOG_OPEN_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return dwIsOpen ? true : false
}
getDialogStyle() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    style := readMem(hGTA, dwPointer + SAMP_DIALOG_STYLE_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return style
}
getDialogID() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    id := readMem(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return id
}
setDialogID(id) {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    writeMemory(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, id, "UInt", 4)
    if (ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
getDialogIndex() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    index := readMem(hGTA, dwPointer + SAMP_DIALOG_INDEX_OFFSET, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return index + 1
}
getDialogCaption() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    text := readString(hGTA, dwPointer + SAMP_DIALOG_CAPTION_OFFSET, 64)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return text
}
getDialogTextSize(dwAddress) {
    i := 0
    Loop, 4096 {
        i := A_Index - 1
        byte := Memory_ReadByte(hGTA, dwAddress + i)
        if (!byte)
        break
    }
    return i
}
getDialogText() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_TEXT_PTR_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    text := readString(hGTA, dwPointer, 4096)
    if (ErrorLevel) {
        text := readString(hGTA, dwPointer, getDialogTextSize(dwPointer))
        if (ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return ""
        }
    }
    ErrorLevel := ERROR_OK
    return text
}
getDialogLineCount() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINECOUNT_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return count
}
getDialogLine__(index) {
    if (getDialogLineCount > index)
    return ""
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
    line := readString(hGTA, dwLineAddress, 128)
    ErrorLevel := ERROR_OK
    return line
}
getDialogLine(index) {
    lines := getDialogLines()
    if (index > lines.Length())
    return ""
    if (getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS)
    index++
    return lines[index]
}
getDialogLines() {
    text := getDialogText()
    if (text == "")
    return -1
    lines := StrSplit(text, "`n")
    return lines
}
isDialogButton1Selected() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    selected := readMem(hGTA, dwPointer + SAMP_DIALOG_BUTTON_HOVERING_OFFSET, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return selected
}
getDialogLines__() {
    count := getDialogLineCount()
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    lines := []
    Loop %count% {
        dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
        lines[A_Index] := readString(hGTA, dwLineAddress, 128)
    }
    ErrorLevel := ERROR_OK
    return lines
}
showDialog(style, caption, text, button1, button2 := "", id := 1933) {
    style += 0
    style := Floor(style)
    id += 0
    id := Floor(id)
    caption := "" caption
    text := "" text
    button1 := "" button1
    button2 := "" button2
    if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
    return false
    if (!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
    if (ErrorLevel || !dwAddress) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    writeString(hGTA, pParam5, caption)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam1, text)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam5 + 512, button1)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam5+StrLen(caption)+1, button2)
    if (ErrorLevel)
    return false
    dwLen := 5 + 7 * 5 + 5 + 1
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(0, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam5+StrLen(caption), injectData, 11, "UInt")
    NumPut(0x68, injectData, 15, "UChar")
    NumPut(pParam5 + 512, injectData, 16, "UInt")
    NumPut(0x68, injectData, 20, "UChar")
    NumPut(pParam1, injectData, 21, "UInt")
    NumPut(0x68, injectData, 25, "UChar")
    NumPut(pParam5, injectData, 26, "UInt")
    NumPut(0x68, injectData, 30, "UChar")
    NumPut(style, injectData, 31, "UInt")
    NumPut(0x68, injectData, 35, "UChar")
    NumPut(id, injectData, 36, "UInt")
    NumPut(0xE8, injectData, 40, "UChar")
    offset := dwFunc - (pInjectFunc + 45)
    NumPut(offset, injectData, 41, "Int")
    NumPut(0xC3, injectData, 45, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if (ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if (ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
initZonesAndCities() {
    AddCity("Las Venturas", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
    AddCity("San Fierro", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
    AddCity("San Fierro", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
    AddCity("San Fierro", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
    AddCity("Los Santos", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
    AddCity("Los Santos", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
    AddCity("Tierra Robada", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
    AddCity("Red County", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
    AddCity("Flint County", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
    AddCity("Whetstone", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
    AddZone("Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169)
    AddZone("Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406)
    AddZone("Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700)
    AddZone("Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406)
    AddZone("Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000)
    AddZone("Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000)
    AddZone("East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916)
    AddZone("LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916)
    AddZone("Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916)
    AddZone("Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100)
    AddZone("Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916)
    AddZone("Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508)
    AddZone("LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916)
    AddZone("Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916)
    AddZone("Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916)
    AddZone("Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916)
    AddZone("Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000)
    AddZone("Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874)
    AddZone("Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406)
    AddZone("Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000)
    AddZone("Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000)
    AddZone("Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074)
    AddZone("Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916)
    AddZone("Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916)
    AddZone("Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916)
    AddZone("Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000)
    AddZone("Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916)
    AddZone("Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916)
    AddZone("Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916)
    AddZone("Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916)
    AddZone("Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916)
    AddZone("Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000)
    AddZone("Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916)
    AddZone("Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916)
    AddZone("Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916)
    AddZone("Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916)
    AddZone("Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916)
    AddZone("Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511)
    AddZone("Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916)
    AddZone("Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916)
    AddZone("The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916)
    AddZone("Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916)
    AddZone("Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916)
    AddZone("Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916)
    AddZone("Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000)
    AddZone("Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000)
    AddZone("Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916)
    AddZone("Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916)
    AddZone("Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916)
    AddZone("Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916)
    AddZone("The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916)
    AddZone("Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916)
    AddZone("Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916)
    AddZone("Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000)
    AddZone("Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916)
    AddZone("Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916)
    AddZone("Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916)
    AddZone("LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916)
    AddZone("Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916)
    AddZone("Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916)
    AddZone("Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916)
    AddZone("Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916)
    AddZone("Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916)
    AddZone("Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000)
    AddZone("Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500)
    AddZone("Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916)
    AddZone("Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916)
    AddZone("East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916)
    AddZone("Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916)
    AddZone("Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916)
    AddZone("Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916)
    AddZone("Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916)
    AddZone("Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916)
    AddZone("Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000)
    AddZone("Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916)
    AddZone("Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916)
    AddZone("Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916)
    AddZone("Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916)
    AddZone("Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916)
    AddZone("Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916)
    AddZone("Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916)
    AddZone("Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000)
    AddZone("Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916)
    AddZone("Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916)
    AddZone("Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916)
    AddZone("Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916)
    AddZone("Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916)
    AddZone("Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916)
    AddZone("Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916)
    AddZone("Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916)
    AddZone("Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916)
    AddZone("Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916)
    AddZone("Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916)
    AddZone("Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916)
    AddZone("Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916)
    AddZone("Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916)
    AddZone("Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916)
    AddZone("Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000)
    AddZone("Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000)
    AddZone("The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916)
    AddZone("Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916)
    AddZone("Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916)
    AddZone("Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916)
    AddZone("Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916)
    AddZone("Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916)
    AddZone("The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000)
    AddZone("Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916)
    AddZone("Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916)
    AddZone("Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916)
    AddZone("Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000)
    AddZone("Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916)
    AddZone("Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916)
    AddZone("Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916)
    AddZone("Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916)
    AddZone("Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916)
    AddZone("Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916)
    AddZone("Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916)
    AddZone("Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916)
    AddZone("Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916)
    AddZone("Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916)
    AddZone("King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000)
    AddZone("Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916)
    AddZone("Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000)
    AddZone("Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916)
    AddZone("Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916)
    AddZone("Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000)
    AddZone("Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916)
    AddZone("Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916)
    AddZone("LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916)
    AddZone("Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000)
    AddZone("Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916)
    AddZone("Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916)
    AddZone("Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916)
    AddZone("Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916)
    AddZone("Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916)
    AddZone("Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000)
    AddZone("Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000)
    AddZone("Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916)
    AddZone("Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916)
    AddZone("Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916)
    AddZone("Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916)
    AddZone("East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916)
    AddZone("Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916)
    AddZone("Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000)
    AddZone("Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916)
    AddZone("Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916)
    AddZone("The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916)
    AddZone("Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916)
    AddZone("Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000)
    AddZone("Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916)
    AddZone("Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916)
    AddZone("Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916)
    AddZone("Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916)
    AddZone("Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916)
    AddZone("Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916)
    AddZone("Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916)
    AddZone("Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916)
    AddZone("Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916)
    AddZone("Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916)
    AddZone("Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916)
    AddZone("Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916)
    AddZone("Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916)
    AddZone("Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916)
    AddZone("Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916)
    AddZone("Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916)
    AddZone("East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916)
    AddZone("Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000)
    AddZone("Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916)
    AddZone("Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000)
    AddZone("El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000)
    AddZone("Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916)
    AddZone("Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000)
    AddZone("The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916)
    AddZone("Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000)
    AddZone("Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916)
    AddZone("Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000)
    AddZone("Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916)
    AddZone("Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916)
    AddZone("East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916)
    AddZone("Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916)
    AddZone("Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385)
    AddZone("Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916)
    AddZone("East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916)
    AddZone("Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916)
    AddZone("Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916)
    AddZone("Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916)
    AddZone("Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916)
    AddZone("East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916)
    AddZone("Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916)
    AddZone("Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000)
    AddZone("Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916)
    AddZone("Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000)
    AddZone("The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916)
    AddZone("Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916)
    AddZone("Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916)
    AddZone("Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000)
    AddZone("King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000)
    AddZone("El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916)
    AddZone("Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916)
    AddZone("The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916)
    AddZone("Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916)
    AddZone("Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916)
    AddZone("The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916)
    AddZone("Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916)
    AddZone("Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916)
    AddZone("Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916)
    AddZone("Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916)
    AddZone("Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916)
    AddZone("Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916)
    AddZone("King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000)
    AddZone("Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916)
    AddZone("Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916)
    AddZone("Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916)
    AddZone("Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000)
    AddZone("The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916)
    AddZone("Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916)
    AddZone("Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916)
    AddZone("Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916)
    AddZone("Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916)
    AddZone("Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916)
    AddZone("Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000)
    AddZone("Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000)
    AddZone("Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000)
    AddZone("Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916)
    AddZone("City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000)
    AddZone("Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000)
    AddZone("The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916)
    AddZone("Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000)
    AddZone("Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916)
    AddZone("Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916)
    AddZone("Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916)
    AddZone("El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916)
    AddZone("Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000)
    AddZone("Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000)
    AddZone("Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000)
    AddZone("Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000)
    AddZone("Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916)
    AddZone("Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000)
    AddZone("Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916)
    AddZone("Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385)
    AddZone("Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916)
    AddZone("Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916)
    AddZone("Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916)
    AddZone("Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916)
    AddZone("Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916)
    AddZone("Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000)
    AddZone("Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000)
    AddZone("K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916)
    AddZone("Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916)
    AddZone("Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916)
    AddZone("Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916)
    AddZone("Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916)
    AddZone("Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916)
    AddZone("East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916)
    AddZone("Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916)
    AddZone("Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000)
    AddZone("Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916)
    AddZone("Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916)
    AddZone("Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000)
    AddZone("Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916)
    AddZone("Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916)
    AddZone("Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000)
    AddZone("Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000)
    AddZone("Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916)
    AddZone("Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916)
    AddZone("Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916)
    AddZone("The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916)
    AddZone("El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000)
    AddZone("Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000)
    AddZone("Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916)
    AddZone("Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916)
    AddZone("Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000)
    AddZone("Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916)
    AddZone("Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916)
    AddZone("Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916)
    AddZone("Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916)
    AddZone("'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000)
    AddZone("Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000)
    AddZone("El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000)
    AddZone("Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000)
    AddZone("Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000)
    AddZone("Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000)
    AddZone("Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916)
    AddZone("East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916)
    AddZone("San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000)
    AddZone("Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000)
    AddZone("Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916)
    AddZone("Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916)
    AddZone("Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916)
    AddZone("Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000)
    AddZone("Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000)
    AddZone("LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916)
    AddZone("Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916)
    AddZone("Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000)
    AddZone("El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000)
    AddZone("Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000)
    AddZone("Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916)
    AddZone("San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000)
    AddZone("Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000)
    AddZone("The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916)
    AddZone("Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916)
    AddZone("Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000)
    AddZone("Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000)
    AddZone("Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916)
    AddZone("Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916)
    AddZone("Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916)
    AddZone("Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000)
    AddZone("Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000)
    AddZone("Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000)
    AddZone("The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981)
    AddZone("The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000)
    AddZone("Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000)
    AddZone("Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000)
    AddZone("Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000)
    AddZone("Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000)
    AddZone("Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916)
    AddZone("Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916)
    AddZone("Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916)
    AddZone("Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916)
    AddZone("Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000)
    AddZone("Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000)
    AddZone("Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000)
    AddZone("Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916)
    AddZone("Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916)
    AddZone("Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916)
    AddZone("Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916)
    AddZone("Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916)
    AddZone("Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000)
    AddZone("Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916)
    AddZone("Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000)
    AddZone("Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000)
    AddZone("Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916)
    AddZone("Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000)
    AddZone("Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000)
    AddZone("Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916)
    AddZone("Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000)
    AddZone("Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083)
    AddZone("Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000)
    AddZone("Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000)
    AddZone("Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000)
    AddZone("Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000)
    AddZone("Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000)
    AddZone("Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916)
    AddZone("Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000)
    AddZone("Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000)
    AddZone("North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000)
    AddZone("Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761)
    AddZone("Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916)
    AddZone("Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000)
    AddZone("San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000)
    AddZone("Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000)
    AddZone("Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083)
    AddZone("Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083)
    AddZone("Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000)
    AddZone("The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000)
    AddZone("Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000)
    AddZone("Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000)
    AddZone("Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083)
    AddZone("Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000)
    AddZone("Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000)
    AddZone("Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000)
    AddZone("Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000)
    AddZone("Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000)
    AddZone("San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000)
    AddZone("Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000)
    AddZone("Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000)
    AddZone("Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000)
}
calculateZone(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Unbekannt"
}
calculateCity(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Unbekannt"
    currentCitySize := 0
    smallestCitySize := 0
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Unbekannt") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    if(smallestCity == "Unbekannt") {
        ErrorLevel := ERROR_CITY_NOT_FOUND
    } else {
        ErrorLevel := ERROR_OK
    }
    return smallestCity
}
AddZone(sName, x1, y1, z1, x2, y2, z2) {
    global
    zone%nZone%_name := sName
    zone%nZone%_x1 := x1
    zone%nZone%_y1 := y1
    zone%nZone%_z1 := z1
    zone%nZone%_x2 := x2
    zone%nZone%_y2 := y2
    zone%nZone%_z2 := z2
    nZone := nZone + 1
}
AddCity(sName, x1, y1, z1, x2, y2, z2) {
    global
    city%nCity%_name := sName
    city%nCity%_x1 := x1
    city%nCity%_y1 := y1
    city%nCity%_z1 := z1
    city%nCity%_x2 := x2
    city%nCity%_y2 := y2
    city%nCity%_z2 := z2
    nCity := nCity + 1
}
IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius)
{
    GetPlayerPos(posX, posY, posZ)
    X := posX -_posX
    Y := posY -_posY
    Z := posZ -_posZ
    if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
    return TRUE
    return FALSE
}
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
    GetPlayerPos(posX, posY, posZ)
    X := posX - _posX
    Y := posY - _posY
    if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
    return TRUE
    return FALSE
}
getPlayerZone()
{
    aktPos := getCoordinates()
    return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}
getPlayerCity()
{
    aktPos := getCoordinates()
    return calculateCity(aktPos[1], aktPos[2], aktPos[3])
}
AntiCrash(){
    If(!checkHandles())
    return false
    cReport := ADDR_SAMP_CRASHREPORT
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
    cReport += 0x9
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
}
writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    VarSetCapacity(finalvalue,length, 0)
    NumPut(writevalue,finalvalue,0,datatype)
    dwRet :=  DllCall(  "WriteProcessMemory"
    ,"Uint",hProcess
    ,"Uint",address
    ,"Uint",&finalvalue
    ,"Uint",length
    ,"Uint",0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
checkHandles() {
    if(iRefreshHandles+500>A_TickCount)
    return true
    iRefreshHandles:=A_TickCount
    if(!refreshGTA() || !refreshSAMP() || !refreshMemory()) {
        return false
    } else {
        return true
    }
    return true
}
refreshGTA() {
    newPID := getPID("GTA:SA:MP")
    if(!newPID) {
        if(hGTA) {
            virtualFreeEx(hGTA, pMemory, 0, 0x8000)
            closeProcess(hGTA)
            hGTA := 0x0
        }
        dwGTAPID := 0
        hGTA := 0x0
        dwSAMP := 0x0
        pMemory := 0x0
        return false
    }
    if(!hGTA || (dwGTAPID != newPID)) {
        hGTA := openProcess(newPID)
        if(ErrorLevel) {
            dwGTAPID := 0
            hGTA := 0x0
            dwSAMP := 0x0
            pMemory := 0x0
            return false
        }
        dwGTAPID := newPID
        dwSAMP := 0x0
        pMemory := 0x0
        return true
    }
    return true
}
refreshSAMP() {
    if(dwSAMP)
    return true
    dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
    if(!dwSAMP)
    return false
    return true
}
refreshMemory() {
    if(!pMemory) {
        pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
        if(ErrorLevel) {
            pMemory := 0x0
            return false
        }
        pParam1     := pMemory
        pParam2     := pMemory + 1024
        pParam3     := pMemory + 2048
        pParam4     := pMemory + 3072
        pParam5     := pMemory + 4096
        pInjectFunc := pMemory + 5120
    }
    return true
}
getPID(szWindow) {
    local dwPID := 0
    WinGet, dwPID, PID, %szWindow%
    return dwPID
}
openProcess(dwPID, dwRights = 0x1F0FFF) {
    hProcess := DllCall("OpenProcess"
    , "UInt", dwRights
    , "int",  0
    , "UInt", dwPID
    , "Uint")
    if(hProcess == 0) {
        ErrorLevel := ERROR_OPEN_PROCESS
        return 0
    }
    ErrorLevel := ERROR_OK
    return hProcess
}
closeProcess(hProcess) {
    if(hProcess == 0) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "CloseHandle"
    , "Uint", hProcess
    , "UInt")
    ErrorLevel := ERROR_OK
}
getModuleBaseAddress(sModule, hProcess) {
    if(!sModule) {
        ErrorLevel := ERROR_MODULE_NOT_FOUND
        return 0
    }
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwSize = 1024*4
    VarSetCapacity(hMods, dwSize)
    VarSetCapacity(cbNeeded, 4)
    dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
    , "UInt", hProcess
    , "UInt", &hMods
    , "UInt", dwSize
    , "UInt*", cbNeeded
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_ENUM_PROCESS_MODULES
        return 0
    }
    dwMods := cbNeeded / 4
    i := 0
    VarSetCapacity(hModule, 4)
    VarSetCapacity(sCurModule, 260)
    while(i < dwMods) {
        hModule := NumGet(hMods, i*4)
        DllCall("Psapi.dll\GetModuleFileNameEx"
        , "UInt", hProcess
        , "UInt", hModule
        , "Str", sCurModule
        , "UInt", 260)
        SplitPath, sCurModule, sFilename
        if(sModule == sFilename) {
            ErrorLevel := ERROR_OK
            return hModule
        }
        i := i + 1
    }
    ErrorLevel := ERROR_MODULE_NOT_FOUND
    return 0
}
readString(hProcess, dwAddress, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(sRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "Str", sRead
    , "UInt", dwLen
    , "UInt*", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if A_IsUnicode
    return __ansiToUnicode(sRead)
    return sRead
}
readFloat(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, 4)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  4
    , "UInt*", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "Float")
}
readDWORD(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, 4)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  4
    , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "UInt")
}
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  dwLen
    , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, type)
}
writeString(hProcess, dwAddress, wString) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    sString := wString
    if A_IsUnicode
    sString := __unicodeToAnsi(wString)
    dwRet := DllCall(    "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "Str", sString
    , "UInt", StrLen(wString) + 1
    , "UInt", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    dwRet := DllCall(    "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "UInt", pBuffer
    , "UInt", dwLen
    , "UInt", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
Memory_ReadByte(process_handle, address) {
    VarSetCapacity(value, 1, 0)
    DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
    return, NumGet(value, 0, "Byte")
}
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    validParams := 0
    i := aParams.MaxIndex()
    dwLen := i * 5    + 5    + 1
    if(bCleanupStack)
    dwLen += 3
    VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
    i_ := 1
    while(i > 0) {
        if(aParams[i][1] != "") {
            dwMemAddress := 0x0
            if(aParams[i][1] == "p") {
                dwMemAddress := aParams[i][2]
            } else if(aParams[i][1] == "s") {
                if(i_>3)
                return false
                dwMemAddress := pParam%i_%
                writeString(hProcess, dwMemAddress, aParams[i][2])
                if(ErrorLevel)
                return false
                i_ += 1
            } else if(aParams[i][1] == "i") {
                dwMemAddress := aParams[i][2]
            } else {
                return false
            }
            NumPut(0x68, injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
        i -= 1
    }
    offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
    NumPut(0xE8, injectData, validParams * 5, "UChar")
    NumPut(offset, injectData, validParams * 5 + 1, "Int")
    if(bCleanupStack) {
        NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
        NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
        NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
    } else {
        NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
    }
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "VirtualAllocEx"
    , "UInt", hProcess
    , "UInt", 0
    , "UInt", dwSize
    , "UInt", flAllocationType
    , "UInt", flProtect
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "VirtualFreeEx"
    , "UInt", hProcess
    , "UInt", lpAddress
    , "UInt", dwSize
    , "UInt", dwFreeType
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_FREE_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "CreateRemoteThread"
    , "UInt", hProcess
    , "UInt", lpThreadAttributes
    , "UInt", dwStackSize
    , "UInt", lpStartAddress
    , "UInt", lpParameter
    , "UInt", dwCreationFlags
    , "UInt", lpThreadId
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
waitForSingleObject(hThread, dwMilliseconds) {
    if(!hThread) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "WaitForSingleObject"
    , "UInt", hThread
    , "UInt", dwMilliseconds
    , "UInt")
    if(dwRet == 0xFFFFFFFF) {
        ErrorLEvel := ERROR_WAIT_FOR_OBJECT
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
__ansiToUnicode(sString, nLen = 0) {
    If !nLen
    {
        nLen := DllCall("MultiByteToWideChar"
        , "Uint", 0
        , "Uint", 0
        , "Uint", &sString
        , "int",  -1
        , "Uint", 0
        , "int",  0)
    }
    VarSetCapacity(wString, nLen * 2)
    DllCall("MultiByteToWideChar"
    , "Uint", 0
    , "Uint", 0
    , "Uint", &sString
    , "int",  -1
    , "Uint", &wString
    , "int",  nLen)
    return wString
}
__unicodeToAnsi(wString, nLen = 0) {
    pString := wString + 1 > 65536 ? wString : &wString
    If !nLen
    {
        nLen := DllCall("WideCharToMultiByte"
        , "Uint", 0
        , "Uint", 0
        , "Uint", pString
        , "int",  -1
        , "Uint", 0
        , "int",  0
        , "Uint", 0
        , "Uint", 0)
    }
    VarSetCapacity(sString, nLen)
    DllCall("WideCharToMultiByte"
    , "Uint", 0
    , "Uint", 0
    , "Uint", pString
    , "int",  -1
    , "str",  sString
    , "int",  nLen
    , "Uint", 0
    , "Uint", 0)
    return sString
}
global REPLACE := object("\\U0430", "а", "\\U0431", "б", "\\U0432", "в",  "\\U0433", "г", "\\U0434", "д", "\\U0435", "е", "\\U0451", "ё", "\\U0436", "ж", "\\U0437", "з", "\\U0438", "и",  "\\U0439", "й", "\\U043A", "к", "\\U043B", "л", "\\U043C", "м", "\\U043D", "н", "\\U043E", "о", "\\U043F", "п",  "\\U0440", "р", "\\U0441", "с", "\\U0442", "т", "\\U0443", "у", "\\U0444", "ф", "\\U0445", "х", "\\U0446", "ц",  "\\U0447", "ч", "\\U0448", "ш", "\\U0449", "щ", "\\U044A", "ъ", "\\U044B", "ы", "\\U044C", "ь", "\\U044D", "э",  "\\U044E", "ю", "\\U044F", "я", "\\U0410", "А", "\\U0411", "Б", "\\U0412", "В", "\\U0413", "Г", "\\U0414", "Д",  "\\U0415", "Е", "\\U0401", "Ё", "\\U0416", "Ж", "\\U0417", "З", "\\U0418", "И", "\\U0419", "Й", "\\U041A", "К",  "\\U041B", "Л", "\\U041C", "М", "\\U041D", "Н", "\\U041E", "О", "\\U041F", "П", "\\U0420", "Р", "\\U0421", "С",  "\\U0422", "Т", "\\U0423", "У", "\\U0424", "Ф", "\\U0425", "Х", "\\U0426", "Ц", "\\U0427", "Ч", "\\U0428", "Ш",  "\\U0429", "Щ", "\\U042A", "Ъ", "\\U042B", "Ы", "\\U042C", "Ь", "\\U042D", "Э", "\\U042E", "Ю", "\\U042F", "Я")
decode(text)
{
    global
    res := text
    for key, val in REPLACE
    res := RegExReplace(res, "i)"key, val)
    return res
}
class JSON
{
    Load(ByRef src, jsonize:=false)
    {
        static q := Chr(34)
        args := jsonize ? [ JSON.Object, JSON.Array ] : []
        key := "", is_key := false
        stack := [ tree := [] ]
    is_arr := { (tree): 1 }
        next := q . "{[01234567890-tfn"
            pos := 0
            while ( (ch := SubStr(src, ++pos, 1)) != "" )
            {
                if InStr(" `t`n`r", ch)
                continue
                if !InStr(next, ch)
                {
                    ln  := ObjLength(StrSplit(SubStr(src, 1, pos), "`n"))
                    col := pos - InStr(src, "`n",, -(StrLen(src)-pos+1))
                msg := Format("{}: line {} col {} (char {})"
                    ,   (next == "")      ? ["Extra data", ch := SubStr(src, pos)][1]
                    : (next == "'")     ? "Unterminated string starting at"
                    : (next == "\")     ? "Invalid \escape"
                    : (next == ":")     ? "Expecting ':' delimiter"
                    : (next == q)       ? "Expecting object key enclosed in double quotes"
                : (next == q . "}") ? "Expecting object key enclosed in double quotes or object closing '}'"
            : (next == ",}")    ? "Expecting ',' delimiter or object closing '}'"
            : (next == ",]")    ? "Expecting ',' delimiter or array closing ']'"
            : [ "Expecting JSON value(string, number, [true, false, null], object or array)"
        , ch := SubStr(src, pos, (SubStr(src, pos)~="[\]\},\s]|$")-1) ][1]
        , ln, col, pos)
        throw Exception(msg, -1, ch)
    }
    is_array := is_arr[obj := stack[1]]
    if i := InStr("{[", ch)
        {
        val := (proto := args[i]) ? new proto : {}
            is_array? ObjPush(obj, val) : obj[key] := val
            ObjInsertAt(stack, 1, val)
            is_arr[val] := !(is_key := ch == "{")
            next := q . (is_key ? "}" : "{[]0123456789-tfn")
            }
        else if InStr("}]", ch)
        {
            ObjRemoveAt(stack, 1)
        next := stack[1]==tree ? "" : is_arr[stack[1]] ? ",]" : ",}"
    }
    else if InStr(",:", ch)
    {
        is_key := (!is_array && ch == ",")
        next := is_key ? q : q . "{[0123456789-tfn"
        }
        else
        {
            if (ch == q)
            {
                i := pos
                while i := InStr(src, q,, i+1)
                {
                    val := StrReplace(SubStr(src, pos+1, i-pos-1), "\\", "\u005C")
                    static end := A_AhkVersion<"2" ? 0 : -1
                    if (SubStr(val, end) != "\")
                    break
                }
                if !i ? (pos--, next := "'") : 0
                continue
                pos := i
                val := StrReplace(val,    "\/",  "/")
                , val := StrReplace(val, "\" . q,    q)
                , val := StrReplace(val,    "\b", "`b")
                , val := StrReplace(val,    "\f", "`f")
                , val := StrReplace(val,    "\n", "`n")
                , val := StrReplace(val,    "\r", "`r")
                , val := StrReplace(val,    "\t", "`t")
                i := 0
                while (i := InStr(val, "\",, i+1))
                {
                    if (SubStr(val, i+1, 1) != "u") ? (pos -= StrLen(SubStr(val, i)), next := "\") : 0
                    continue 2
                    xxxx := Abs("0x" . SubStr(val, i+2, 4))
                    if (A_IsUnicode || xxxx < 0x100)
                    val := SubStr(val, 1, i-1) . Chr(xxxx) . SubStr(val, i+6)
                }
                if is_key
                {
                    key := val, next := ":"
                    continue
                }
            }
            else
            {
            val := SubStr(src, pos, i := RegExMatch(src, "[\]\},\s]|$",, pos)-pos)
            static null := ""
            if InStr(",true,false,null,", "," . val . ",", true)
            val := %val%
            else if (Abs(val) == "") ? (pos--, next := "#") : 0
            continue
            val := val + 0, pos += i-1
        }
        is_array? ObjPush(obj, val) : obj[key] := val
    next := obj==tree ? "" : is_array ? ",]" : ",}"
}
}
return tree[1]
}
Dump(obj:="", indent:="", lvl:=1)
{
static q := Chr(34)
if IsObject(obj)
{
static Type := Func("Type")
if Type ? (Type.Call(obj) != "Object") : (ObjGetCapacity(obj) == "")
throw Exception("Object type not supported.", -1, Format("<Object at 0x{:p}>", &obj))
is_array := 0
for k in obj
is_array := (k == A_Index)
until !is_array
static integer := "integer"
if indent is %integer%
{
    if (indent < 0)
    throw Exception("Indent parameter must be a postive integer.", -1, indent)
    spaces := indent, indent := ""
    Loop % spaces
    indent .= " "
}
indt := ""
Loop, % indent ? lvl : 0
indt .= indent
lvl += 1, out := ""
for k, v in obj
{
    if IsObject(k) || (k == "")
throw Exception("Invalid object key.", -1, k ? Format("<Object at 0x{:p}>", &obj) : "<blank>")
    if !is_array
    out .= ( ObjGetCapacity([k], 1) ? JSON.Dump(k) : q . k . q )
    .  ( indent ? ": " : ":" )
    out .= JSON.Dump(v, indent, lvl)
    .  ( indent ? ",`n" . indt : "," )
}
if (out != "")
{
    out := Trim(out, ",`n" indent)
    if (indent != "")
    out := "`n" . indt . out . "`n" . SubStr(indt, StrLen(indent)+1)
}
return is_array ? "[" . out . "]" : "{" . out . "}"
}
if (ObjGetCapacity([obj], 1) == "")
return obj
if (obj != "")
{
obj := StrReplace(obj,  "\",    "\\")
, obj := StrReplace(obj,  "/",    "\/")
, obj := StrReplace(obj,    q, "\" . q)
, obj := StrReplace(obj, "`b",    "\b")
, obj := StrReplace(obj, "`f",    "\f")
, obj := StrReplace(obj, "`n",    "\n")
, obj := StrReplace(obj, "`r",    "\r")
, obj := StrReplace(obj, "`t",    "\t")
static needle := (A_AhkVersion<"2" ? "O)" : "") . "[^\x20-\x7e]"
while RegExMatch(obj, needle, m)
obj := StrReplace(obj, m[0], Format("\u{:04X}", Ord(m[0])))
}
return q . obj . q
}
class Object
{
__New(args*)
{
if ((len := ObjLength(args)) & 1)
throw Exception("Too few parameters passed to function.", -1, len)
ObjRawSet(this, "_", [])
Loop % len//2
this[args[A_Index*2-1]] := args[A_Index*2]
}
__Set(key, args*)
{
ObjPush(this._, key)
}
Delete(FirstKey, LastKey*)
{
IsRange := ObjLength(LastKey)
i := 0
for index, key in ObjClone(this._)
if IsRange ? (key >= FirstKey && key <= LastKey[1]) : (key = FirstKey)
{
    ObjRemoveAt(this._, index - (i++))
    if !IsRange
    break
}
return ObjDelete(this, FirstKey, LastKey*)
}
Dump(indent:="")
{
return JSON.Dump(this, indent)
}
static Stringify := JSON.Object.Dump
_NewEnum()
{
static enum := { "Next": JSON.Object._EnumNext }
return { base: enum, enum: ObjNewEnum(this._), obj: this }
}
_EnumNext(ByRef key, ByRef val:="")
{
if r := this.enum.Next(, key)
val := this.obj[key]
return r
}
static InsertAt := "", RemoveAt := "", Push := "", Pop := ""
}
class Array
{
__New(args*)
{
args.base := this.base
return args
}
Dump(indent:="")
{
return JSON.Dump(this, indent)
}
static Stringify := JSON.Array.Dump
}
static Parse := JSON.Load
static Stringify := JSON.Dump
}
SetKeyDelay, 0
global Version := "2.13"
Menu, Tray, nostandard
Menu, Tray, deleteall
Menu, Tray, Add, Свернуть, goHideTray
Menu, tray, default, Свернуть
Menu, Tray, Add, Выход, GuiClose
Menu, Tray, Click, 1
Gui, Load:-caption -sysmenu +AlwaysOnTop +Border
Gui, Load:font, S16
Gui, Load:Add, Text, x0 y8 w200 h40 Center, Загрузка...
Gui, Load:Show, w200 h40
loop 10
{
VarSetCapacity(SetRead%A_Index%, 4, 0)
NumPut(A_Index+1000,SetRead%A_Index%,0,"Int")
}
global iniFile := A_MyDocuments "\GTA San Andreas User Files\SAMP\AHelper\config.ini"
global bDir := A_MyDocuments "\GTA San Andreas User Files\SAMP\AHelper"
global KeyList := Object(), KeySetList := Object()
global isOpenChat := 0
KeyList := ["LastPM", "LastRe", "AChat", "ReOff", "ReAC", "SCapt", "Duty"]
KeySetList := ["Time", "ConOff", "EventYes", "EventNo"]
global BindCount := 57
global Saved := false, isError := false, LoadConnect := false
global Event := Object()
global WS_VSCROLL := 0x200000, SIZE_MINIMIZED := 1, SIF_RANGE := 0x1, SIF_PAGE := 0x2
, SB_VERT := 1, SB_LINEUP := 0, SB_LINEDOWN := 1, WM_VSCROLL := 0x115
IfNotExist, %bDir%
FileCreateDir, %bDir%
if(!FileExist(iniFile))
FileAppend,
	(
[settings]
ALevel=1
isOpenT=1
DutySkin=294
isOpenHide=0
isAuthDuty=0
isAuthConoff=0
isIStatsRe=0
WarnText=мать ебал, мамку ебал,мамку, мамке, ебал мать,твою мать, твоя мать, твою мамку, mamky, m q, m.q, mamka, мку, mq, ебал, привет
[keys]
KeyLastPM=!3
KeyLastRe=!1
KeyAChat=!4
KeyReOff=F4
KeyReAC=!2
KeySCapt=F3
KeyDuty=F5
KeyBanda=F9
KeyTime=!6
KeyConOff=5
KeyEventNo=F2
), %IniFile%
global tabId := 1, ipChecked := false, isConoff := false, Hidded := false, LastReconID := -1, isExit := false, isConoff := false, isReading := false, isNoCaps := false, isBanda := false
global isBind := Object()
global offLine := 248
global WarnTextEx
SetTimer, readChat, 30
LoadIniFile()
LoadBinds()
if(!Alevel)
Alevel := 1
LoadIniFile()
{
global
Alevel := ReadIni("settings", "ALevel")
DutySkin := ReadIni("settings", "DutySkin")
isOpenT := ReadIni("settings", "isOpenT")
isOpenHide := ReadIni("settings", "isOpenHide")
isAuthDuty := ReadIni("settings", "isAuthDuty")
isAuthConoff := ReadIni("settings", "isAuthConoff")
isIStatsRe := ReadIni("settings", "isIStatsRe")
WarnText := ReadIni("settings", "WarnText")
cServerID := ReadIni("settings", "ConnectServer")
geoOpen := ReadIni("settings", "GeoOpen")
if(geoOpen != 1 && geoOpen != 2)
geoOpen := 1
WarnTextEx := ""
Loop, parse, WarnText
{
if(RegExMatch(A_LoopField, "[0-9A-Za-zА-Яа-я ]"))
WarnTextEx .= A_LoopField
else
WarnTextEx .= "\" A_LoopField
}
StringLower, WarnTextEx, WarnTextEx
WarnTextEx := RegExReplace(WarnTextEx, "\\\, ", "|")
WarnTextEx := RegExReplace(WarnTextEx, "\\\,", "|")
WarnTextEx := RegExReplace(WarnTextEx, "\r", "")
WarnTextEx := RegExReplace(WarnTextEx, "\n", "")
WarnTextEx := RegExReplace(WarnTextEx, "\rn", "")
if(cServerID != 1 && cServerID != 2)
cServerID := 1
RegRead, UserName, HKEY_CURRENT_USER, Software\SAMP, PlayerName
for fIndex, nKey in KeyList
{
Key%nKey% := ReadIni("keys", "Key" nKey)
gKey := Key%nKey%
if(strlen(Key%nKey%))
{
if(!isBind["Key" gKey])
isBind["Key" gKey] := true
}
}
for fIndex, nKey in KeySetList
{
Key%nKey% := ReadIni("keys", "Key" nKey)
gKey := Key%nKey%
if(strlen(Key%nKey%))
{
if(!isBind["Key" gKey])
isBind["Key" gKey] := true
}
}
loop %BindCount%
{
BindSTR := ReadIni("binds", "Bind" A_Index)
if(!strlen(BindSTR))
continue
if(!RegExMatch(BindSTR, "^\[KEY\:\[(.*)\]\]\[MSG\:\[(.*)\]\]\[ENTER\:\[(.*)\]\]\[RETEXT\:\[(.*)\]\]$", rBind))
continue
KeyBinds%A_Index% := rBind1
BindMessage%A_Index% := rBind2
BindEnter%A_Index% := rBind3
BindRetext%A_Index% := rBind4
if(!strlen(BindEnter%A_Index%))
BindEnter%A_Index% := 0
if(!strlen(BindRetext%A_Index%))
BindRetext%A_Index% := 0
gKey := KeyBinds%A_Index%
if(strlen(gKey))
{
if(!isBind["Key" gKey])
isBind["Key" gKey] := true
if(!isBind["bKey" gKey])
isBind["bKey" gKey] := true
}
}
return
}
SaveIniFile()
{
global
unLoadBinds()
GuiControlGet, eAlevel, Main:
GuiControlGet, eDutySkin, guiMainMenu:
GuiControlGet, eisOpenT, guiMainMenu:
GuiControlGet, ecServerID, % (LoadConnect?"LoadConnect:":"guiMainMenu:")
if(LoadConnect)
GuiControl, guiMainMenu:Choose, ecServerID, %ecServerID%
GuiControlGet, egeoOpen, guiMainMenu:
WriteIni(eAlevel, "settings", "ALevel")
WriteIni(ecServerID, "settings", "ConnectServer")
WriteIni(eisOpenT, "settings", "isOpenT")
WriteIni(egeoOpen, "settings", "GeoOpen")
geoOpen := egeoOpen
cServerID := ecServerID
if(eDutySkin > 310)
{
GuiControl, , eDutySkin, 310
eDutySkin := 310
showError("ID скина не может привышать 310")
}
if(eAlevel > 0)
WriteIni(eDutySkin, "settings", "DutySkin")
for fIndex, nKey in KeyList
{
tKey := "eKey" nKey
GuiControlGet, gKey, guiMainMenu: , %tKey%
gKey := GetKeysVK(gKey)
if(RegExMatch(gKey,"^(\!|\#|\^|\+)$"))
{
OldKey := Key%nKey%
GuiControl, , %tKey%, %OldKey%
continue
}
oKey := Key%nKey%
if(gKey != oKey && strlen(gKey) && isBind["Key" gKey])
{
showError("Клавиша " HKToStr(gKey) " уже используется")
OldKey := Key%nKey%
GuiControl, guiMainMenu:, %tKey%, %OldKey%
continue
}
if(isBind["Key" oKey])
isBind["Key" oKey] := false
if(!isBind["Key" gKey])
isBind["Key" gKey] := true
WriteIni(gKey, "keys", "Key" nKey)
}
GuiControlGet, eisOpenHide, guiMainMenu:
WriteIni(eisOpenHide, "settings", "isOpenHide")
GuiControlGet, eisAuthDuty, guiMainMenu:
WriteIni(eisAuthDuty, "settings", "isAuthDuty")
GuiControlGet, eisAuthConoff, guiMainMenu:
WriteIni(eisAuthConoff, "settings", "isAuthConoff")
GuiControlGet, eisIStatsRe, guiMainMenu:
WriteIni(eisIStatsRe, "settings", "isIStatsRe")
for fIndex, nKey in KeySetList
{
tKey := "eKey" nKey
GuiControlGet, gKey, guiMainMenu: , %tKey%
gKey := GetKeysVK(gKey)
if(RegExMatch(gKey,"^(\!|\#|\^|\+)$"))
{
OldKey := Key%nKey%
GuiControl, guiMainMenu:, %tKey%, %OldKey%
continue
}
oKey := Key%nKey%
if(isBind["Key" gKey] && gKey != oKey && strlen(gKey))
{
showError("Клавиша " HKToStr(gKey) " уже используется")
OldKey := Key%nKey%
GuiControl, , %tKey%, %OldKey%
continue
}
if(isBind["Key" oKey])
isBind["Key" oKey] := false
if(!isBind["Key" gKey])
isBind["Key" gKey] := true
WriteIni(gKey, "keys", "Key" nKey)
}
LoadIniFile()
LoadBinds()
return
}
LoadBinds()
{
global
for fIndex, nKey in KeyList
{
addHotKey(Key%nKey%, "gKey" nKey)
}
for fIndex, nKey in KeySetList
{
addHotKey(Key%nKey%, "gKey" nKey)
}
loop %BindCount%
{
nKey := KeyBinds%A_Index%
if(!strlen(nKey))
continue
addHotKey(KeyBinds%A_Index%, "gKeyBinds")
}
return
}
unLoadBinds()
{
global
for fIndex, nKey in KeyList
{
delHotKey(Key%nKey%)
}
for fIndex, nKey in KeySetList
{
delHotKey(Key%nKey%)
}
loop %BindCount%
{
nKey := KeyBinds%A_Index%
if(!strlen(nKey))
continue
delHotKey(KeyBinds%A_Index%)
}
return
}
Gui, LoadConnect:Font, S8
Gui, LoadConnect:-SysMenu
Gui, LoadConnect:Add, Text, x5 y1 C424242, Введите никнейм:
Gui, LoadConnect:Add, Edit, xp+2 yp+14 w140 h18 veUserName C424242, %UserName%
Gui, LoadConnect:Add, Text, xp+145 yp w16 h19 0x12
Gui, LoadConnect:Add, Text, xp+1 yp+2 gSetOldNick Center C424242 w13 h15, X
Gui, LoadConnect:Add, Text, xp-148 yp+16 C424242, Выберите сервер:
Gui, LoadConnect:+DelimiterTab
Gui, LoadConnect:Add, DropDownList, xp+2 yp+14 w200 AltSubmit vecServerID Choose%cServerID% gSave, Monser Gang War | Server One`tMonser Gang War `| Server Two`tMonser Gang War `| Server Three
Gui, LoadConnect:+DelimiterDefault
Gui, LoadConnect:Font, S8
Gui, LoadConnect:Add, Text, x5 y70 h30 0x11
Gui, LoadConnect:Add, Text, x6 y70 w135 0x10
Gui, LoadConnect:Add, Text, xp+131 yp h30 0x11
Gui, LoadConnect:Add, Text, xp-131 yp+27 w135 0x10
Gui, LoadConnect:Font, S12
Gui, LoadConnect:Add, Text, Center xp+1 yp-24 h23 w129 c000000 ggoConnect , Подключиться
Gui, LoadConnect:Font, S8
Gui, LoadConnect:Add, Text, x141 y70 h30 0x11
Gui, LoadConnect:Add, Text, x142 y70 w135 0x10
Gui, LoadConnect:Add, Text, xp+131 yp h30 0x11
Gui, LoadConnect:Add, Text, xp-131 yp+27 w135 0x10
Gui, LoadConnect:Font, S12
Gui, LoadConnect:Add, Text, Center xp+1 yp-24 h24 w129 c000000 ggoNoConnect , Закрыть
Gui, Main:+hwndhGui
Gui, Main:Font, S14
Gui, Main:Add, Text, Center x0 y0 w640 h31 Disabled ,
Gui, Main:Add, Text, x12 y2 w300 vvarMainMenu , Главное меню
Gui, Main:Add, Text,  x3 y29 w152 h2 0x10 vbline1
Gui, Main:Add, Text, x288 y2 h31 0x11 vline2 Hidden
Gui, Main:Add, Text, x136 y29 w156 h2 0x10 vbline2
Gui, Main:Add, Text, Hidden x304 y2 w154 h2 0x10 vhline3
Gui, Main:Add, Text, x385 y2 h31 0x11 vline3 Hidden
Gui, Main:Add, Text, x289 y29 w154 h2 0x10 vbline3
Gui, Main:Font, S14
Gui, Main:Add, Text, x360 y2 h20 c1e1e1e, Уровень прав:
Gui, Main:Font, S8
Gui, Main:Add, DropDownList, x495 y5 r4 w30 Choose%Alevel% veAlevel gReAlevel, 1|2|3|4
Gui, Main:Add, Text, x535 y2 h31 0x11 vline4
Gui, Main:Font, S14
Gui, Main:Add, Text, Center x537 y2 h26 w80 ggoMenu vvarMenu, Меню
Gui, Main:Font, S8
Gui, Main:Add, Text, x461 y29 w165 h73 vmFon Hidden,
Gui, Main:Add, Text, x440 y29 w99 h2 0x10
Gui, Main:Add, Text, x535 y29 w90 h2 0x10 vbline4
Gui, Main:Add, Text, x461 y30 h75 0x11 vline5 Hidden
Gui, Main:Add, Text, x466 y53 w155 0x10 vbline5 Hidden
Gui, Main:Add, Text, x466 y76 w155 0x10 vbline6 Hidden
Gui, Main:Add, Text, x461 y100 w165 0x10 vbline7 Hidden
Gui, Main:Add, Text, x623 y2 h101 0x11 vline6 Hidden
Gui, Main:Font, S12
Gui, Main:Add, Text, Center x463 y31 w159 h22 ggoHideTray vgMenuHideKey Hidden, Свернуть в трей
Gui, Main:Add, Text, Center x463 y54 w159 h22 ggoReload vgMenuReloadKey Hidden, Перезапустить
Gui, Main:Add, Text, Center x463 y78 w159 h22 gGuiClose vgMenuCloseKey Hidden, Выйти
Gui, Main:Font, S8
Gui, guiMainMenu:+parent%hGui% -Caption
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x12 y33 w300 h253 C424242, Системные бинды
Gui, guiMainMenu:Add, Hotkey, xp+7 yp+18 w100 h18 veKeyLastPM gSave, %KeyLastPM%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Ответ на последний репорт
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyLastRe gSave, %KeyLastRe%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Слежка за последним репортом
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyReAC gSave, %KeyReAC%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeyReAC, Слежка за возможным читером
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyAChat gSave, %KeyAChat%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Написать в админ-чат
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyReOff gSave, %KeyReOff%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Выйти из неблюдения
Active := (Alevel < 2?" Disabled":"")
Gui, guiMainMenu:Add, Hotkey,%Active% xp-106 yp+18 w100 h18 veKeySCapt gSave, %KeySCapt%
Gui, guiMainMenu:Add, Text,%Active% xp+106 yp+3 h18 vtKeySCapt, Остановить захват территории
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyDuty gSave, %KeyDuty%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeyDuty, Заступить на дежуство
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyTime gSave, %KeyTime%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Показать время
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyConOff gSave, %KeyConOff%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Вкл/выкл лог подключений
Gui, guiMainMenu:Add, GroupBox, x317 y33 w300 h126 c000000, Настройки
Gui, guiMainMenu:Add, Text, xp+8 yp+18 vtDutySkin, Скин на держустве:
Gui, guiMainMenu:Add, Edit, xp+103 yp-2 Limit3 Number w30 h18 veDutySkin gSave, %DutySkin%
Gui, guiMainMenu:Add, Checkbox, xp-103 yp+18 checked%isAuthDuty% veisAuthDuty gSave , Заступать на дежуство при входе
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isAuthConoff% veisAuthConoff gSave , Отключать лог подключений при входе
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOpenHide% veisOpenHide gSave , Скрывать окно настроек в трей при запуске
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isIStatsRe% veisIStatsRe gSave  , Показывать статистику /z при входе в наблюдение
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOpenT% veisOpenT gSave, Открывать чат независимо от раскладки [Кнопка T]
Gui, guiMainMenu:Add, GroupBox, x12 y285 w300 h84 C424242, Команды
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, xp+7 yp+15, - /z [id/часть ника] - краткая информация о игроке
Gui, guiMainMenu:Add, Text, xp yp+15, - /ii [часть ника] [число показов] - Поиск игроков по нику
Gui, guiMainMenu:Add, Text, xp yp+15, - /cc [id] - Сохранить в буфер ник игрока по его ID
if(Alevel < 4)
FourActive := " Disabled"
else FourActive := ""
Gui, guiMainMenu:Add, Text, xp yp+18%FourActive% vTextGeoIP, - /geoip [id] [0/1] - Определить город по IP |
Gui, guiMainMenu:Add, DropDownList, xp+220 yp-4 w60%FourActive% AltSubmit vegeoOpen choose%geoOpen% gSave, Диалог|Чат
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x12 y372 h30 0x11
Gui, guiMainMenu:Add, Text, x13 y372 w148 0x10
Gui, guiMainMenu:Add, Text, xp+144 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-145 yp+27 w149 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w143 c000000 ggoUserSet , Биндер
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x163 y372 h30 0x11
Gui, guiMainMenu:Add, Text, x164 y372 w150 0x10
Gui, guiMainMenu:Add, Text, xp+146 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-147 yp+27 w151 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w145 c424242 gopenIni, Версия: %Version%
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x317 y158 w300 h85 C424242, Быстрое подключение к серверу
Gui, guiMainMenu:Add, Text, xp+6 yp+13 C424242, Введите никнейм:
Gui, guiMainMenu:Add, Edit, xp+2 yp+14 w140 h18 veUserName C424242, %UserName%
Gui, guiMainMenu:Add, Text, xp+145 yp w16 h19 0x12
Gui, guiMainMenu:Add, Text, xp+1 yp+2 gSetOldNick Center C424242 w13 h15, X
Gui, guiMainMenu:Add, Text, xp-148 yp+16 C424242, Выберите сервер:
Gui, guiMainMenu:+DelimiterTab
Gui, guiMainMenu:Add, DropDownList, xp+2 yp+14 w200 AltSubmit vecServerID Choose%cServerID% gSave, Monser Gang War | Server One`tMonser Gang War `| Server Two`tMonser Gang War `| Server Three
Gui, guiMainMenu:+DelimiterDefault
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x317 y242 h30 0x11
Gui, guiMainMenu:Add, Text, xp+298 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-298 yp+27 w303 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w295 c000000 ggoConnect , Подключиться
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x317 y270 w300 h136 C424242, Информация
Gui, guiMainMenu:Add, Text, xp+7 yp+14 w285, `   Данный AHK скрипт был создан специально для администрации Monser Gang War. И он в разы облегчит                       работу для администрации.`n  Первым делом нужно настроить скрипт под себя,                                     забиндить все кнопки. `nВсе AHK команды можно посмотреть в игре прописав -                                     /ahkhelp`n     Ниже представлены команды для быстрой выдачи                                        наказания.
Gui, guiMainMenu:Add, Text, xp-7 yp+121 h29 0x11
Gui, guiMainMenu:Add, Text, xp+298 yp h29 0x11
Gui, guiMainMenu:Add, Text, xp-298 yp+26 w302 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+3 yp-25 h24 w295 Center c000000 ggoHelpACMD vverHelpACMD, Посмотреть список команд
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x12 y404 h30 0x11
Gui, guiMainMenu:Add, Text, x13 y404 w301 0x10
Gui, guiMainMenu:Add, Text, xp+297 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-298 yp+27 w302 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center yp-25 h24 x15 y407 w294 c424242 vvarSubSet ggoSubSet, Обновлён - 09.10.2017
Gui, guiMainMenu:Font, S8
Gui, guiSubSet:+parent%hGui% -Caption
Gui, guiSubSet:Font, S8
Gui, guiSubSet:Add, GroupBox, x12 y33 w300 h200 C424242, Редактор
Gui, guiSubSet:Add, Text, xp+7 yp+18 w291, `    Перечислите здесь слова через запятую за которые будет выдан бан или мут с причиной "Оскорбление/упоминание родынх".
Gui, guiSubSet:Add, Edit, xp yp+44 w285 h130 veWarnText, % (WarnText?WarnText:"")
Gui, guiSubSet:Add, GroupBox, x317 y33 w300 h200 C424242, Информация
Gui, guiSubSet:Add, Text, xp+7 yp+18 w291, `    Данная функция позволяет быстро наказывать нарушителей по причине "Оскорбление/упоминание родных".`n   Если игрок напишет в чат что-то подозрительное, сервер выдаст сообщение администрации. Если в этом сообщении имеется слово(-а) из вашего списка, система "Действий" предложит вам наказать данного игрока.`n   Система совершенно безопастна благодаря проверки ника, наказать невиновного не получится.`n    Несмотря на автоматизм функции, будьте бдительны в выборе слов. Вся ответственность лежит на Вас и только на Вас.
Gui, guiSubSet:Font, S12
Gui, guiSubSet:Add, Text, x12 y236 h30 0x11
Gui, guiSubSet:Add, Text, x13 y236 w301 0x10
Gui, guiSubSet:Add, Text, xp+297 yp h30 0x11
Gui, guiSubSet:Add, Text, xp-298 yp+27 w302 0x10
Gui, guiSubSet:Font, S12
Gui, guiSubSet:Add, Text, Center xp+2 yp-24 w295 h23 ggoSaveSubSet, Сохранить изменения
Gui, guiSubSet:Font, S8
Gui, guiSubSet:Add, Text, x317 y236 h30 0x11
Gui, guiSubSet:Add, Text, x318 y236 w301 0x10
Gui, guiSubSet:Add, Text, xp+297 yp h30 0x11
Gui, guiSubSet:Add, Text, xp-298 yp+27 w302 0x10
Gui, guiSubSet:Font, S12
Gui, guiSubSet:Add, Text, Center xp+2 yp-24 w295 h23 ggoSettingsMenuInSub, Вернуться на главную
Gui, guiSubSet:Font, S8
Gui, helpCMD: -SysMenu
Gui, helpCMD:Add, GroupBox, x4 y1 w494 h262 C424242, Информация
Gui, helpCMD:Font, S8 c424242
Gui, helpCMD:Add, Text, xp+7 yp+15 w482, `    Здесь вы можете ознакомиться со всеми командами для быстрой выдачи. Остальные                                       команды можно вывести в диалоговое окно в игре.`n    /ahkhelp - посмотреть остальные команды в игре(Выводит в диалоговое окно)
Gui, helpCMD:Add, Text, xp+5 yp+43 w474 0x10
Gui, helpCMD:Font, S8 cDefault
Gui, helpCMD:Add, Text, x15 yp+5, - /ii [часть ника] [число показов] - Поиск игроков по нику
Gui, helpCMD:Add, Text, xp yp+15, - /z [ID/часть ника] - краткая информация о игроке
Gui, helpCMD:Add, Text, xp yp+15, - /cc [ID] - Сохранить в буфер ник игрока по его ID
Gui, helpCMD:Add, Text, xp yp+15, - /lid [ID] - Ответить игроку как ставится лидер
Gui, helpCMD:Add, Text, xp yp+15, - /flood [ID] - Выдать бан чата за флуд ( 10 минут )
Gui, helpCMD:Add, Text, xp yp+15, - /osk [ID] - Выдать бан чата за оскорбление игроков ( 20 минут )
Gui, helpCMD:Add, Text, xp yp+15, - /caps [ID] - Выдать бан чата за капс ( 10 минут )
Gui, helpCMD:Add, Text, xp yp+15, - /rekl [ID] - Выдать бан чата за рекламу ( 180 минут )
Gui, helpCMD:Add, Text, xp yp+15, - /crekl [ID] - Забанить игрока за рекламу
Gui, helpCMD:Add, Text, xp yp+15, - /rosk [ID] - Забанить за оскорбление родных
Gui, helpCMD:Add, Text, xp yp+15, - /aosk [ID] - Забанить за оскорбление администрации
Gui, helpCMD:Add, Text, xp yp+15, - /ma [ID] - Выдать бан чата за упоминание родных
Gui, helpCMD:Add, Text, xp yp+15, - /bb [ID] - Выдать бан чата за оффтоп в репорт ( 10 минут )
Gui, helpCMD:Font, S8 с000000
Gui, helpCMD:Add, Text, x4 y266 h30 0x11
Gui, helpCMD:Add, Text, x5 y266 w494 0x10
Gui, helpCMD:Add, Text, xp+490 yp h30 0x11
Gui, helpCMD:Add, Text, xp-490 yp+27 w494 0x10
Gui, helpCMD:Font, S12
Gui, helpCMD:Add, Text, Center xp+2 yp-24 w475 h23 C000000 ggoSettingsMenuInHelp, Закрыть справку по командам
Gui, helpCMD:Font, S8
Gui, guiUserSetKey:+parent%hGui% -Caption +hwndrKeys
Gui, guiUserSetKey:Add, Text, x0 y31 h17 w640 ,
Gui, guiUserSetKey:Add, Text, x10 y33 C424242 , Клавиша
Gui, guiUserSetKey:Add, Text, x117 y33 C424242 , Сообщение
Gui, guiUserSetKey:Add, Text, x540 y33 C424242 , Очищать
Gui, guiUserSetKey:Add, Text, x588 y33 C424242 , Ввод
Gui, guiUserSetKey:Add, Text, Center x0 y403 w640 h40 Disabled ,
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, x6 y404 h30 0x11
Gui, guiUserSetKey:Add, Text, x7 y404 w151 0x10
Gui, guiUserSetKey:Add, Text, xp+147 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-148 yp+27 w152 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w146 h23 gSaveBinds, Сохранить
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, x157 y404 h30 0x11
Gui, guiUserSetKey:Add, Text, x158 y404 w161 0x10
Gui, guiUserSetKey:Add, Text, xp+157 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-158 yp+27 w162 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w146 h23 gHelpKeys, `  Ключи / Справка
Gui, guiUserSetKey:Font, S8
Gui, guiUserSetKey:Add, Text, x320 y404 h30 0x11
Gui, guiUserSetKey:Add, Text, x321 y404 w301 0x10
Gui, guiUserSetKey:Add, Text, xp+297 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-298 yp+27 w302 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w295 h23 ggoMainMenuSub , Вернуться на главную
Gui, guiUserSetKey:Font, S8
Gui, guiUserSet:+parent%rKeys% -Caption +hwndhScroll
Gui, guiUserSet:Font, S8
Gui, guiUserSet:Add, Text, x10 y28 Hidden,
loop %BindCount%
{
Gui, guiUserSet:Add, Hotkey, xp yp+20 w100 h18 veKeyBinds%A_Index%, % KeyBinds%A_Index%
}
Gui, guiUserSet:Add, Text, x117 y28 Hidden,
loop %BindCount%
{
Gui, guiUserSet:Add, Edit, xp yp+20 w420 h18 veBindMessage%A_Index%, % BindMessage%A_Index%
}
Gui, guiUserSet:Add, Text, x556 y30 Hidden,
loop %BindCount%
{
isChecked := "checked" BindRetext%A_Index%
isDisapled := (BindEnter%A_Index%?" Disabled":"")
Gui, guiUserSet:Add, Checkbox, xp yp+20 veBindRetext%A_Index% %isChecked%%isDisapled%, `
}
Gui, guiUserSet:Add, Text, x594 y30 Hidden,
loop %BindCount%
{
isChecked := "checked" BindEnter%A_Index%
Gui, guiUserSet:Add, Checkbox, xp yp+20 veBindEnter%A_Index% gActiveRetext %isChecked%, `
}
ScrollSize := BindCount*14
OnMessage(0x115, "WM_VSCROLL")
OnMessage(0x20A, Func("WM_MOUSEWHEEL").Bind(hScroll))
UpdateScrollBar(hScroll, ScrollSize)
VSCROLL_To(hScroll, SB_Bottom)
Gui, ghelpKeys: -SysMenu
Gui, ghelpKeys:Add, GroupBox, x4 y1 w494 h292 C424242, Информация
Gui, ghelpKeys:Font, S8 c424242
Gui, ghelpKeys:Add, Text, xp+7 yp+15 w482, `    Используйте один или несколько ключей для получения инфомации или же установке курсора в нужное место.`n    Пример:`n  /cban <ReconID><cur> 30 5 cheat
Gui, ghelpKeys:Add, Text, xp+5 yp+57 w474 0x10
Gui, ghelpKeys:Font, S8 cDefault
Gui, ghelpKeys:Add, Text, x15 yp+5, - <cur> - Установить курсор в указаное место (Не более одного раза)
Gui, ghelpKeys:Add, Text, xp yp+15, - <PmID> - ID игрока написавшего в репорт
Gui, ghelpKeys:Add, Text, xp yp+15, - <PmNICK> - Ник игрока написавшего в репорт
Gui, ghelpKeys:Add, Text, xp yp+15, - <ReportID> - ID на которого отправили репорт
Gui, ghelpKeys:Add, Text, xp yp+15, - <AcID> - ID последнего подозрительного игрока
Gui, ghelpKeys:Add, Text, xp yp+15, - <AcNICK> - Ник последнего подозрительного игрока
Gui, ghelpKeys:Add, Text, xp yp+15, - <ReconID> - ID последнего за кем вы следили
Gui, ghelpKeys:Add, Text, xp yp+15, - <ReconNICK> - Ник последнего за кем вы следили
Gui, ghelpKeys:Add, Text, xp yp+15, - <LastBan> - Nick последнего забаненного игрока
Gui, ghelpKeys:Add, Text, xp yp+15, - <WarnNICK> - Ник игрока который отправил подозрительное сообщение
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsID> - ID последнего кто написал вам смс
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsNICK> - Ник последнего кто написал вам смс
Gui, ghelpKeys:Add, Text, xp yp+15, - <BanCurIP> - Текущий IP последнего игрока которого вы забанили
Gui, ghelpKeys:Add, Text, xp yp+15, - <BanRegIP> - Регистрационный IP последнего игрока которого вы забанили
Gui, ghelpKeys:Font, S8 с000000
Gui, ghelpKeys:Add, Text, x4 y296 h30 0x11
Gui, ghelpKeys:Add, Text, x5 y296 w494 0x10
Gui, ghelpKeys:Add, Text, xp+490 yp h30 0x11
Gui, ghelpKeys:Add, Text, xp-490 yp+27 w494 0x10
Gui, ghelpKeys:Font, S12
Gui, ghelpKeys:Add, Text, Center xp+2 yp-24 w475 h23 C000000 ggoMainMenuInHelp, Закрыть справку по ключам
Gui, ghelpKeys:Font, S8
Gui, guiError:-caption -sysmenu +AlwaysOnTop +Border
Gui, guiError:font, S10
Gui, guiError:Add, Text, x4 y4 w200, Ошибка
Gui, guiError:font, S8
Gui, guiError:Add, Text, x0 yp+22 w230 Center verrorText, Произошла непредвиденая ошибка
Gui, Saved:-caption -sysmenu +AlwaysOnTop +Border
Gui, Saved:font, S14
Gui, Saved:Add, Text, x0 y2 w200 Center, Сохранено
Gui, Saved:font, S8
Gui, Saved:Add, Text, x0 yp+25 w200 Center, Изменения были приняты
ShowSaved()
{
global
if(Saved)
return
if(isError)
gosub, ErrorHide
Saved := true
Gui, Saved:Show, w200 h45
SetTimer, SavedOff, 5000
return
}
showError(msg)
{
global
if(isError)
return
if(Saved)
gosub, SavedOff
isError := true
GuiControl, guiError:, errorText, %msg%
Gui, guiError:Show, w230 h45
SetTimer, ErrorHide, 5000
return
}
Gui, Load:Destroy
Gui, guiMainMenu:Show, x0 y0
if(isOpenHide)
{
tHide := " Hide"
Hidded := false
gosub, goHideTray
Process, Exist, gta_sa.exe
if(!ErrorLevel)
{
Gui, LoadConnect:Show, w278 h100, Подключение к серверу
LoadConnect := true
}
} else tHide := ""
Gui, Main:Show,%tHide% w625 h434, Admin Helper for Monser Gang War
TrayTip, Admin Helper, Нажмите на иконку программы чтобы показать или скрыть интерфейс с настройками, 3
OnMessage(0x201, "WM_LBUTTONDOWN")
updateOScoreboardData()
return
goNoConnect:
LoadConnect := false
Gui, LoadConnect:Destroy
return
openIni:
if(A_GuiEvent != "DoubleClick")
return
Run, %iniFile%
return
ActiveRetext:
loop %BindCount%
{
GuiControlGet, eBindEnter%A_Index%, guiUserSet:
if(eBindEnter%A_Index%)
GuiControl, Enable 0, eBindRetext%A_Index%
else
GuiControl, Enable 1, eBindRetext%A_Index%
}
return
SaveBinds:
ShowSaved()
loop %BindCount%
{
GuiControlGet, eKeyBinds%A_Index%, guiUserSet:
nKey := KeyBinds%A_Index%
gKey := eKeyBinds%A_Index%
gKey := GetKeysVK(gKey)
if(RegExMatch(gKey,"^(\!|\#|\^|\+)$"))
continue
if(isBind["Key" gKey] &&  gKey != nKey && strlen(gKey) && !isBind["bKey" gKey])
{
showError("Клавиша " HKToStr(gKey) " уже используется")
OldKey := nKey
GuiControl, guiUserSet:, eKeyBinds%A_Index%, %OldKey%
continue
}
if(isBind["Key" nKey])
isBind["Key" nKey] := false
if(isBind["bKey" nKey])
isBind["bKey" nKey] := false
if(!isBind["Key" gKey])
isBind["Key" gKey] := true
if(!isBind["bKey" gKey])
isBind["bKey" gKey] := true
GuiControlGet, eBindMessage%A_Index%, guiUserSet:
GuiControlGet, eBindEnter%A_Index%, guiUserSet:
GuiControlGet, eBindRetext%A_Index%, guiUserSet:
BindMessage%A_Index% := eBindMessage%A_Index%
BindEnter%A_Index% := eBindEnter%A_Index%
BindRetext%A_Index% := eBindRetext%A_Index%
WriteIni("[KEY:[" GetKeysVK(eKeyBinds%A_Index%) "]][MSG:[" eBindMessage%A_Index% "]][ENTER:[" eBindEnter%A_Index% "]][RETEXT:[" eBindRetext%A_Index% "]]", "binds", "Bind" A_Index)
}
SaveIniFile()
return
goMainMenuSub:
if(tabId != 1)
tabId := 1
else return
gosub, ErrorHide
gosub, SavedOff
GuiControl, Main:, varMainMenu, Главное меню
Gui, guiMainMenu:Show, x0 y0
Gui, guiUserSet:Hide
Gui, guiUserSetKey:Hide
return
ErrorHide:
SetTimer, ErrorHide, off
if(!isError)
return
isError := false
Gui, guiError:Hide
return
SavedOff:
SetTimer, SavedOff, off
if(!Saved)
return
Saved := false
Gui, Saved:Hide
return
SetOldNick:
RegRead, UserName, HKEY_CURRENT_USER, Software\SAMP, PlayerName
GuiControlGet, eUserName, % (LoadConnect?"LoadConnect:":"guiMainMenu:")
if(UserName = eUserName)
return
GuiControl, , eUserName, %UserName%
return
#If
#if LoadConnect
~*Enter::
LoadConnect := false
Gui, LoadConnect:Destroy
gosub, goConnect
return
#If
#IfWinActive GTA:SA:MP
goConnect:
gosub, ErrorHide
gosub, SavedOff
if(LoadConnect)
{
GuiControlGet, eUserName, LoadConnect:
GuiControlGet, ecServerID, LoadConnect:
LoadConnect := false
Gui, LoadConnect:Destroy
} else {
GuiControlGet, eUserName, guiMainMenu:
GuiControlGet, ecServerID, guiMainMenu:
}
if(strlen(eUserName) < 3)
{
GuiControl, % (LoadConnect?"LoadConnect:":"guiMainMenu:"), "eUserName", "PlayerName"
showError("Укажите корректный никнейм")
return
}
if(cServerID != ecServerID)
{
cServerID := ecServerID
WriteIni(ecServerID, "settings", "ConnectServer")
}
if(cServerID = 1)
connectIP := "176.32.37.37:7777"
else if(cServerID = 2)
connectIP := "176.32.39.185:7777"
else if(cServerID = 3)
connectIP := "176.32.36.229:7777"
else return
RegRead, UserName, HKEY_CURRENT_USER, Software\SAMP, PlayerName
if(UserName != eUserName)
{
UserName := eUserName
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP, PlayerName, %eUserName%
}
RegRead, Adress, HKEY_CURRENT_USER, Software\SAMP, gta_sa_exe
RegExMatch(Adress, "(.*)gta\_sa\.exe", Adress)
Process, Exist, gta_sa.exe
if(ErrorLevel)
return
Adress1 .= "samp.exe"
Process, Exist, samp.exe
if(ErrorLevel)
Process, Close, samp.exe
Run, %Adress1% %connectIP%
return
WM_LBUTTONDOWN() {
global
if(isError)
gosub, ErrorHide
if(Saved)
gosub, SavedOff
if(gMenuOpen)
{
gGui := A_GuiControl
if(gGui != "gMenuHideKey" && gGui != "gMenuCloseKey" && gGui != "gMenuReloadKey")
{
gMenuOpen := 1
Gosub goMenu
}
}
return
}
goSaveSubSet:
gosub, ErrorHide
gosub, SavedOff
showSaved()
GuiControlGet, eWarnText, guiSubSet:
OldWarnText := WarnText
if(!strlen(eWarnText))
{
GuiControl, , eWarnText, %OldWarnText%
showError("Невозможно сохранить пустое поле")
return
}
eWarnText := Trim(eWarnText, "`n")
eWarnText := Trim(eWarnText, "`r")
eWarnText := Trim(eWarnText, ",")
eWarnText := RegExReplace(eWarnText, "\r", ", ")
eWarnText := RegExReplace(eWarnText, "\n", ", ")
WriteIni(eWarnText, "settings", "WarnText")
WarnText := eWarnText
GuiControl, , eWarnText, %WarnText%
WarnTextEx := ""
Loop, parse, WarnText
{
if(RegExMatch(A_LoopField, "[0-9A-Za-zА-Яа-я ]"))
WarnTextEx .= A_LoopField
else
WarnTextEx .= "\" A_LoopField
}
StringLower, WarnTextEx, WarnTextEx
WarnTextEx := RegExReplace(WarnTextEx, "\\\, ", "|")
WarnTextEx := RegExReplace(WarnTextEx, "\\\,", "|")
WarnTextEx := RegExReplace(WarnTextEx, "\r", "")
WarnTextEx := RegExReplace(WarnTextEx, "\n", "")
WarnTextEx := RegExReplace(WarnTextEx, "\rn", "")
return
goSubSet:
gosub, ErrorHide
gosub, SavedOff
tabId := 4
return
LoadConnectGuiEscape:
LoadConnect := false
Gui, LoadConnect:Destroy
return
goSettingsMenuInSub:
if(tabId != 2)
tabId := 2
else return
gosub, ErrorHide
gosub, SavedOff
GuiControl, Main:, varMainMenu, Главное меню
Gui, guiMainMenu:Show, x0 y0
Gui, guiSubSet:Hide
Gui, Main:+LastFound
WinMove, , , , , 625, 463
return
goUserSet:
gosub, ErrorHide
gosub, SavedOff
tabId := 5
GuiControl, Main:, varMainMenu, Биндер
Gui, guiUserSetKey:Show, x0 y0
Gui, guiUserSet:Show, x0 y0
Gui, guiMainMenu:Hide
return
goMenu:
if(!gMenuOpen)
{
GuiControl, Main:Enable 0, varMenu
GuiControl, Main:Hide, bline4
GuiControl, Main:Show, bline5
GuiControl, Main:Show, mFon
GuiControl, Main:Show, bline6
GuiControl, Main:Show, bline7
GuiControl, Main:Show, line5
GuiControl, Main:Show, line6
GuiControl, Main:Show, gMenuHideKey
GuiControl, Main:Show, gMenuReloadKey
GuiControl, Main:Show, gMenuCloseKey
} else {
GuiControl, Main:Enable 1, varMenu
GuiControl, Main:Show, bline4
GuiControl, Main:Hide, bline5
GuiControl, Main:Hide, mFon
GuiControl, Main:Hide, bline6
GuiControl, Main:Hide, bline7
GuiControl, Main:Hide, line5
GuiControl, Main:Hide, line6
GuiControl, Main:Hide, gMenuHideKey
GuiControl, Main:Hide, gMenuReloadKey
GuiControl, Main:Hide, gMenuCloseKey
}
gMenuOpen := !gMenuOpen
return
goHelpACMD:
gosub, ErrorHide
gosub, SavedOff
Gui, helpCMD:Show, w500 h298, Полный список команд
return
HelpKeys:
gosub, ErrorHide
gosub, SavedOff
Gui, ghelpKeys:Show, w500 h328, Ключи / Справка
return
goReload:
gosub, ErrorHide
gosub, SavedOff
Reload
return
goHideTray:
if(Hidded)
{
Menu, Tray, Rename, Развернуть, Свернуть
Menu, tray, default, Свернуть
Gui, Main:Show
} else {
Menu, Tray, Rename, Свернуть, Развернуть
Menu, tray, default, Развернуть
gMenuOpen := 1
Gosub, goMenu
Gui, Main:Hide
}
Hidded := !Hidded
return
GuiClose:
MainGuiClose:
isExit := true
unLoadBinds()
SetTimer, readChat, off
Gui, guiMainMenu:Destroy
Gui, guiSetMenu:Destroy
Gui, Main:Destroy
ExitApp
return
checkedWarnText(warnNick, warnId, warnMsg)
{
global
gLastWarnNICK := warnNick
gLastWarnID := warnId
StringLower, StrSearch, warnMsg
if(!RegExMatch(StrSearch, "i)(" WarnTextEx ")", sres))
return
if(!strlen(sres1))
return
Event["userid"] := warnId
Event["username"] := RegExReplace(getPlayerNameById(warnId), "^(\[DM\]|\[GW\])")
if(getUsername() = Event["username"] || warnNick != Event["username"] || (Event["last"] = "mq" Event["username"] && Event["active"] && Event["time"] > A_TickCount))
return
isNoCaps := true
gLastWarnNICK := Event["username"]
gLastWarnID := Event["userid"]
Event["time"] := A_TickCount + 15000
Event["active"] := true
Event["admin"] := ""
Event["last"] := "mq" Event["username"]
if(Alevel > 1)
{
Event["name"] := "mute"
Event["msg"] := "/mute " Event["userid"] " 180 Упоминание родных."
} else {
Event["name"] := "ban"
Event["msg"] := "/ban " Event["userid"] " 30 Оскорбление родных."
}
return
}
checkedCapsLock(capsNick, capsId, capsText)
{
global
if(isNoCaps)
return
StringLower, StrSearch, capsText
if(RegExMatch(StrSearch, "i)(" WarnTextEx ")", sres))
return
capsMsg := RegExReplace(capsText, "[^A-ZА-ЯЁ]")
nocapsMsg := RegExReplace(capsText, "[^а-яa-zё]")
capsCount := strlen(capsMsg) - strlen(nocapsMsg)
if(capsCount < 3 || strlen(capsMsg) < 4)
return
Event["userid"] := capsId
Event["username"] := RegExReplace(getPlayerNameById(capsId), "^(\[DM\]|\[GW\])")
if(getUsername() = Event["username"] || capsNick != Event["username"] || (Event["last"] = "caps" Event["username"] && Event["active"] && Event["time"] > A_TickCount))
return
Event["time"] := A_TickCount + 15000
Event["active"] := true
Event["admin"] := ""
Event["last"] := "caps" Event["username"]
Event["name"] := "mute"
Event["msg"] := "/mute " Event["userid"] " 10 Caps Lock"
return
}
readChat:
i := 0
if(!checkHandles() || isExit || isReading)
return
isReading := true
isRead1001 := false
isRead1002 := false
isRead1003 := false
isRead1004 := false
isRead1005 := false
isRead1006 := false
isRead1007 := false
isRead1008 := false
isRead1009 := false
isRead1010 := false
isRead1011 := false
isNoCaps := false
dwAddrr1 := readDWORD(hGTA, dwSAMP+ADDR_SAMP_CHATMSG_PTR)
loop 99
{
i := A_Index-1
if(isExit)
break
ChatLine := 0x132 + ((99 - i) * 0xFC) + offLine
ChatLineText := GetChatLineEx(i)
if(!strlen(ChatLineText))
continue
gRead := readMem(hGTA, dwAddrr1 + ChatLine)
isRead%gRead% := true
if(gRead = 1001 || gRead = 1002 || gRead = 1003 || gRead = 1004 || gRead = 1005 || gRead = 1006 || gRead = 1007 || gRead = 1008 || gRead = 1009)
continue
if(!isRead1001 && strlen(KeyEventYes) && strlen(KeyEventNo) && RegExMatch(ChatLineText, "^\{00CD66\}\[A\s:(\d+)\] (.*) \[ID\:(\d+)\]\: \/?(kick|mute|jail|ban|msg|cban|skick|scapt|re|offban|unban|unjail|unmute)(.*)", achat))
{
isRead1001 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
if(getUsername() = achat2 || (achat4 = "kick" && (!RegExMatch(achat5, "^ (\d+) (.*)", cause) || Alevel < 2)) || (achat4 = "cban" && (!RegExMatch(achat5, "^ (\d+) (\d+) (\d+) (.*)", cause) || Alevel < 3)) || (achat4 = "skick" && (!RegExMatch(achat5, "^ (\d+)( (.*))*", cause) || Alevel < 2)) || (achat4 = "mute" && !RegExMatch(achat5, "^ (\d+) (\d+) (.*)", cause)) || (achat4 = "jail" && (!RegExMatch(achat5, "^ (\d+) (\d+) (.*)", cause) || Alevel < 2)) || (achat4 = "offban" && (!RegExMatch(achat5, "^ (\d+) ([^ ]*)( (.*))*", cause) || Alevel < 3)) || (achat4 = "unban" && (!RegExMatch(achat5, "^ (.*)( (.*))*", cause) || Alevel < 3)) || (achat4 = "unjail" && (!RegExMatch(achat5, "^ (\d+) (.*)", cause) || Alevel < 2)) || (achat4 = "unmute" && !RegExMatch(achat5, "^ (\d+)( (.*))*", cause)) || (achat4 = "re" && !RegExMatch(achat5, "^ (\d+)( (.*))*", cause)) || (achat4 = "ban" && (!RegExMatch(achat5, "^ (\d+) (\d+) (.*)", cause) || Alevel < 3)) || (achat4 = "scapt" && Alevel < 2) || (achat4 = "msg" && (!RegExMatch(achat5, "^ (.*)", cause) || Alevel < 2)))
continue
Event["active"] := true
Event["name"] := achat4
Event["admin"] := achat2
Event["userid"] := cause1
Event["username"] := RegExReplace(getPlayerNameById(cause1), "^(\[DM\]|\[GW\])")
if(Event["name"] = "offban")
{
Event["msg"] := "/" achat4 " " cause1 " " cause2
Event["userid"] := cause2
Event["username"] := cause2
} else if(Event["name"] = "unban")
{
Event["msg"] := "/" achat4 achat5
Event["userid"] := cause1
Event["username"] := cause1
} else {
Event["msg"] := "/" achat4 achat5 (Event["name"] != "skick" && Event["name"] != "scapt" && Event["name"] != "re"?" ")
}
Event["time"] := A_TickCount + 30000
if(Event["name"] != "msg" && Event["name"] != "offban" && Event["name"] != "unban")
{
if(!strlen(Event["username"]))
continue
}
if(Event["last"] = Event["msg"] && Event["active"] && Event["time"] > A_TickCount)
continue
Event["last"] := Event["msg"]
if(Event["name"] = "kick")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Кикнуть {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "mute")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Выдать бан чата {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "jail")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Посадить в тюрьму {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "ban")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Забанить {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "cban")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Забанить по IP {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "offban")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Забанить оффлайн {ffc801}" Event["username"] "{FFFFFF}."
else if(Event["name"] = "unban")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Снять бан {ffc801}" Event["username"] "{FFFFFF}."
else if(Event["name"] = "unjail")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Выпустить из тюрьмы {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "unmute")
CauseText := Event["admin"] "[" achat3 "}{FFFFFF}: Снять бан чата {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "msg")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Сообщить в MSG: {ffc801}" cause1 "{FFFFFF}."
else if(Event["name"] = "skick")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Тихо кикнуть {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "re")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Проследить за {ffc801}" Event["username"] "[" Event["userid"] "]{FFFFFF}."
else if(Event["name"] = "scapt")
CauseText := Event["admin"] "[" achat3 "]{FFFFFF}: Остановить капт."
continue
}
if(!isRead1002 && RegExMatch(ChatLineText, "^\{FF4366\}\*( \{FFD700\}\[VIP\]\{FF4366\})* Сообщение от (?<reprNick>.*)\[(?<reprId>\d+)\]\: (?<reprMsg>(.*?(?<jbID>\d{0,3}).*))", report))
{
isRead1002 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead2, 4)
gLastPMID := reportreprId
gLastPmNICK := reportreprNick
if(strlen(reportjbID) > 0)
gLastReportID := reportjbID
checkedCapsLock(reportreprNick, reportreprId, reportreprMsg)
continue
}
if(!isRead1003 && strlen(KeyEventYes) && strlen(KeyEventNo) && strlen(WarnTextEx) && RegExMatch(ChatLineText, "^\[(sСтандартный чат|\/ssms|\/so|\/sf)\] (?<wNick>[A-Za-z0-9\[\]\_\$\.]+) \[ID\:(?<wId>\d+)\]\: (?<wMsg>.*)", schat))
{
isRead1003 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead3, 4)
checkedWarnText(schatwNick, schatwId, schatwMsg)
gNick := RegExReplace(getPlayerNameById(schatwId), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
if(!strlen(gNick))
return
addChatMessageEx("FFFFFF", "{ffffff}Nick: " gNick "[" Floor(schatwId) "]{FFFFFF}| Убийств: " getPlayerScoreById(schatwId) "{FFFFFF} | Пинг: " getPlayerPingById(schatwId))
continue
}
if(!isRead1004 && Alevel > 3 && ipChecked && RegExMatch(ChatLineText, "^\{(.*)\}\[" gLastGeoipID "\] (.*) \(REG\-IP\: (.*)\) \(LAST\-\IP\: (.*)\) \(CURRENT\-IP\: (.*)\)", gIp))
{
isRead1004 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead4, 4)
xxzz:="http://freegeoip.net/json/" gIp3
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("GET",xxzz,false)
req.SetRequestHeader("Referer", xxzz)
req.Send()
regIP := req.responseText
xxzz:="http://freegeoip.net/json/" gIp5
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("GET",xxzz,false)
req.SetRequestHeader("Referer", xxzz)
req.Send()
curIP := req.responseText
RegIP_loc := json.parse(regIP)
CurIP_loc := json.parse(curIP)
regCity := decode(RegIP_loc["city"])
curCity := decode(CurIP_loc["city"])
if(!strlen(regCity))
regCity := "Не определен"
if(!strlen(curCity))
curCity := "Не определен"
regCountry := decode(RegIP_loc.country_name)
regRegion := decode(RegIP_loc.region_name)
curCountry := decode(CurIP_loc.country_name)
curRegion := decode(CurIP_loc.region_name)
if(!strlen(regRegion))
regRegion := "Не определен"
if(!strlen(curRegion))
curRegion := "Не определен"
if(curCity = regCity || regCity = "Не определен" || curCity = "Не определен")
Distanceex := 0
else
Distanceex := distance(RegIP_loc["latitude"], RegIP_loc["longitude"], CurIP_loc["latitude"], CurIP_loc["longitude"])
if(geoOpen = 1)
showDialog(0, "{ffc801}" gIp2, "{FFFFFF}Регистрационные данные:`n   Страна: {ffc801}`t" regCountry "`n   {FFFFFF}Регион: {ffc801}`t" regRegion "`n   {FFFFFF}Город: {ffc801}`t" regCity "`n     `n{FFFFFF}Текущие данные:`n   Страна: {ffc801}`t" curCountry "`n   {FFFFFF}Регион: {ffc801}`t" curRegion "`n   {FFFFFF}Город: {ffc801}`t" curCity (Distanceex > 0?"`n     `n{FFFFFF}Расстояние между городами: {ffc801}" Round(Distanceex / 1000, 1)" км":""), "Закрыть", "", 1589)
else
addChatMessageEx("FFFFFF", "{ffc801}[A] " gIp2 "{FFFFFF} :: " regCountry "/" regRegion "/" regCity " :: " curCountry "/" curRegion "/" curCity (Distanceex > 0?" :: Расстояние: " Round(Distanceex / 1000, 1)" км":""))
if(strlen(oldgeoOpen))
geoOpen := oldgeoOpen
oldgeoOpen := ""
ipChecked := false
continue
}
if(!isRead1005 && isIStatsRe && RegExMatch(ChatLineText, "Администратор " getUsername() " \[ID\:(\d+)\] начал наблюдение за игроком (.*) \[ID\:(\d+)\]", reRes))
{
isRead1005 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead5, 4)
if(gLastReconID = reRes2)
continue
gLastReconID := reRes3
gLastReconNICK := reRes2
IStats(reRes3)
continue
}
if(!isRead1006 && strlen(KeyEventYes) && strlen(KeyEventNo) && !isNoCaps && RegExMatch(ChatLineText, "^(\{66ff00\}\[O\]( \{FFD700\}\[VIP\]\{66ff00\})* \{(.*)\}|\{01FCFF\}\*\* (\{(.*)\})*\[(.*)\]( \{FFD700\}\[VIP\]\{01FCFF\})*(\{01FCFF\})* |(\{FFD700\}\[VIP\]\{66ff00\} )*\{(.*)\})+(?<Nick>[A-Za-z0-9\[\]\_\$\.]+) (\{66ff00\})*\[ID\:(?<mId>\d+)\]\: (\{FFFFFF\})*(?<Msg>.*)", ochat))
{
isRead1006 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead6, 4)
checkedCapsLock(ochatNick, ochatmId, ochatMsg)
continue
}
if(!isRead1007 && RegExMatch(ChatLineText, "^\{FF0000\}\[AntiCheat\] \{FFFFFF\}(.*) \[ID:(\d+)\]", acheat))
{
isRead1007 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead7, 4)
if(strlen(acheat2) > 0)
{
gLastACID := acheat2
gLastAcNICK := acheat1
}
continue
}
if(!isRead1008 && RegExMatch(ChatLineText, "^\{FFA500\}" getUsername() " \[ID\:(\d+)\] авторизовался как администратор (\d) уровня", authRes))
{
isRead1008 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead8, 4)
Alevel := authRes2
if(isAuthDuty && strlen(DutySkin) && Alevel > 0)
sendChat("/duty " DutySkin)
if(isAuthConoff)
{
sendChat("/conoff")
isConoff := true
}
if(Alevel > 2)
sendChat("/fon")
continue
}
if(!isRead1009 && RegExMatch(ChatLineText, "^\{FFD700\}SMS от (.*) \[ID\:(\d+)\]( к (.*) \[ID\:(\d+)\])*\: \{FFFFFF\}(.*)", smsMsg) && !RegExMatch(ChatLineText, "^\{FFD700\}SMS от (.*) \[ID\:(\d+)\] к (.*) \[ID\:(\d+)\]\: \{FFFFFF\}(.*)"))
{
isRead1009 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead9, 4)
gLastSmsID := smsMsg2
gLastSmsNICK := smsMsg1
continue
}
if(!isRead1010 && RegExMatch(ChatLineText, "^ \- Вы забанили (.*) на (\d+) дней \| Тек\. IP\: (?<bIP>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})( \| Рег\. IP\: (?<rIP>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))*", banMsg))
{
isRead1010 := true
WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead10, 4)
gLastBanCurIP := banMsgbIP
gLastBanNick := banMsg1
if(strlen(banMsgrIP))
gLastBanRegIP := banMsgrIP
continue
}
}
isReading := false
return
Save:
SaveIniFile()
return
ReAlevel:
GuiControlGet, eAlevel
Alevel := eAlevel
if(Alevel = 1)
{
GuiControl, guiMainMenu:Enable 0, eKeySCapt
GuiControl, guiMainMenu:Enable 0, tKeySCapt
GuiControl, guiMainMenu:Enable 1, eKeyDuty
GuiControl, guiMainMenu:Enable 1, tKeyDuty
GuiControl, guiMainMenu:Enable 1, eDutySkin
GuiControl, guiMainMenu:Enable 1, tDutySkin
GuiControl, guiMainMenu:Enable 1, eisAuthDuty
}
else if(Alevel >= 2)
{
GuiControl, guiMainMenu:Enable 1, eKeySCapt
GuiControl, guiMainMenu:Enable 1, tKeySCapt
}
if(Alevel < 4)
{
GuiControl, guiMainMenu:Enable 0, TextGeoIP
GuiControl, guiMainMenu:Enable 0, egeoOpen
} else {
GuiControl, guiMainMenu:Enable 1, TextGeoIP
GuiControl, guiMainMenu:Enable 1, egeoOpen
}
SaveIniFile()
return
goSettingsMenuInHelp:
gosub, ErrorHide
gosub, SavedOff
Gui, helpCMD:Hide
return
goMainMenuInHelp:
gosub, ErrorHide
gosub, SavedOff
Gui, ghelpKeys:Hide
return
gKeyBinds:
ThisHK := A_ThisHotKey
StringTrimLeft, aKey, ThisHK, 1
loop %BindCount%
{
if(aKey = KeyBinds%A_Index%)
HotkeyEvent(KeyBinds%A_Index%, BindMessage%A_Index%, BindEnter%A_Index%, BindRetext%A_Index%)
}
return
HotkeyEvent(bKey, bMessage, isEnter, isRetext)
{
global
If((isOpenChat || isDialogOpen()) && WarnKey(bKey))
return
local localMessage := ""
localMessage := RegExReplace(bMessage, "(\<PmID\>)", gLastPMID)
localMessage := RegExReplace(localMessage, "(\<PmNICK\>)", gLastPmNICK)
localMessage := RegExReplace(localMessage, "(\<ReportID\>)", gLastReportID)
localMessage := RegExReplace(localMessage, "(\<AcID\>)", gLastACID)
localMessage := RegExReplace(localMessage, "(\<AcNICK\>)", gLastAcNICK)
localMessage := RegExReplace(localMessage, "(\<ReconID\>)", gLastReconID)
localMessage := RegExReplace(localMessage, "(\<ReconNICK\>)", gLastReconNICK)
localMessage := RegExReplace(localMessage, "(\<LastBan\>)", gLastBanNick)
localMessage := RegExReplace(localMessage, "(\<Доработка\>)", gLastWarnNICыK)
localMessage := RegExReplace(localMessage, "(\<SmsID\>)", gLastSmsID)
localMessage := RegExReplace(localMessage, "(\<SmsNICK\>)", gLastSmsNICK)
localMessage := RegExReplace(localMessage, "(\<BanCurIP\>)", gLastBanCurIP)
localMessage := RegExReplace(localMessage, "(\<BanRegIP\>)", gLastBanRegIP)
gStrLen := strlen(localMessage)
if(!gStrLen)
return
cur := inStr(localMessage, "<cur>")
if(cur > 0)
{
localMessage := RegExReplace(localMessage, "\<cur\>", "", curCount)
leftKey := "{left " (gStrLen-cur)-(strlen("<cur>")*curCount)+1 "}"
}
else
leftKey := ""
reMess := ""
if(isEnter)
sendChat(localMessage)
else
{
localMessage := RegExReplace(localMessage, "\{(.*)\}", "{{}$1{}}")
localMessage := RegExReplace(localMessage, "\!", "{!}")
localMessage := RegExReplace(localMessage, "\#", "{#}")
localMessage := RegExReplace(localMessage, "\^", "{^}")
localMessage := RegExReplace(localMessage, "\+", "{+}")
if(!isOpenChat && !isDialogOpen())
{
isOpenChat := 1
keyF6 := "{F6}"
} else keyF6 := ""
if(isRetext)
Retext := "{ctrl down}{SC1E}{ctrl up}{BackSpace}"
else
Retext := ""
if(!strlen(localMessage))
return
SendInput, %keyF6%%Retext%%localMessage%%leftKey%
}
return
}
gKeyLastPM:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyLastPM))
return
if(!isOpenChat && !isDialogOpen())
{
isOpenChat := 1
SendInput, {F6}
}
SendInput, ^{SC1E}{BackSpace}
if(strlen(gLastPMID) > 0)
SendInput, /pm %gLastPMID%{space}
else
SendInput, /pm{space}
return
gKeyLastRe:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyLastRe))
return
if(strlen(gLastReportID) > 0)
{
sendChat("/re " gLastReportID)
return
}
if(!isOpenChat && !isDialogOpen())
{
isOpenChat := 1
SendInput, {F6}
}
SendInput, ^{SC1E}{BackSpace}
SendInput, /re{space}
return
gKeyReAC:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyReAC))
return
if(strlen(gLastACID) > 0)
{
sendChat("/re " gLastACID)
return
}
if(!isOpenChat && !isDialogOpen())
{
isOpenChat := 1
SendInput, {F6}
}
SendInput, ^{SC1E}{BackSpace}
SendInput, /re{space}
return
gKeyAChat:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyAChat))
return
if(!isOpenChat && !isDialogOpen())
{
isOpenChat := 1
SendInput, {F6}
}
SendInput, ^{SC1E}{BackSpace}
SendInput, /a{space}
return
gKeyDuty:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyDuty))
return
if(Alevel < 0)
return
if(!DutySkin)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Сначала нужно выбрать скин в Главном меню")
return
}
sendChat("/duty " DutySkin)
return
gKeySCapt:
If((isOpenChat || isDialogOpen()) && WarnKey(KeySCapt))
return
if(Alevel < 2)
return
sendChat("/scapt Нарушение правил /capture (Обрез/Кусок)")
return
gKeyReOff:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyReOff))
return
sendChat("/reoff")
return
gKeyBanda:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyBanda))
return
sendChat("/time")
return
gKeyConOff:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyConOff))
return
if(isConoff)
sendChat("/conon")
else
sendChat("/conoff")
isConoff := !isConoff
return
gKeyTime:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyTime))
return
sendChat("/time")
return
gKeyEventYes:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyEventYes))
return
if(!Event["active"])
{
return
}
if(Event["time"] < A_TickCount)
{
Event["active"] := false
return
}
if(RegExReplace(getPlayerNameById(Event["userid"]), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])") != Event["username"] && Event["name"] != "unban" && Event["name"] != "offban")
{
Event["active"] := false
return
}
Event["disActive"] := false
If(Event["name"] = "mute")
{
Event["disMsg"] := "/unmute " Event["userid"]
Event["disActive"] := true
Event["disUsername"] := Event["username"]
Event["disUserid"] := Event["userid"]
Event["disTime"] := A_TickCount + 60000
} else if(Event["name"] = "jail")
{
Event["disMsg"] := "/unjail " Event["userid"] " Ошибка"
Event["disActive"] := true
Event["disUsername"] := Event["username"]
Event["disUserid"] := Event["userid"]
Event["disTime"] := A_TickCount + 60000
} else if(Event["name"] = "ban" || Event["name"] = "cban" || Event["name"] = "offban")
{
Event["disName"] := "unban"
Event["disMsg"] := "/unban " Event["username"]
Event["disActive"] := true
Event["disUsername"] := Event["username"]
Event["disTime"] := A_TickCount + 60000
}
Event["active"] := false
Event["last"] := ""
sendChat(Event["msg"])
if(Event["disActive"] && strlen(KeyEventNo))
return
gKeyEventNo:
If((isOpenChat || isDialogOpen()) && WarnKey(KeyEventNo))
return
if(Event["active"] && Event["time"] > A_TickCount)
{
Event["active"] := false
return
}
if(!Event["disActive"])
{
return
}
if(Event["disTime"] < A_TickCount)
{
Event["disActive"] := false
return
}
if(RegExReplace(getPlayerNameById(Event["userid"]), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])") != Event["disUsername"] && Event["disName"] != "unban")
{
Event["disActive"] := false
return
}
Event["disActive"] := false
sendChat(Event["disMsg"])
return
IStats(id)
{
global
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
if(!strlen(gNick))
return
addChatMessageEx("FFFFFF", "{ffffff}Nick:{ffc801} " gNick "[" Floor(id) "]{FFFFFF}| Убийств: {ffc801}" getPlayerScoreById(id) "{FFFFFF} | Пинг:{ffc801} " getPlayerPingById(id))
SendChat("/ta "id)
return
}
~*Enter::
if (isInChat() = 1) and (isDialogOpen() = 0)
{
isOpenChat := 0
blockChatInput()
Sleep 200
dwAddress := dwSAMP + 0x12D8F8
chat := readString(hGTA, dwAddress, 256)
unBlockChatInput()
if(chat=="")
{
return
}
Else
{
if(RegExMatch(chat, "^\/ii"))
{
if(RegExMatch(chat, "^\/ii([^ ])"))
return
if((RegExMatch(chat, "^\/ii$") || RegExMatch(chat, "^\/ii $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте: {ffc801} /ii [часть ника] [кол-во показов / укажите {ffc801}all{FFFFFF} чтобы показать всех]")
    return
}
RegExMatch(chat, "^\/ii ([\dA-Za-z_\[\]]+)( ((\d+)|all))*", t)
limitC := t3
cIi := 0
id := t1
if(!strlen(limitC))
limitC := 10
addChatMessageEx("FFFFFF", "{FFFFFF}Результаты по запросу {ffc801}" id "{FFFFFF}:")
updateOScoreboardData()
For i, o in oScoreboardData
{
    if(InStr(RegExReplace(o.NAME, "^(\[DM\]|\[GW\]|\[LC\]|\[TR\])*"),id))
    {
        if(cII < limitC && limitC != "all")
        iStats(i)
        else if(limitC = "all")
        iStats(i)
        cIi++
        continue
    }
}
if(cIi = 0)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}По запросу {ffc801}" id " {FFFFFF}ничего не найдено")
    return
}
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Найдено: {ffc801}" cIi (cIi > limitC?"{FFFFFF} | Показано: {ffc801}" limitC:""))
return
}
if(RegExMatch(chat, "^\/z"))
{
if(RegExMatch(chat, "^\/z([^ ])"))
return
if((RegExMatch(chat, "^\/z$") || RegExMatch(chat, "^\/z $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /z [id игрока]")
    return
}
RegExMatch(chat, "^\/z ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
if(Floor(id) != id)
{
    nId := id
    id := getPlayerIdByName(id)
    if(id < 0)
    id := getPlayerIdByName("[GW]" nId)
    if(id < 0)
    id := getPlayerIdByName("[DM]" nId)
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
}
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
IStats(id)
return
}
if(RegExMatch(chat, "^\/osk"))
{
if(RegExMatch(chat, "^\/osk([^ ])"))
return
if((RegExMatch(chat, "^\/osk$") || RegExMatch(chat, "^\/osk $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /osk [id игрока]")
    return
}
RegExMatch(chat, "^\/osk ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/mute " id " 20 Оскорбление игроков.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/lid"))
{
if(RegExMatch(chat, "^\/lid([^ ])"))
return
if((RegExMatch(chat, "^\/lid$") || RegExMatch(chat, "^\/lid $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /lid [id игрока]")
    return
}
RegExMatch(chat, "^\/lid ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/pm " id " Для этого нужно набрать больше киллов чем у текущего лидера.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/flood"))
{
if(RegExMatch(chat, "^\/flood([^ ])"))
return
if((RegExMatch(chat, "^\/flood$") || RegExMatch(chat, "^\/flood $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /flood [id игрока]")
    return
}
RegExMatch(chat, "^\/flood ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/mute " id " 10 Flood.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/caps"))
{
if(RegExMatch(chat, "^\/caps([^ ])"))
return
if((RegExMatch(chat, "^\/caps$") || RegExMatch(chat, "^\/caps $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /caps [id игрока]")
    return
}
RegExMatch(chat, "^\/caps ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/mute " id " 10 Caps Lock.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/rekl"))
{
if(RegExMatch(chat, "^\/rekl([^ ])"))
return
if((RegExMatch(chat, "^\/rekl$") || RegExMatch(chat, "^\/rekl $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /rekl [id игрока]")
    return
}
RegExMatch(chat, "^\/rekl ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/mute " id " 180 Реклама.")
Sleep 1
SendChat("/rr")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/crekl"))
{
if(RegExMatch(chat, "^\/crekl([^ ])"))
return
if((RegExMatch(chat, "^\/crekl$") || RegExMatch(chat, "^\/crekl $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /crekl [id игрока]")
    return
}
RegExMatch(chat, "^\/crekl ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/cban " id " 30 90 Реклама.")
Sleep 1
SendChat("/rr")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/rosk"))
{
if(RegExMatch(chat, "^\/rosk([^ ])"))
return
if((RegExMatch(chat, "^\/rosk$") || RegExMatch(chat, "^\/rosk $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /rosk [id игрока]")
    return
}
RegExMatch(chat, "^\/rosk ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/ban " id " 30 Оскорбление родных.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/aosk"))
{
if(RegExMatch(chat, "^\/aosk([^ ])"))
return
if((RegExMatch(chat, "^\/aosk$") || RegExMatch(chat, "^\/aosk $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /aosk [id игрока]")
    return
}
RegExMatch(chat, "^\/aosk ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
SendChat("/ban " id " 30 Оскорбление администрации.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/iunban") && Alevel >= 4)
{
if(RegExMatch(chat, "^\/iunban([^ ])"))
return
if((RegExMatch(chat, "^\/iunban$") || RegExMatch(chat, "^\/iunban $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /iunban [NickName]")
    return
}
RegExMatch(chat, "^\/iunban (.*)", Nick)
SendChat("/offgetstats "Nick1)
Sleep 500
if (isDialogOpen()==1)
{
    Text := getDialogText()
RegExMatch(Text,"{ffffff}Тек. IP: 			{FFD700}(.*)",tekip)
SendInput {Enter}
    SendChat("/unban "Nick1)
    SendChat("/unbanip "tekip1)
}
Else
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/ioffban") && Alevel >= 3)
{
if(RegExMatch(chat, "^\/ioffban([^ ])"))
return
if((RegExMatch(chat, "^\/ioffban$") || RegExMatch(chat, "^\/ioffban $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /ioffban [Дни бана] [Дни бана IP] [Ник] [Причина]")
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Пример:{ffc801} /ioffban 30 5 Dub0Shit Cheat")
    return
}
RegExMatch(chat, "^\/ioffban (.*) (.*) (.*) (.*)", ioffban)
SendChat("/offgetstats "ioffban3)
Sleep 500
if (isDialogOpen()==1)
{
    Text := getDialogText()
RegExMatch(Text,"{ffffff}Тек. IP: 			{FFD700}(.*)",tekip)
SendInput {Enter}
    SendChat("/offban " ioffban1 " "ioffban3)
    Sleep 500
SendInput %ioffban4%{Enter}
    Sleep 250
    SendChat("/banip " ioffban2 " "tekip1)
    Sleep 500
SendInput %ioffban4%{Enter}
}
Else
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/gg") && Alevel >= 2)
{
Random, rand, 1, 3
if rand=1
{
    SendChat("/msg Администрация желает Вам приятной игры и хорошего настроения")
    Sleep 3000
    SendChat("/msg Слушайте радио вместе с нами: /play >> Monser FM")
}
if rand=2
{
    SendChat("/msg Если вы хотите услышать свой трек на радио...")
    Sleep 3000
    SendChat("/msg Вы можете заказать его: forum.monser.ru >> Радио >> Стол заказов")
}
if rand=3
{
    SendChat("/msg Администрация желает Вам приятной игры и хорошего настроения :3")
    Sleep 3000
    SendChat("/msg Слушайте радио вместе с нами: /play >> Monser FM")
}
Return
}
if(RegExMatch(chat, "^\/lunban") && Alevel >= 4)
{
SendChat("/unban "gLastBanNick)
SendChat("/unbanip "gLastBanCurIP)
SendChat("/msg " gLastBanNick " - разбанен. Был забанен по ошибке. ")
Return
}
if(RegExMatch(chat, "^\/mutehelp"))
{
Sleep 250
showDialog("0", "{FFFAFA}Таблица наказаний", "{FFFAFA}Флуд - 5-20 минут`nКапс - 5-20 минут`nРозжиг - 60-180 минут`nРеклама любого ресурса - 60-180 минут`nТорговля - 40-60 минут`nОффтоп в репорт - 10-20 минут`nОбман администрации - 30-60 минут`nКлевета - 40-60 минут`nОскорбление проекта - 180 минут`nОскорбление игроков - 10-30 минут`nТроллинг администрации - 60-120 минут`nНеуважение к администрации - 60-120 минут`nОскорбление администрации - 180 минут`nОбсуждение действий Администрации - 120-180 минут`nКлевета на администратора - 60-120 минут`nУпоминание родных - 180 минут`nНеадекватное поведение ( Капс, Флуд, Оск ) 30 - 40 минут`nОффтоп в /o (  Передача, обмен, покупка, продажа аккаунтов  ) 40-60 минут`n", "OK")
Return
}
if(RegExMatch(chat, "^\/kickhelp"))
{
Sleep 250
showDialog("0", "{FFFAFA}Таблица наказаний", "{FFFAFA}ДБ`nТК`nСК`nПомеха проходу/спавну`nОскорбление в нике`n", "OK")
Sleep 100
Return
}
if(RegExMatch(chat, "^\/jailhelp"))
{
Sleep 250
showDialog("0", "{FFFAFA}Таблица наказаний", "{FFFAFA}Читы - 40-60 минут`nБагоюз - 10-20 минут`nКапт куском - 5-10 минут`n", "OK")
return
}
if(RegExMatch(chat, "^\/iphelp"))
{
Sleep 250
showDialog("0", "{FFFAFA}Таблица наказаний", "{FFFAFA}Неоднократное оскорбление в нике - 10 дней`nНеоднократное оскорбление родных - 10 дней`nНеоднократное оскорбление администраторов - 30 дней`nОскорбление проекта - 90 дней`n", "OK")
return
}
if(RegExMatch(chat, "^\/banhelp"))
{
Sleep 250
showDialog("0", "{FFFAFA}Таблица наказаний", "{FFFAFA}Оскорбление в нике - 20-30 дней`nОбман администрации - 5-10 дней`nНеадекватное поведение - 2-5 днeй.( Только за флуд в /v )`nРеклама любого ресурса - Бан на 30 дней + бан ип на 90 дней.`nОскорбление администрации - 30 дней`nОскорбление родных - 30 дней`nОскорбление проекта - Бан на 30 дней + бан ип на 90 дней`nЧиты - Бан на 30 дней + бан ип на 5 дней. ( Макрос -  бан ип на 2 дня )`n", "OK")
Return
}
if(RegExMatch(chat, "^\/tplist"))
{
Sleep 250
showDialog("0", "{FFD700}Телепорт меню", "{FFFAFA}1 - Админ интерьер (/aint)`n2 - {009900}Grove Street Gang`n{FFFAFA}3 - {800080}The Ballas Gang`n{FFFAFA}4 - {FFFF00}Los Santos Vagos`n{FFFAFA}5 - {00FFFF}Varios Los Aztecas`n{FFFAFA}6 - DM Zona`n7 - Liberty City`n8 - Прятки №1`n9 - Клуб Jizzy`n10 - Дерби`n11 - Каскадёрские трюки`n12 - Андромеда`n13 - Дом №1`n14 - Прятки №2`n15 - Дом №2`n16 - Тюрьма`n17 - Дом №3`n18 - VineWood`n", "Закрыть")
return
}
if(RegExMatch(chat, "^\/setweather"))
{
if(RegExMatch(chat, "^\/setweather([^ ])"))
return
if((RegExMatch(chat, "^\/setweather$") || RegExMatch(chat, "^\/setweather $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /setweather [id погоды]")
    return
}
RegExMatch(chat, "^\/setweather ([\dA-Za-z_\[\]]+)", t)
id := t1
setWeather(id)
AddChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Погода изменена на: {ffc801}"id)
if(id < 0)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Вы вернули погоду на стандартную")
    return
}
}
if(RegExMatch(chat, "^\/gomp") && Alevel >= 3)
{
RegExMatch(chat, "/gomp (.*) (.*) (.*)", gomp)
If (gomp3<0)
{
AddChatMessageEx("FFD700", "{FFD700}[AHK]`n{FFFFFF}Используйте`n{FFD700}»`n{FFFFFF}/gomp [Ваш ID] ""Название МП"" [Кол-во участников]")
AddChatMessageEx("FFD700", "{FFD700}[AHK]`n{FFFFFF}Пример`n{FFD700}»`n{FFFFFF}/gomp 32 ""Дерби"" 30")
}
Else
{
    vkl := 1
    SendChat("/msg Уважаемые игроки сейчас пройдет МП: "gomp2)
    Sleep 3000
    SendChat("/msg После того как телепортировали - строй у стены.")
    Sleep 3000
    SendChat("/msg Максимальное количество участников: "gomp3)
    Sleep 3000
    SendChat("/msg Кого телепортировать на мероприятие /sms " gomp1 " +")
    i := 0
    Filename=%A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    Loop, read, %Filename%
    nstroki=%A_Index%
    starta:
    if vkl=0
    return
    FileReadLine, stroka, %Filename%, %nstroki%
    if ErrorLevel
    {
        nstroki-=1
        goto starta
    }
    if stroka=
    {
        nstroki+=1
        goto starta
    }
    IfInString, stroka, SMS от
    {
        if (InStr(stroka, "+"))
        {
            RegExMatch(stroka,  ".*\[ID:\E(.*)\].", idigroka)
            SendChat("/resgun " idigroka1)
            SendChat("/tpks " idigroka1)
            i := i+1
            nstroki+=1
            if (i=gomp3)
            {
                SendChat("/msg Набрано максимальное количество участников. Телепорт окончен.")
                vkl := 0
            }
            Else
            goto starta
        }
    }
    nstroki+=1
    goto starta
    return
}
:?:/mpoff::
{
    if vkl=1
    {
        vkl := 0
        SendChat("/msg Телепорт участников на МП окончен.")
    }
    return
}
}
if(RegExMatch(chat, "^\/tpall") && Alevel >= 3)
{
showGameText("~y~Teleport:~n~~g~checking...", 1000, 4)
Sleep 250
Players := []
dout := ""
Players := getStreamedInPlayersInfo()
p := 0
For i, o in Players
{
    l := []
    l := getPedCoordinates(o.PED)
    p++
    pos := getCoordinates()
    Name := getPlayerNameById(i)
    Dist := getDist(getCoordinates() ,l)
    idskin := getTargetPlayerSkinIdById(i)
    inveh := isTargetInAnyVehicleById(i)
    pcolor := getPlayerColor(i)
    cts := colorToStr(pcolor)
if (cts=="{9a400}")
    {
    StringReplace, cts, cts, {9a400}, {098A00}, All
    }
else if (cts=="{dedff}")
    {
    StringReplace, cts, cts, {dedff}, {00FFFE}, All
    }
    if (inveh=="1")
    {
    inv := " {A9C4E4}| " cts "В Т/С{A9C4E4}[" cts "" getTargetVehicleModelNameById(i) "{A9C4E4}]"
    }
    else
    {
        inv := ""
    }
    if (idskin=="41" or idskin=="114" or idskin=="115" or idskin=="116" or idskin=="119" or idskin=="292")
    {
        SendChat("/tpks " i "`n")
    }
    else if (idskin=="102" or idskin=="103" or idskin=="104" or idskin=="195" or idskin=="297")
    {
        SendChat("/tpks " i "`n")
    }
    else if (idskin=="105" or idskin=="106" or idskin=="107" or idskin=="269" or idskin=="270" or idskin=="271" or idskin=="86" or idskin=="271" or idskin=="56" or idskin=="293")
    {
        SendChat("/tpks " i "`n")
    }
    else
    {
        SendChat("/tpks " i "`n")
    }
}
if (p=="0")
{
    showGameText("~y~AutoSkin: ~n~~r~no players", 1000, 4)
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Нету игроков в зоне прорисовки")
}
}
if(RegExMatch(chat, "^\/kesha") && Alevel >= 3)
{
showGameText("~y~Kesha:~n~~g~checking...", 1000, 4)
Sleep 250
Players := []
dout := ""
Players := getStreamedInPlayersInfo()
p := 0
For i, o in Players
{
    l := []
    l := getPedCoordinates(o.PED)
    p++
    pos := getCoordinates()
    Name := getPlayerNameById(i)
    Dist := getDist(getCoordinates() ,l)
    idskin := getTargetPlayerSkinIdById(i)
    inveh := isTargetInAnyVehicleById(i)
    pcolor := getPlayerColor(i)
    cts := colorToStr(pcolor)
if (cts=="{9a400}")
    {
    StringReplace, cts, cts, {9a400}, {098A00}, All
    }
else if (cts=="{dedff}")
    {
    StringReplace, cts, cts, {dedff}, {00FFFE}, All
    }
    if (inveh=="1")
    {
    inv := " {A9C4E4}| " cts "В Т/С{A9C4E4}[" cts "" getTargetVehicleModelNameById(i) "{A9C4E4}]"
    }
    else
    {
        inv := ""
    }
    if (idskin=="41" or idskin=="114" or idskin=="115" or idskin=="116" or idskin=="119" or idskin=="292")
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Down 16}
        Sleep 10
    SendInput {Enter}
    }
    else if (idskin=="102" or idskin=="103" or idskin=="104" or idskin=="195" or idskin=="297")
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Down 16}
        Sleep 10
    SendInput {Enter}
    }
    else if (idskin=="105" or idskin=="106" or idskin=="107" or idskin=="269" or idskin=="270" or idskin=="271" or idskin=="86" or idskin=="271" or idskin=="56" or idskin=="293")
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Down 16}
        Sleep 10
    SendInput {Enter}
    }
    else
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Down 16}
        Sleep 10
    SendInput {Enter}
    }
}
if (p=="0")
{
    showGameText("~y~AutoSkin: ~n~~r~no players", 1000, 4)
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Нету игроков в зоне прорисовки")
}
}
if(RegExMatch(chat, "^\/objdell") && Alevel >= 3)
{
showGameText("~y~DellObject:~n~~g~checking...", 1000, 4)
Sleep 250
Players := []
dout := ""
Players := getStreamedInPlayersInfo()
p := 0
For i, o in Players
{
    l := []
    l := getPedCoordinates(o.PED)
    p++
    pos := getCoordinates()
    Name := getPlayerNameById(i)
    Dist := getDist(getCoordinates() ,l)
    idskin := getTargetPlayerSkinIdById(i)
    inveh := isTargetInAnyVehicleById(i)
    pcolor := getPlayerColor(i)
    cts := colorToStr(pcolor)
if (cts=="{9a400}")
    {
    StringReplace, cts, cts, {9a400}, {098A00}, All
    }
else if (cts=="{dedff}")
    {
    StringReplace, cts, cts, {dedff}, {00FFFE}, All
    }
    if (inveh=="1")
    {
    inv := " {A9C4E4}| " cts "В Т/С{A9C4E4}[" cts "" getTargetVehicleModelNameById(i) "{A9C4E4}]"
    }
    else
    {
        inv := ""
    }
    if (idskin=="41" or idskin=="114" or idskin=="115" or idskin=="116" or idskin=="119" or idskin=="292")
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Enter}
    }
    else if (idskin=="102" or idskin=="103" or idskin=="104" or idskin=="195" or idskin=="297")
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Enter}
    }
    else if (idskin=="105" or idskin=="106" or idskin=="107" or idskin=="269" or idskin=="270" or idskin=="271" or idskin=="86" or idskin=="271" or idskin=="56" or idskin=="293")
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Enter}
    }
    else
    {
        SendChat("/obj " i "`n")
        Sleep 100
    SendInput {Enter}
    }
}
if (p=="0")
{
    showGameText("~y~AutoSkin: ~n~~r~no players", 1000, 4)
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Нету игроков в зоне прорисовки")
}
}
if(RegExMatch(chat, "^\/askin") && Alevel >= 3)
{
if(RegExMatch(chat, "^\/askin([^ ])"))
return
if((RegExMatch(chat, "^\/askin$") || RegExMatch(chat, "^\/askin $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /askin [id скина]")
    return
}
RegExMatch(chat, "^\/askin ([\dA-Za-z_\[\]]+)", t)
id := t1
showGameText("~y~AutoSkin:~n~~g~checking...", 1000, 4)
Sleep 250
Players := []
dout := ""
Players := getStreamedInPlayersInfo()
p := 0
For i, o in Players
{
    l := []
    l := getPedCoordinates(o.PED)
    p++
    pos := getCoordinates()
    Name := getPlayerNameById(i)
    Dist := getDist(getCoordinates() ,l)
    idskin := getTargetPlayerSkinIdById(i)
    inveh := isTargetInAnyVehicleById(i)
    pcolor := getPlayerColor(i)
    cts := colorToStr(pcolor)
if (cts=="{9a400}")
    {
    StringReplace, cts, cts, {9a400}, {098A00}, All
    }
else if (cts=="{dedff}")
    {
    StringReplace, cts, cts, {dedff}, {00FFFE}, All
    }
    if (inveh=="1")
    {
    inv := " {A9C4E4}| " cts "В Т/С{A9C4E4}[" cts "" getTargetVehicleModelNameById(i) "{A9C4E4}]"
    }
    else
    {
        inv := ""
    }
    if (idskin=="41" or idskin=="114" or idskin=="115" or idskin=="116" or idskin=="119" or idskin=="292")
    {
        SendChat("/setskin " i " " id "`n")
    }
    else if (idskin=="102" or idskin=="103" or idskin=="104" or idskin=="195" or idskin=="297")
    {
        SendChat("/setskin " i " " id "`n")
    }
    else if (idskin=="105" or idskin=="106" or idskin=="107" or idskin=="269" or idskin=="270" or idskin=="271" or idskin=="86" or idskin=="271" or idskin=="56" or idskin=="293")
    {
        SendChat("/setskin " i " " id "`n")
    }
    else
    {
        SendChat("/setskin " i " " id "`n")
    }
}
if (p=="0")
{
    showGameText("~y~AutoSkin: ~n~~r~no players", 1000, 4)
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Нету игроков в зоне прорисовки")
}
if(id < 0)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Не верно указан ID скина")
    return
}
}
if(RegExMatch(chat, "^\/ahp") && Alevel >= 4)
{
if(RegExMatch(chat, "^\/ahp([^ ])"))
return
if((RegExMatch(chat, "^\/ahp$") || RegExMatch(chat, "^\/ahp $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /ahp [кол-во ХП]")
    return
}
RegExMatch(chat, "^\/ahp ([\dA-Za-z_\[\]]+)", t)
id := t1
showGameText("~y~AutoHP:~n~~g~checking...", 1000, 4)
Sleep 250
Players := []
dout := ""
Players := getStreamedInPlayersInfo()
p := 0
For i, o in Players
{
    l := []
    l := getPedCoordinates(o.PED)
    p++
    pos := getCoordinates()
    Name := getPlayerNameById(i)
    Dist := getDist(getCoordinates() ,l)
    idskin := getTargetPlayerSkinIdById(i)
    inveh := isTargetInAnyVehicleById(i)
    pcolor := getPlayerColor(i)
    cts := colorToStr(pcolor)
if (cts=="{9a400}")
    {
    StringReplace, cts, cts, {9a400}, {098A00}, All
    }
else if (cts=="{dedff}")
    {
    StringReplace, cts, cts, {dedff}, {00FFFE}, All
    }
    if (inveh=="1")
    {
    inv := " {A9C4E4}| " cts "В Т/С{A9C4E4}[" cts "" getTargetVehicleModelNameById(i) "{A9C4E4}]"
    }
    else
    {
        inv := ""
    }
    if (idskin=="41" or idskin=="114" or idskin=="115" or idskin=="116" or idskin=="119" or idskin=="292")
    {
        SendChat("/sethp " i " " id "`n")
    }
    else if (idskin=="102" or idskin=="103" or idskin=="104" or idskin=="195" or idskin=="297")
    {
        SendChat("/sethp " i " " id "`n")
    }
    else if (idskin=="105" or idskin=="106" or idskin=="107" or idskin=="269" or idskin=="270" or idskin=="271" or idskin=="86" or idskin=="271" or idskin=="56" or idskin=="293")
    {
        SendChat("/sethp " i " " id "`n")
    }
    else
    {
        SendChat("/sethp " i " " id "`n")
    }
}
if (p=="0")
{
    showGameText("~y~AutoHP: ~n~~r~no players", 1000, 4)
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Нету игроков в зоне прорисовки")
}
}
if(RegExMatch(chat, "^\/regi") && Alevel >= 2)
{
if(RegExMatch(chat, "^\/regi([^ ])"))
return
if((RegExMatch(chat, "^\/regi$") || RegExMatch(chat, "^\/regi $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /regi [ID игрока]")
    return
}
RegExMatch(chat, "/regi (.*)", regi)
asdf1 := getPlayerNameById(regi1)
nicknameigroka := RegExReplace(asdf1, "^(\[DM\]|\[GW\]|\[TR\])*")
SendChat("/getstats "regi1)
Sleep 200
Text := getDialogText()
dialog := getDialogLines()
RegExMatch(Text,"{ffffff}Тек. IP: 			{FFD700}(.*)",ipadress)
RegExMatch(Text,"{ffffff}Рег. IP: 			{FFD700}(.*)\n",regiip)
SendInput {Enter}
Sleep 10
IP1:=regiip1
IP2:=ipadress1
nickip:=nicknameigroka
infip1:=loadinformtoIpRu(IP1)
infip2:=loadinformtoIpRu(IP2)
infaip1:=infip1[3]
infaip2:=infip2[3]
HTTP := ComObjCreate("WinHTTP.WinHTTPRequest.5.1")
HTTP.Open("GET", "https://www.avtodispetcher.ru/distance/?from=" infaip1 "&to=" infaip2)
HTTP.Send()
Info := HTTP.ResponseText
RegExMatch(Info, "Расстояние: <span id=""totalDistance"">(.*)</span> км; Время: <span id=""totalTime"">([0-9:.]+)</span>", out)
if (out1=="" && out2=="")
{
    out1:=0
    out2:=0
}
if (IP1==IP2)
INFOIP:="{00FF00}IP совпадают"
else
INFOIP:="{FF0000}IP не совпадают"
AddChatMessageEx("FFFFFF","{FFFFFF}Проверка IP | Ник:{ffc801} "nickip)
AddChatMessageEx("FFFFFF","{FFFFFF}Рег. IP: {ffc801} " IP1 " {FFFFFF}Cтрана: {ffc801} " infip1[1] " {FFFFFF}| Город:{ffc801} " infip1[3])
AddChatMessageEx("FFFFFF","{FFFFFF}Провайдер IP: {ffc801} "infip1[8])
AddChatMessageEx("FFFFFF","{FFFFFF}Тек. IP: {ffc801} " IP2 " {FFFFFF}Страна: {ffc801} " infip2[1] " {FFFFFF}| Город:{ffc801} " infip2[3])
AddChatMessageEx("FFFFFF","{FFFFFF}Провайдер IP: {ffc801} "infip2[8])
AddChatMessageEx("FFFFFF","{FFFFFF}Расстояние между городами:{ffc801} " out1 "{FFFFFF} км | Примерное время:{ffc801} "out2)
Return
}
loadinformtoIpRu(IP){
UrlDownloadToFile, % "http://api.2ip.ua/geo.xml?ip=" IP, ipinfo.xml
UrlDownloadToFile, % "http://api.2ip.ua/provider.xml?ip=" IP, infprov.xml
FileRead, ipinfo, *P65001 %A_ScriptDir%\ipinfo.xml
FileRead, infprov, *P65001 %A_ScriptDir%\infprov.xml
RegExMatch(ipinfo,"<country_rus>(.*)</country_rus>.*<region_rus>(.*)</region_rus>.*<city_rus>(.*)</city_rus>.*<latitude>(.*)</latitude>.*<longitude>(.*)</longitude>.*<time_zone>(.*)</time_zone>",infip)
infprov := RegExReplace(infprov,"&quot;","''")
RegExMatch(infprov,"<ip>(.*)</ip>.*<name_rus>(.*)</name_rus>.*<site>(.*)</site>",infp)
FileDelete, %A_ScriptDir%\ipinfo.xml
FileDelete, %A_ScriptDir%\infprov.xml
infip := Array(infip1,infip2,infip3,infip4,infip5,infip6,infp1,infp2,infp3)
return infip
}
if(RegExMatch(chat, "^\/clear"))
{
loop 20
addChatMessageEx("FFFFFF","")
return
}
if(RegExMatch(chat, "^\/ahkhelp"))
{
Sleep 250
showDialog("0", "{ffc801}Список команд", "{ffc801}/ahkhelp{FFFFFF} - Посмотреть все команды AHK скрипта`n{ffc801}/z [ID]{FFFFFF} - Показать статистику игрока: Ник, убийства, пинг`n{ffc801}/clear{FFFFFF} - Очистить чат`n{ffc801}/cc [ID]{FFFFFF} - Скопировать ник`n{ffc801}/ii [часть ника] [число показов] {FFFFFF}- Поиск игроков по нику`n{ffc801}/tplist{FFFFFF} - Посмотреть список доступных телепортов (/atp)`n{ffc801}/cv [ID]{FFFFFF} - изменить цвет ника игроку (Поможет для /btrack)`n{ffc801}/mutehelp{FFFFFF} - Таблица наказаний с выдачей блокировки чата`n{ffc801}/jailhelp{FFFFFF} - Таблица наказаний с выдачей тюрьмы`n{ffc801}/banhelp{FFFFFF} - Таблица наказаний с выдачей бана`n{ffc801}/iphelp{FFFFFF} - Таблица наказаний с выдачей бана по IP`n{ffc801}/setweather [ID погоды]{FFFFFF} - Изменить погоду, подобно /settime`n{ffc801}/regi [ID]{FFFFFF}- Таже что и /geoip, только через другой сайт проверка {FF0000}(2 lvl)`n{ffc801}/atp [ID локации]{FFFFFF} - Телепорт в интерьеры {FF0000}(3 lvl)`n{ffc801}/gomp{FFFFFF} - Объявить о начале МП, телепорт игроков, которые напишу в /sms ""+""{FF0000} (3 lvl)`n{ffc801}/mpoff{FFFFFF} - Принудительно закончить телепорт игроков{FF0000} (3 lvl)`n{ffc801}/askin [ID скина]{FFFFFF} - Сменить скин всем игрокам в зоне прорисовки{FF0000}(3 lvl)`n{ffc801}/tpall{FFFFFF} - Телепортировать всех игроков в зоне прорисовки к себе{FF0000}(3 lvl)`n{ffc801}/kesha{FFFFFF} - Выдать костюм попугая всем игрокам в зоне прорисовки{FF0000}(3 lvl)`n{ffc801}/objdell{FFFFFF} - Удалить все объекты с игроков в зоне прорисовки{FF0000}(3 lvl)`n{ffc801}/ioffban{FFFFFF} - Забанить игрока + IP адрес {FF0000}(3 lvl)`n{ffc801}/geoip [ID] [0/1]{FFFFFF}- Проверить регистрационные данные {FF0000}(4 lvl)`n{ffc801}/lunban{FFFFFF} - Разбанить последнего забанненого игрока {FF0000}(4 lvl)`n{ffc801}/iunban [Nick]{FFFFFF} - Разбанить игрока + IP адрес {FF0000}(4 lvl)`n{ffc801}/ahp [Кол-во]{FFFFFF} - Выдать HP всем игрокам в зоне прорисовки{FF0000}(4 lvl)`n", "OK")
Return
}
if(RegExMatch(chat, "^\/tpc"))
{
SendChat("/aint")
Sleep 10
SendChat("/tp 1")
Sleep 10
SendChat("/tpc")
Return
}
if(RegExMatch(chat, "^\/cv"))
{
if(RegExMatch(chat, "^\/cv([^ ])"))
return
if((RegExMatch(chat, "^\/cv$") || RegExMatch(chat, "^\/cv $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /cv [id игрока]")
    return
}
RegExMatch(chat, "^\/cv ([\dA-Za-z_\[\]]+)", cv)
mem := setPlayerColor(cv1,0xFF33AA4)
if(cv1 < 0)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Не верно указан ID игрока")
    return
}
}
if(RegExMatch(chat, "^\/atp") && Alevel >= 3)
{
if(RegExMatch(chat, "^\/atp([^ ])"))
return
if((RegExMatch(chat, "^\/atp$") || RegExMatch(chat, "^\/atp $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /atp [id локации]")
    return
}
RegExMatch(chat, "^\/atp ([\dA-Za-z_\[\]]+)", atp)
If (atp1=1)
{
    SendChat("/aint")
}
If (atp1=2)
{
    SendChat("/aint")
    Sleep 100
    SendChat("/tp 1")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы к {009900}Grove Street Gang")
}
If (atp1=3)
{
    SendChat("/tpint 36")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы к {CC00FF}The Ballas Gang")
}
If (atp1=4)
{
    SendChat("/tpint 107")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы к {FFCD00}Los Santos Vagos")
}
If (atp1=5)
{
    SendChat("/tpint 17")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы к {00CCFF}Varios Los Aztecas")
}
If (atp1=6)
{
    SendChat("/tpint 113")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=7)
{
    SendChat("/tpint 101")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=8)
{
    SendChat("/tpint 41")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=9)
{
    SendChat("/tpint 100")
    Sleep 1
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=10)
{
    SendChat("/tpint 128")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=11)
{
    SendChat("/tpint 130")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
    Sleep 10
}
If (atp1=12)
{
    SendChat("/tpint 9")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=13)
{
    SendChat("/tpint 37")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=14)
{
    SendChat("/tpint 92")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=15)
{
    SendChat("/tpint 33")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=16)
{
    SendChat("/tpint 77")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=17)
{
    SendChat("/tpint 19")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
If (atp1=18)
{
    SendChat("/tpint 88")
addChatMessageEx(0xFFFFFFFF, "{FFFFFF}Вы были телепортированы.")
}
if(atp1 < 0)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Не верно указан номер локации")
    return
}
}
if(RegExMatch(chat, "^\/ma"))
{
if(RegExMatch(chat, "^\/ma([^ ])"))
return
if((RegExMatch(chat, "^\/ma$") || RegExMatch(chat, "^\/ma $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /ma [id игрока]")
    return
}
RegExMatch(chat, "^\/ma ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
SendChat("/mute " id " 180 Упоминание родных.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/bb"))
{
if(RegExMatch(chat, "^\/bb([^ ])"))
return
if((RegExMatch(chat, "^\/bb$") || RegExMatch(chat, "^\/bb $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте:{ffc801} /bb [id игрока]")
    return
}
RegExMatch(chat, "^\/bb ([\dA-Za-z_\[\]]+)", t)
id := t1
updateOScoreboardData()
gNick := getPlayerNameById(id)
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
SendChat("/mute " id " 10 Offtop in /report.")
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
}
if(RegExMatch(chat, "^\/stream") && god = 1)
{
if(RegExMatch(chat, "^\/stream([^ ])"))
return
StreamText := ""
callFuncForAllStreamedInPlayers("stream")
if(!strlen(StreamText))
return
showDialog(4, "Мониторинг", StreamText, "Закрыть")
return
}
if(RegExMatch(chat, "^\/cc"))
{
if(RegExMatch(chat, "^\/cc([^ ])"))
return
if((RegExMatch(chat, "^\/cc$") || RegExMatch(chat, "^\/cc $")))
{
addChatMessageEx("FFFFFF", "{FFFFFF}Используйте:{ffc801} /cc [id игрока]")
    return
}
RegExMatch(chat, "^\/cc ([\d]+)", t)
id := Floor(t1)
updateOScoreboardData()
gNick := getPlayerNameById(id)
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
ClipPutText(gNick)
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Никнейм {ffc801}" gNick "{FFFFFF} скопирован.")
return
}
if(RegExMatch(chat, "^\/geoip") && Alevel >= 4)
{
if(RegExMatch(chat, "^\/geoip([^ ])"))
return
if((RegExMatch(chat, "^\/geoip$") || RegExMatch(chat, "^\/geoip $")))
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Используйте: /geoip [id игрока] [0/1/2]")
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Значение: 0 - показать диалогом :: 1 - показать в чате :: Не указывать - показать по умолчанию")
    return
}
RegExMatch(chat, "^\/geoip (\d+)( (0|1))*", t)
id := Floor(t1)
updateOScoreboardData()
gNick := getPlayerNameById(id)
if(strlen(gNick) < 1)
{
addChatMessageEx("FFFFFF", "{ffc801}[AHK] {FFFFFF}Игрок ненайден")
    return
}
if(strlen(t3))
{
    oldgeoOpen := geoOpen
    geoOpen := t3+1
}
gLastGeoipID := id
sendChat("/geti " id)
ipChecked := true
return
}
else
{
SendChat(chat)
}
}
}
return
stream(o)
{
global
StreamText .= o.NAME "[" o.ID "]`t" o.SCORE "`t" o.PING "`n"
return
}
~!Tab::
if(isOpenChat)
isOpenChat := 0
return
~*Escape::
if(isOpenChat)
isOpenChat := 0
return
!F12::
Process, Close, gta_sa.exe
return
~*vk54::
if(!isOpenChat && !isDialogOpen() && isRu() && isOpenT)
{
isOpenChat := 1
SendInput, {f6}
}
if(!isOpenChat)
isOpenChat := 1
return
~*F6::
if(isOpenChat)
isOpenChat := 0
else
isOpenChat := 1
return
toggleNoReload(tog := -1)
{
if(!checkHandles())
return -1
byte := readMem(hGTA, 0x7428B0, 1, "byte")
if((tog == -1 && byte == 137) || tog == true || tog == 1)
{
writeBytes(hGTA, 0x7428B0, "909090")
return true
} else if((tog == -1 && byte == 144) || !tog)
{
writeBytes(hGTA, 0x7428B0, "894608")
return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
toggleNoRecoil(tog := -1)
{
if(!checkHandles())
return -1
byte := readMem(hGTA, 0x740450, 1, "byte")
if((tog == -1 && byte == 216) || tog == true || tog == 1)
{
writeBytes(hGTA, 0x740450, "90909090909090909090")
return true
} else if((tog == -1 && byte == 144) || !tog)
{
writeBytes(hGTA, 0x740450, "D80D3C8B8500D84C241C")
return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
toggleAntiBikeFall(tog := -1)
{
if(!checkHandles())
return -1
byte := readMem(hGTA, 0x4BA3B9, 1, "byte")
if((tog == -1 && byte == 15) || tog == true || tog == 1)
{
writeBytes(hGTA, 0x4BA3B9, "E9A703000090")
return true
} else if((tog == -1 && byte == 233) || !tog)
{
writeBytes(hGTA, 0x4BA3B9, "0F84A6030000")
return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
setCoordinates(x, y, z, Interior) {
if(!checkHandles())
return False
dwAddress := readMem(hGTA, ADDR_SET_POSITION)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
Return False
}
dwAddress := readMem(hGTA, dwAddress + ADDR_SET_POSITION_OFFSET)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
Return False
}
Sleep 100
writeByte(hGTA, ADDR_SET_INTERIOR_OFFSET, Interior)
if(ErrorLevel) {
ErrorLevel := ERROR_WRITE_MEMORY
Return False
}
writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_X_OFFSET, x)
if(ErrorLevel) {
ErrorLevel := ERROR_WRITE_MEMORY
Return False
}
writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Y_OFFSET, y)
if(ErrorLevel) {
ErrorLevel := ERROR_WRITE_MEMORY
Return False
}
writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Z_OFFSET, z)
if(ErrorLevel) {
ErrorLevel := ERROR_WRITE_MEMORY
Return False
}
Return True
}
setWeather(id)
{
if(!checkHandles())
return
VarSetCapacity(weather, 1, 0)
NumPut(id, weather, 0, "Int")
writeRaw(hGTA, 0xC81320, &weather, 1)
if(ErrorLevel)
return false
return true
}
setPlayerName(playerid, newnick) {
if(!checkHandles() || !strlen(newnick))
return 0
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
if(ErrorLevel || dwPlayers==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+playerid*4)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(dwRemoteplayer==0)
return 0
dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
sUsername := ""
if(dwTemp <= 0xf)
{
sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
writeString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, newnick)
}
else {
dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
sUsername := readString(hGTA, dwAddress, 25)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
writeString(hGTA, dwAddress, newnick)
}
ErrorLevel := ERROR_OK
return 1
}
setPlayerColor(id,color)
{
id += 0
color +=0
if(!checkHandles())
return
VarSetCapacity(bla, 4, 0)
NumPut(color,bla,0,"UInt")
writeRaw(hGTA, dwSAMP + 0x216378 + 4*id, &bla, 4)
}
GetInterior()
{
dwAddress := readDWORD(hGTA, ADDR_SET_INTERIOR_OFFSET)
if (ErrorLevel || dwAddress == 0) {
ErrorLevel := ERROR_READ_MEMORY
return false
}
return true
}
writeBytes(handle, address, bytes)
{
length := strlen(bytes) / 2
VarSetCapacity(toInject, length, 0)
Loop %length%
{
byte := "0x" substr(bytes, ((A_Index - 1) * 2) + 1, 2)
NumPut(byte, toInject, A_Index - 1, "uchar")
}
return writeRaw(handle, address, &toInject, length)
}
writeByte(hProcess, dwAddress, wInt) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
wInt := IntToHex(wInt)
dwRet := DllCall(     "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "UInt *", wInt
, "UInt", 1
, "UInt *", 0)
}
writeFloat(hProcess, dwAddress, wFloat) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
wFloat := FloatToHex(wFloat)
dwRet := DllCall(   "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "UInt *", wFloat
, "UInt", 4
, "UInt *", 0)
ErrorLevel := ERROR_OK
return true
}
IntToHex(int)
{
CurrentFormat := A_FormatInteger
SetFormat, integer, hex
int += 0
SetFormat, integer, %CurrentFormat%
return int
}
FloatToHex(value) {
format := A_FormatInteger
SetFormat, Integer, H
result := DllCall("MulDiv", Float, value, Int, 1, Int, 1, UInt)
SetFormat, Integer, %format%
return, result
}
