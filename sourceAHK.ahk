unpackerhui := И нахуя тебе мой код?1
#NoEnv
#SingleInstance force
#include samp.ahk
#IfWinActive GTA:SA:MP
#UseHook On
SendMode Input


SplashTextoff
DIR = %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Settings
FileCreateDir, %DIR%
DIRSET = %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Settings\options.ini
IfNotExist,%DIR%\*.ini
{
    SplashTextOn, , 60,Monser Gang War AHK,Наберитесь терпения`nидёт установка нужных файлов...
    UrlDownloadToFile, https://www.dropbox.com/s/urpzy5kypr3jucv/options.ini?dl=1, %DIR%\options.ini
    SplashTextoff
}

SetTimer, Login, 100
SetTimer, chat, 100
SetTimer, alert, 1200000

hello := 1

if hello := 1
{
    ShowGameText("~g~thanks for downloading", 5000, 4)
}
toggleAntiBikeFall()
AdminNick:=getUsername()
pid:= getPlayerIdByName(getUsername())
FileRead, TempList, %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
IfExist, %DIR%\options.ini
{
    gosub, ReadSettings
Gui, Color, FFFFFF
Gui, Font, s10, Comic Sans MS
Gui, Add, Button, x215 y317 w150 h30 gSaveButton, Сохранить
Gui, Add, Button, x596 y86 w160 h40 gBinderTogether, Биндер
Gui, Add, Button, x596 y136 w160 h40 gLink, Тема на форуме
Gui, Add, Button, x596 y36 w160 h40 gCMDList1, Список команд
Gui, Add, Button, x596 y186 w160 h40 gTempList, Temp List
Gui, Add, Button, x596 y236 w160 h40 gInfoAHK, Информация о скрипте
Gui, Add, Text, x596 y296 w160 h60 +Center gClickMonser, Version: 1.7`nMONSER.RU`ntøgether © 2018
Gui, Font, s10, Comic Sans MS
Gui, Add, Tab, x6 y7 w580 h350 , Репорты|Муты|Кики и КПЗ|Баны|Дополнительно|Punishment
Gui, Font, , 
Gui, Tab, Репорты
Gui, Add, GroupBox, x16 y37 w270 h120 +Center, Слежка за игроком
Gui, Add, Hotkey, x26 y56 w60 h20 vrecon, %recon%
Gui, Add, Text, x96 y56 w160 h20 , Работаю по вашей жалобе
Gui, Add, Hotkey, x26 y86 w60 h20 vnorecon, %norecon%
Gui, Add, Text, x96 y86 w140 h20 , Нарушений не обнаружено
Gui, Add, Hotkey, x26 y116 w60 h20 vyesrecon, %yesrecon%
Gui, Add, Text, x96 y116 w120 h20 , Данный игрок наказан
Gui, Add, GroupBox, x16 y167 w540 h140 +Center, Часто задаваемые вопросы
Gui, Add, Hotkey, x26 y187 w60 h20 vleader, %leader%
Gui, Add, Text, x96 y187 w120 h20 , Как получить лидерку?
Gui, Add, Hotkey, x26 y217 w60 h20 varmor, %armor%
Gui, Add, Text, x96 y217 w130 h20 , Где взять бронежилет?
Gui, Add, Hotkey, x26 y247 w60 h20 vbuyadm, %buyadm%
Gui, Add, Text, x96 y247 w110 h20 , Как купить админку?
Gui, Add, Hotkey, x26 y277 w60 h20 vrifa, %rifa%
Gui, Add, Text, x96 y277 w140 h20 , Почему нет банды "Rifa"?
Gui, Add, Hotkey, x256 y187 w60 h20 vvip, %vip%
Gui, Add, Text, x326 y187 w140 h20 , Возможности "VIP"?
Gui, Add, Hotkey, x256 y217 w60 h20 vgwdm, %gwdm%
Gui, Add, Text, x326 y217 w140 h20 , Как перейти на GW/DM ?
Gui, Add, Hotkey, x256 y247 w60 h20 vduel, %duel%
Gui, Add, Text, x326 y247 w160 h20 , Как вызвать игрока на дуэль?
Gui, Add, Hotkey, x256 y277 w60 h20 vlc, %lc%
Gui, Add, Text, x326 y277 w210 h20 , Как создать свою личную локацию? (/lc)
Gui, Add, GroupBox, x296 y37 w260 h120 +Center +, Прочее
Gui, Add, Hotkey, x306 y56 w60 h20 vgg, %gg%
Gui, Add, Text, x376 y56 w140 h20 , Пожелать приятной игры
Gui, Add, Hotkey, x306 y86 w60 h20 vforum, %forum%
Gui, Add, Text, x376 y86 w170 h20 , Отправить на форум писать ЖБ
Gui, Add, Hotkey, x306 y116 w60 h20 vacc, %acc%
Gui, Add, Text, x376 y116 w170 h30 , Как встать на админку? (Именно встать)
Gui, Tab, Муты
Gui, Add, Hotkey, x16 y47 w60 h20 vflood, %flood%
Gui, Add, Text, x86 y47 w30 h20 , Flood
Gui, Add, Hotkey, x16 y77 w60 h20 vcaps, %caps%
Gui, Add, Text, x86 y77 w60 h20 , Caps Lock
Gui, Add, Hotkey, x16 y107 w60 h20 vpr, %pr%
Gui, Add, Text, x86 y107 w140 h20 , Реклама (Скайпа/Ресурса)
Gui, Add, Hotkey, x16 y137 w60 h20 vbuy, %buy%
Gui, Add, Text, x86 y137 w50 h20 , Торговля
Gui, Add, Hotkey, x16 y167 w60 h20 vofftoprep, %offtoprep%
Gui, Add, Text, x86 y167 w80 h20 , Offtop в репорт
Gui, Add, Hotkey, x16 y197 w60 h20 vmat, %mat%
Gui, Add, Text, x86 y197 w70 h20 , Мат в репорт
Gui, Add, Hotkey, x16 y227 w60 h20 vosk, %osk%
Gui, Add, Text, x86 y227 w70 h20 , Оск. игроков
Gui, Add, Hotkey, x16 y257 w60 h20 vmuterod, %muterod%
Gui, Add, Text, x86 y257 w180 h20 , Упоминание/Оскорбление родных
Gui, Add, Hotkey, x286 y257 w60 h20 vofftopo, %offtopo%
Gui, Add, Text, x356 y257 w60 h20 , Offtop в /o
Gui, Add, Hotkey, x286 y227 w60 h20 vneadekvat, %neadekvat%
Gui, Add, Text, x356 y227 w140 h20 , Неадекватное поведение
Gui, Add, Hotkey, x286 y197 w60 h20 voskadm, %oskadm%
Gui, Add, Text, x356 y197 w110 h20 , Оск. администрации
Gui, Add, Hotkey, x286 y167 w60 h20 vneyvaj, %neyvaj%
Gui, Add, Text, x356 y167 w160 h20 , Неуважение к администрации
Gui, Add, Hotkey, x286 y137 w60 h20 vkleveta, %kleveta%
Gui, Add, Text, x356 y137 w50 h20 , Клевета
Gui, Add, Hotkey, x286 y107 w60 h20 vnatsia, %natsia%
Gui, Add, Text, x356 y107 w180 h20 , Розжиг межнациональной розни
Gui, Add, Hotkey, x286 y77 w60 h20 vmovieadm, %movieadm%
Gui, Add, Text, x356 y77 w200 h20 , Обсуждение действий администрации
Gui, Add, Hotkey, x286 y47 w60 h20 vtrolladm, %trolladm%
Gui, Add, Text, x356 y47 w140 h20 , Троллинг администрации
Gui, Tab, Кики и КПЗ
Gui, Add, GroupBox, x16 y37 w260 h200 +Center, Кики
Gui, Add, Hotkey, x26 y57 w60 h20 vdb, %db%
Gui, Add, Text, x96 y57 w70 h20 , DriveBy (DB)
Gui, Add, Hotkey, x26 y87 w60 h20 vtk, %tk%
Gui, Add, Text, x96 y87 w70 h20 , Team Kill (TK)
Gui, Add, Hotkey, x26 y117 w60 h20 vspawn, %spawn%
Gui, Add, Text, x96 y117 w130 h20 , Помеха проходу/спавну
Gui, Add, Hotkey, x26 y147 w60 h20 vnickosk, %nickosk%
Gui, Add, Text, x96 y147 w110 h20 , Оскорбление в нике
Gui, Add, Hotkey, x26 y177 w60 h20 vcapturekick, %capturekick%
Gui, Add, Text, x96 y177 w130 h20 , Неправильный /capture
Gui, Add, Hotkey, x26 y207 w60 h20 vcheatkick, %cheatkick%
Gui, Add, Text, x96 y207 w40 h20 , Cheat
Gui, Add, GroupBox, x286 y37 w290 h200 +Center, Примечание
Gui, Add, Text, x296 y57 w270 h40 , Если на сервере присутствует администратор +2 уровня и выше`, не нужно кикать за такие причины как:
Gui, Add, Text, x296 y107 w270 h30 , Неправильный /capture (+2 уровень может выдать КПЗ)
Gui, Add, Text, x296 y147 w260 h30 , Оскорбление в нике (+3 уровень может забанить данного игрока)
Gui, Add, Text, x296 y187 w260 h30 , Cheat (+2 уровень может дать КПЗ`, либо +3 забанить)
Gui, Add, GroupBox, x16 y247 w560 h60 +Center, КПЗ
Gui, Add, Hotkey, x46 y267 w60 h20 vcheatkpz, %cheatkpz%
Gui, Add, Text, x126 y267 w30 h20 , Cheat
Gui, Add, Hotkey, x446 y267 w60 h20 vbagouse, %bagouse%
Gui, Add, Text, x526 y267 w40 h20 , Багоюз
Gui, Add, Text, x286 y267 w130 h20 , Неправильный /capture
Gui, Add, Hotkey, x196 y267 w60 h20 vcapturekpz, %capturekpz%
Gui, Tab, Баны
Gui, Add, Hotkey, x262 y69 w60 h20 vosknick, %osknick%
Gui, Add, Text, x332 y69 w110 h20 , Оскорбление в нике
Gui, Add, Hotkey, x262 y129 w60 h20 vfalseadm, %falseadm%
Gui, Add, Text, x332 y129 w120 h20 , Обман администрации
Gui, Add, Hotkey, x262 y159 w60 h20 vneadkvatv, %neadkvatv%
Gui, Add, Text, x332 y159 w160 h20 , Неадекватное поведение в /v
Gui, Add, Hotkey, x12 y129 w60 h20 vprban, %prban%
Gui, Add, Text, x82 y129 w140 h20 , Реклама любого ресурса
Gui, Add, Hotkey, x12 y159 w60 h20 voskadmban, %oskadmban%
Gui, Add, Text, x82 y159 w160 h20 , Оскорбление администрации
Gui, Add, Hotkey, x12 y99 w60 h20 voskrodban, %oskrodban%
Gui, Add, Text, x82 y99 w110 h20 , Оскорбление родных
Gui, Add, Hotkey, x262 y99 w60 h20 voskproject, %oskproject%
Gui, Add, Text, x332 y99 w120 h20 , Оскорбление проекта
Gui, Add, Hotkey, x12 y69 w60 h20 vcheatban, %cheatban%
Gui, Add, Text, x82 y69 w70 h20 , Cheat (3 lvl)
Gui, Add, GroupBox, x12 y189 w550 h120 +Center, Примечание
Gui, Add, Text, x22 y209 w530 h30 , Хочу напомнить`, что банить за "Рекламу" нужно внимательно и осознанно`, т.к. иногда можно ошибиться
Gui, Add, Text, x22 y239 w530 h30 , За рекламу скайпа даётся мут`, а не бан. Банить за рекламу нужно в том случае`, если человек рекламирует канал/сервер/группу в вк и т.д.
Gui, Add, Text, x239 y279 w100 h20 , Будьте бдительны
Gui, Add, Hotkey, x12 y39 w60 h20 vchecheatban, %checheatban%
Gui, Add, Text, x82 y39 w70 h20 , Cheat (4+ lvl)
Gui, Tab, Дополнительно
Gui, Add, GroupBox, x16 y37 w270 h80 +Center, Настройки /Duty
Gui, Add, Edit, x26 y87 w30 h20 vDuty,
Gui, Add, Text, x86 y87 w120 h20 , ID скина на дежурстве
Gui, Add, Hotkey, x26 y57 w60 h20 vbduty, %bduty%
Gui, Add, Text, x96 y57 w130 h20 , Заступить на дежурство
Gui, Add, GroupBox, x296 y37 w280 h140 +Center, Полезные функции
Gui, Add, CheckBox, x306 y117 w230 h20 vaduty Checked%aduty%, Автоматически заступать на дежурство
Gui, Add, CheckBox, x306 y57 w150 h20 vconoff Checked%conoff%, Автоматический /conoff
Gui, Add, CheckBox, x306 y87 w260 h20 vtimemute Checked%timemute%, Автоматический скриншот с /time при /mute
Gui, Add, GroupBox, x296 y187 w280 h110 +Center, Функции слежки
Gui, Add, Hotkey, x306 y207 w60 h20 voffre, %offre%
Gui, Add, Text, x376 y207 w120 h20 , Выйти из наблюдения
Gui, Add, Hotkey, x306 y237 w60 h20 vbanre, %banre%
Gui, Add, Text, x376 y237 w120 h20 , Забанить игрока в /re
Gui, Add, GroupBox, x16 y217 w270 h80 +Center, Читы
Gui, Add, Hotkey, x26 y237 w60 h20 vWH, %WH%
Gui, Add, Text, x96 y237 w110 h20 , Активация WallHack
Gui, Add, Hotkey, x26 y267 w60 h20 vWD, %WD%
Gui, Add, Text, x96 y267 w120 h20 , Активация WaterDrive
Gui, Add, Button, x396 y147 w80 h20 gMoreEwe, Ещё..
Gui, Add, Hotkey, x306 y267 w60 h20 vKPZre, %KPZre%
Gui, Add, Text, x376 y267 w160 h20 , Посадить игрока в КПЗ`, в /re
Gui, Add, GroupBox, x16 y127 w270 h80 +Center, AntiCheat на SpeedHack
Gui, Add, CheckBox, x26 y147 w120 h20 vAnticheatSh checked%AnticheatSh%, Включить AntiCheat
Gui, Add, Hotkey, x26 y177 w60 h20 vAntishre, %Antishre%
Gui, Add, Text, x96 y177 w170 h20 , Слежка за возможным читером
Gui, Tab, Punishment
Gui, Add, DropDownList, x22 y149 w110 h20 r5 gEditCmd vcmdpunish, /offmute|/offjail|/offban|/offcban
Gui, Add, Edit, x142 y149 w110 h20 vnicknamepunish, 
Gui, Add, DropDownList, x262 y149 w80 h20 r10 vdayspunish, %dayspunish%
Gui, Add, DropDownList, x352 y149 w70 h20 r4 choose1 vippunish Disabled, 2|5|30|90
Gui, Add, Edit, x432 y149 w130 h20 vreasonpunish, 
Gui, Add, Button, x22 y179 w150 h20 grestorepunish, Откат последнего действия
Gui, Add, Text, x22 y119 w110 h20 +Center, Команда
Gui, Add, Text, x142 y119 w110 h20 +Center, Ник
Gui, Add, Text, x262 y109 w80 h30 +Center, Срок наказания
Gui, Add, Text, x352 y119 w70 h20 +Center, Дни бана IP
Gui, Add, Text, x432 y119 w130 h20 +Center, Причина
Gui, Add, Button, x262 y179 w80 h20 gSaveButtonPunish, Добавить
Gui, Add, GroupBox, x12 y89 w570 h120 +Center, Панель выдачи
Gui, Add, Text, x12 y39 w570 h50 +Center, Данный раздел был создан для облегчения выдачи наказаний в оффлайн-режиме`, используйте с умом и осторожностью!`nПримечание: При каждой выдачи по всему списку он очищается!
Gui, Add, Hotkey, x12 y219 w70 h20 vpunishgo, %punishgo% 
Gui, Add, Text, x92 y219 w140 h20 , Выдать все наказания
Gui, Add, Text, x12 y249 w220 h20 , /dellpunish - очистить весь список
Gui, Show, x428 y149 h356 w769, AutoHotKey MGW
return
}
ReadSettings:
{
    IniRead, recon, %DIRSET%, Options, recon
    IniRead, norecon, %DIRSET%, Options, norecon
    IniRead, yesrecon, %DIRSET%, Options, yesrecon
    IniRead, leader, %DIRSET%, Options, leader
    IniRead, armor, %DIRSET%, Options, armor
    IniRead, buyadm, %DIRSET%, Options, buyadm
    IniRead, rifa, %DIRSET%, Options, rifa
    IniRead, vip, %DIRSET%, Options, vip
    IniRead, gwdm, %DIRSET%, Options, gwdm
    IniRead, duel, %DIRSET%, Options, duel
    IniRead, lc, %DIRSET%, Options, lc
    IniRead, gg, %DIRSET%, Options, gg
    IniRead, forum, %DIRSET%, Options, forum
    IniRead, acc, %DIRSET%, Options, acc
    IniRead, flood, %DIRSET%, Options, flood
    IniRead, caps, %DIRSET%, Options, caps
    IniRead, pr, %DIRSET%, Options, pr
    IniRead, buy, %DIRSET%, Options, buy
    IniRead, offtoprep, %DIRSET%, Options, offtoprep
    IniRead, mat, %DIRSET%, Options, mat
    IniRead, osk, %DIRSET%, Options, osk
    IniRead, muterod, %DIRSET%, Options, muterod
    IniRead, offtopo, %DIRSET%, Options, offtopo
    IniRead, neadekvat, %DIRSET%, Options, neadekvat
    IniRead, oskadm, %DIRSET%, Options, oskadm
    IniRead, neyvaj, %DIRSET%, Options, neyvaj
    IniRead, kleveta, %DIRSET%, Options, kleveta
    IniRead, natsia, %DIRSET%, Options, natsia
    IniRead, movieadm, %DIRSET%, Options, movieadm
    IniRead, trolladm, %DIRSET%, Options, trolladm
    IniRead, db, %DIRSET%, Options, db
    IniRead, tk, %DIRSET%, Options, tk
    IniRead, spawn, %DIRSET%, Options, spawn
    IniRead, nickosk, %DIRSET%, Options, nickosk
    IniRead, capturekick, %DIRSET%, Options, capturekick
    IniRead, cheatkick, %DIRSET%, Options, cheatkick
    IniRead, cheatkpz, %DIRSET%, Options, cheatkpz
    IniRead, bagouse, %DIRSET%, Options, bagouse
    IniRead, capturekpz, %DIRSET%, Options, capturekpz
    IniRead, osknick, %DIRSET%, Options, osknick
    IniRead, falseadm, %DIRSET%, Options, falseadm
    IniRead, neadkvatv, %DIRSET%, Options, neadkvatv
    IniRead, prban, %DIRSET%, Options, prban
    IniRead, oskadmban, %DIRSET%, Options, oskadmban
    IniRead, oskrodban, %DIRSET%, Options, oskrodban
    IniRead, oskproject, %DIRSET%, Options, oskproject
    IniRead, cheatban, %DIRSET%, Options, cheatban
    IniRead, checheatban, %DIRSET%, Options, checheatban
    IniRead, Duty, %DIRSET%, Options, Duty
    IniRead, bduty, %DIRSET%, Options, bduty
    IniRead, aduty, %DIRSET%, Options, aduty
    IniRead, conoff, %DIRSET%, Options, conoff
    IniRead, fon, %DIRSET%, Options, fon
    IniRead, timemute, %DIRSET%, Options, timemute
    IniRead, infore, %DIRSET%, Options, infore
    IniRead, offre, %DIRSET%, Options, offre
    IniRead, banre, %DIRSET%, Options, banre
    IniRead, WH, %DIRSET%, Options, WH
    IniRead, WD, %DIRSET%, Options, WD
    IniRead, KPZre, %DIRSET%, Options, KPZre
    IniRead, cvre, %DIRSET%, Options, cvre
    IniRead, ccban, %DIRSET%, Options, ccban
    Iniread, reoffre, %DIRSET%, Options, reoffre
    IniRead, antishre, %DIRSET%, Options, antishre
    IniRead, AnticheatSh, %DIRSET%, Options, AnticheatSh
    IniRead, hotkey1, %DIRSET%, Binder, hotkey1
    IniRead, hotkey2, %DIRSET%, Binder, hotkey2
    IniRead, hotkey3, %DIRSET%, Binder, hotkey3
    IniRead, hotkey4, %DIRSET%, Binder, hotkey4
    IniRead, hotkey5, %DIRSET%, Binder, hotkey5
    IniRead, hotkey6, %DIRSET%, Binder, hotkey6
    IniRead, hotkey7, %DIRSET%, Binder, hotkey7
    IniRead, hotkey8, %DIRSET%, Binder, hotkey8
    IniRead, hotkey9, %DIRSET%, Binder, hotkey9
    IniRead, hotkey10, %DIRSET%, Binder, hotkey10
    IniRead, hotkey11, %DIRSET%, Binder, hotkey11
    IniRead, hotkey12, %DIRSET%, Binder, hotkey12
    IniRead, edit1, %DIRSET%, Binder, edit1
    IniRead, edit2, %DIRSET%, Binder, edit2
    IniRead, edit3, %DIRSET%, Binder, edit3
    IniRead, edit4, %DIRSET%, Binder, edit4
    IniRead, edit5, %DIRSET%, Binder, edit5
    IniRead, edit6, %DIRSET%, Binder, edit6
    IniRead, edit7, %DIRSET%, Binder, edit7
    IniRead, edit8, %DIRSET%, Binder, edit8
    IniRead, edit9, %DIRSET%, Binder, edit9
    IniRead, edit10, %DIRSET%, Binder, edit10
    IniRead, edit11, %DIRSET%, Binder, edit11
    IniRead, edit12, %DIRSET%, Binder, edit12
    IniRead, enter1, %DIRSET%, Binder, enter1
    IniRead, enter2, %DIRSET%, Binder, enter2
    IniRead, enter4, %DIRSET%, Binder, enter4
    IniRead, enter5, %DIRSET%, Binder, enter5
    IniRead, enter7, %DIRSET%, Binder, enter7
    IniRead, enter8, %DIRSET%, Binder, enter8
    IniRead, enter9, %DIRSET%, Binder, enter9
    IniRead, enter10, %DIRSET%, Binder, enter10
    IniRead, enter11, %DIRSET%, Binder, enter11
    IniRead, enter12, %DIRSET%, Binder, enter12
    IniRead, editmsgsleep1, %DIRSET%, BinderMSG, editmsgsleep1
    IniRead, editmsgsleep2, %DIRSET%, BinderMSG, editmsgsleep2
    IniRead, editmsgsleep3, %DIRSET%, BinderMSG, editmsgsleep3
    IniRead, editmsg1, %DIRSET%, BinderMSG, editmsg1
    IniRead, editmsg2, %DIRSET%, BinderMSG, editmsg2
    IniRead, editmsg3, %DIRSET%, BinderMSG, editmsg3
    IniRead, editmsg4, %DIRSET%, BinderMSG, editmsg4
    IniRead, editmsg5, %DIRSET%, BinderMSG, editmsg5
    IniRead, hotkeymsg1, %DIRSET%, BinderMSG, hotkeymsg1
    IniRead, hotkeymsg2, %DIRSET%, BinderMSG, hotkeymsg2
    Iniread, youroff1, %DIRSET%, Polez, youroff1
    Iniread, youroff2, %DIRSET%, Polez, youroff2
    Iniread, yourcmd1, %DIRSET%, Polez, yourcmd1
    Iniread, yourcmd2, %DIRSET%, Polez, yourcmd2
    IniRead, punishgo, %DIRSET%, Punishment, punishgo
    {
        if recon=ERROR
        {
            recon=
        }
        if norecon=ERROR
        {
            norecon=
        }
        if yesrecon=ERROR
        {
            yesrecon=
        }
        if leader=ERROR
        {
            leader=
        }
        if armor=ERROR
        {
            armor=
        }
        if buyadm=ERROR
        {
            buyadm=
        }
        if rifa=ERROR
        {
            rifa=
        }
        if vip=ERROR
        {
            vip=
        }
        if gwdm=ERROR
        {
            gwdm=
        }
        if duel=ERROR
        {
            duel=
        }
        if lc=ERROR
        {
            lc=
        }
        if gg=ERROR
        {
            gg=
        }
        if acc=ERROR
        {
            acc=
        }
        if forum=ERROR
        {
            forum=
        }
        if flood=ERROR
        {
            flood=
        }
        if caps=ERROR
        {
            caps=
        }
        if pr=ERROR
        {
            pr=
        }
        if buy=ERROR
        {
            buy=
        }
        if offtoprep=ERROR
        {
            offtoprep=
        }
        if mat=ERROR
        {
            mat=
        }
        if osk=ERROR
        {
            osk=
        }
        if muterod=ERROR
        {
            muterod=
        }
        if offtopo=ERROR
        {
            offtopo=
        }
        if neadekvat=ERROR
        {
            neadekvat=
        }
        if oskadm=ERROR
        {
            oskadm=
        }
        if neyvaj=ERROR
        {
            neyvaj=
        }
        if kleveta=ERROR
        {
            kleveta=
        }
        if natsia=ERROR
        {
            natsia=
        }
        if movieadm=ERROR
        {
            movieadm=
        }
        if trolladm=ERROR
        {
            trolladm=
        }
        if db=ERROR
        {
            db=
        }
        if tk=ERROR
        {
            tk=
        }
        if spawn=ERROR
        {
            spawn=
        }
        if nickosk=ERROR
        {
            nickosk=
        }
        if capturekick=ERROR
        {
            capturekick=
        }
        if cheatkick=ERROR
        {
            cheatkick=
        }
        if cheatkpz=ERROR
        {
            cheatkpz=
        }
        if bagouse=ERROR
        {
            bagouse=
        }
        if capturekpz=ERROR
        {
            capturekpz=
        }
        if osknick=ERROR
        {
            osknick=
        }
        if falseadm=ERROR
        {
            falseadm=
        }
        if neadkvatv=ERROR
        {
            neadkvatv=
        }
        if prban=ERROR
        {
            prban=
        }
        if oskadmban=ERROR
        {
            oskadmban=
        }
        if oskrodban=ERROR
        {
            oskrodban=
        }
        if oskproject=ERROR
        {
            oskproject=
        }
        if cheatban=ERROR
        {
            cheatban=
        }
        if checheatban=ERROR
        {
            checheatban=
        }
        if Duty=ERROR
        {
            Duty=
        }
        if bduty=ERROR
        {
            bduty=
        }
        if aduty=ERROR
        {
            aduty=
        }
        if conoff=ERROR
        {
            conoff=
        }
        if fon=ERROR
        {
            fon=
        }
        if timemute=ERROR
        {
            timemute=
        }
        if ccban=ERROR
        {
            ccban=
        }
        if infore=ERROR
        {
            infore=
        }
        if offre=ERROR
        {
            offre=
        }
        if banre=ERROR
        {
            banre=
        }
        if WH=ERROR
        {
            WH=
        }
        if WD=ERROR
        {
            WD=
        }
        if KPZre=ERROR
        {
            KPZre=
        }
        if cvre=ERROR
        {
            cvre=
        }
        if reoffre=ERROR
        {
            reoffre=
        }
        if AnticheatSh=ERROR
        {
            AnticheatSh=
        }
        If Antishre=ERROR
        {
            Antishre=
        }
        if hotkey1=ERROR
        {
            hotkey1=
        }
        if hotkey2=ERROR
        {
            hotkey2=
        }
        if hotkey3=ERROR
        {
            hotkey3=
        }
        if hotkey4=ERROR
        {
            hotkey4=
        }
        if hotkey5=ERROR
        {
            hotkey5=
        }
        if hotkey6=ERROR
        {
            hotkey6=
        }
        if hotkey7=ERROR
        {
            hotkey7=
        }
        if hotkey8=ERROR
        {
            hotkey8=
        }
        if hotkey9=ERROR
        {
            hotkey9=
        }
        if hotkey10=ERROR
        {
            hotkey10=
        }
        if hotkey11=ERROR
        {
            hotkey11=
        }
        if hotkey12=ERROR
        {
            hotkey12=
        }
        if edit1=ERROR
        {
            edit1=
        }
        if edit2=ERROR
        {
            edit2=
        }
        if edit3=ERROR
        {
            edit3=
        }
        if edit4=ERROR
        {
            edit4=
        }
        if edit5=ERROR
        {
            edit5=
        }
        if edit6=ERROR
        {
            edit6=
        }
        if edit7=ERROR
        {
            edit7=
        }
        if edit8=ERROR
        {
            edit8=
        }
        if edit9=ERROR
        {
            edit9=
        }
        if edit10=ERROR
        {
            edit10=
        }
        if edit11=ERROR
        {
            edit11=
        }
        if edit12=ERROR
        {
            edit12=
        }
        if enter1=ERROR
        {
            enter1=
        }
        if enter2=ERROR
        {
            enter2=
        }
        if enter3=ERROR
        {
            enter3=
        }
        if enter4=ERROR
        {
            enter4=
        }
        if enter5=ERROR
        {
            enter5=
        }
        if enter6=ERROR
        {
            enter6=
        }
        if enter7=ERROR
        {
            enter7=
        }
        if enter8=ERROR
        {
            enter8=
        }
        if enter9=ERROR
        {
            enter9=
        }
        if enter10=ERROR
        {
            enter10=
        }
        if enter11=ERROR
        {
            enter11=
        }
        if enter12=ERROR
        {
            enter12=
        }
        if editmsgsleep1=ERROR
        {
            editmsgsleep1=
        }
        if editmsgsleep2=ERROR
        {
            editmsgsleep2=
        }
        if editmsgsleep3=ERROR
        {
            editmsgsleep3=
        }
        if editmsg1=ERROR
        {
            editmsg1=
        }
        if editmsg2=ERROR
        {
            editmsg2=
        }
        if editmsg3=ERROR
        {
            editmsg3=
        }
        if editmsg4=ERROR
        {
            editmsg4=
        }
        if editmsg5=ERROR
        {
            editmsg5=
        }
        if hotkeymsg1=ERROR
        {
            hotkeymsg1=
        }
        if hotkeymsg2=ERROR
        {
            hotkeymsg2=
        }
        if youroff1=ERROR
        {
            youroff1=
        }
        if youroff2=ERROR
        {
            youroff2=
        }
        if yourcmd1=ERROR
        {
            yourcmd1=
        }
        if yourcmd2=ERROR
        {
            yourcmd2=
        }
        if punishgo=ERROR
        {
            punishgo=
        }
        if recon !=
        {
            Hotkey, ~%recon%, Button1
        }
        if norecon !=
        {
            Hotkey, ~%norecon%, Button2
        }
        if yesrecon !=
        {
            Hotkey, ~%yesrecon%, Button3
        }
        if leader !=
        {
            Hotkey, ~%leader%, Button4
        }
        if armor !=
        {
            Hotkey, ~%armor%, Button5
        }
        if buyadm !=
        {
            Hotkey, ~%buyadm%, button6
        }
        if rifa !=
        {
            Hotkey, ~%rifa%, button7
        }
        if vip !=
        {
            Hotkey, ~%vip%, button8
        }
        if gwdm !=
        {
            Hotkey, ~%gwdm%, button9
        }
        if duel !=
        {
            Hotkey, ~%duel%, button10
        }
        if lc !=
        {
            Hotkey, ~%lc%, button11
        }
        if gg !=
        {
            Hotkey, ~%gg%, button12
        }
        if acc !=
        {
            Hotkey, ~%acc%, button13
        }
        if flood !=
        {
            Hotkey, ~%flood%, button14
        }
        if caps !=
        {
            Hotkey, ~%caps%, button15
        }
        if pr !=
        {
            Hotkey, ~%pr%, button16
        }
        if buy !=
        {
            Hotkey, ~%buy%, button17
        }
        if offtoprep !=
        {
            Hotkey, ~%offtoprep%, button18
        }
        if mat !=
        {
            Hotkey, ~%mat%, button19
        }
        if osk !=
        {
            Hotkey, ~%osk%, button20
        }
        if muterod !=
        {
            Hotkey, ~%muterod%, button21
        }
        if offtopo !=
        {
            Hotkey, ~%offtopo%, button22
        }
        if neadekvat !=
        {
            Hotkey, ~%neadekvat%, button23
        }
        if oskadm !=
        {
            Hotkey, ~%oskadm%, button24
        }
        if neyvaj !=
        {
            Hotkey, ~%neyvaj%, button25
        }
        if kleveta !=
        {
            Hotkey, ~%kleveta%, button26
        }
        if natsia !=
        {
            Hotkey, ~%natsia%, button27
        }
        if movieadm !=
        {
            Hotkey, ~%movieadm%, button28
        }
        if trolladm !=
        {
            Hotkey, ~%trolladm%, button29
        }
        if db !=
        {
            Hotkey, ~%db%, button30
        }
        if tk !=
        {
            Hotkey, ~%tk%, button31
        }
        if spawn !=
        {
            Hotkey, ~%spawn%, button32
        }
        if nickosk !=
        {
            Hotkey, ~%nickosk%, button33
        }
        if capturekick !=
        {
            Hotkey, ~%capturekick%, button34
        }
        if cheatkick !=
        {
            Hotkey, ~%cheatkick%, button35
        }
        if cheatkpz !=
        {
            Hotkey, ~%cheatkpz%, button36
        }
        if bagouse !=
        {
            Hotkey, ~%bagouse%, button37
        }
        if osknick !=
        {
            Hotkey, ~%osknick%, button38
        }
        if capturekpz !=
        {
            Hotkey, ~%capturekpz%, button39
        }
        if falseadm !=
        {
            Hotkey, ~%falseadm%, button40
        }
        if neadkvatv !=
        {
            Hotkey, ~%neadkvatv%, button41
        }
        if prban !=
        {
            Hotkey, ~%prban%, button42
        }
        if oskadmban !=
        {
            Hotkey, ~%oskadmban%, button43
        }
        if oskrodban !=
        {
            Hotkey, ~%oskrodban%, button44
        }
        if oskproject !=
        {
            Hotkey, ~%oskproject%, button45
        }
        if cheatban !=
        {
            Hotkey, ~%cheatban%, button46
        }
        if checheatban !=
        {
            Hotkey, ~%checheatban%, button49
        }
        if bduty !=
        {
            Hotkey, ~%bduty%, button47
        }
        if forum !=
        {
            Hotkey, ~%forum%, button48
        }
        if offre !=
        {
            Hotkey, ~%offre%, offreconbut
        }
        if banre !=
        {
            Hotkey, ~%banre%, butbanre
        }
        if WH !=
        {
            Hotkey, ~%WH%, WallHackBut
        }
        if WD !=
        {
            Hotkey, ~%WD%, WaterDriveBut
        }
        if KPZre !=
        {
            Hotkey, ~%KPZre%, butkpzre
        }
        if Antishre !=
        {
            Hotkey, ~%Antishre%, antishrebut
        }
        if hotkey1 !=
        {
            Hotkey, ~%hotkey1%, binder1
        }
        if hotkey2 !=
        {
            Hotkey, ~%hotkey2%, binder2
        }
        if hotkey3 !=
        {
            Hotkey, ~%hotkey3%, binder3
        }
        if hotkey4 !=
        {
            Hotkey, ~%hotkey4%, binder4
        }
        if hotkey5 !=
        {
            Hotkey, ~%hotkey5%, binder5
        }
        if hotkey6 !=
        {
            Hotkey, ~%hotkey6%, binder6
        }
        if hotkey7 !=
        {
            Hotkey, ~%hotkey7%, binder7
        }
        if hotkey8 !=
        {
            Hotkey, ~%hotkey8%, binder8
        }
        if hotkey9 !=
        {
            Hotkey, ~%hotkey9%, binder9
        }
        if hotkey10 !=
        {
            Hotkey, ~%hotkey10%, binder10
        }
        if hotkey11 !=
        {
            Hotkey, ~%hotkey11%, binder11
        }
        if hotkey12 !=
        {
            Hotkey, ~%hotkey12%, binder12
        }
        if hotkeymsg1 !=
        {
            Hotkey, ~%hotkeymsg1%, bindermsg1
        }
        if hotkeymsg2 !=
        {
            Hotkey, ~%hotkeymsg2%, bindermsg2
        }
        if punishgo !=
        {
            Hotkey, ~%punishgo%, PunishButton
        }
    }
    return
}
Button1:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  Работаю по вашей жалобе{LEFT 24}
    return
}
Button2:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Нарушений не обнаружено{LEFT 24}
    return
}
Button3:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Данный игрок наказан{LEFT 21}
    return
}
Button4:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Вы должны набрать больше киллов, чем у текущего лидера{LEFT 55}
    return
}
Button5:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Он выпадает с убитых на Gang War{LEFT 33}
    return
}
Button6:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Админ-права покупаются на monser.ru/buy{LEFT 40}
    return
}
Button7:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Rifa - банда в San-Fierro{LEFT 26}
    return
}
Button8:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  /mm > 10 > 1 > 1{LEFT 17}
    return
}
Button9:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  /gw | /dm{LEFT 10}
    return
}
Button10:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Договоритесь о одной из локации на /dm{LEFT 39}
    return
}
Button11:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Создается только с VIP, командой - /lc{LEFT 40}
    return
}
Button12:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Приятной игры на Monser Gang War <3{LEFT 36}
    return
}
Button13:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  Вы должны взять 88 территорий как лидер банды.{LEFT 47}
    return
}
Button14:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  15 Flood{LEFT 9}
    return
}
Button15:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  15 Caps Lock{LEFT 13}
    return
}
Button16:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  120 Реклама{LEFT 12}
    return
}
Button17:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  50 Торговля{LEFT 12}
    return
}
Button18:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  10 Offtop в /report{LEFT 20}
    return
}
Button19:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  20 Мат в /report{LEFT 17}
    return
}
Button20:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  30 Оскорбление игроков{LEFT 23}
    return
}
Button21:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  180 Упоминание/Оскорбление родных{LEFT 34}
    return
}
Button22:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  50 Offtop в /o{LEFT 15}
    return
}
Button23:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/mute  35 Неадекватное поведение{LEFT 26}
    return
}
Button24:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  180 Оскорбление администрации{LEFT 30}
    return
}
Button25:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  120 Неуважение к администрации{LEFT 31}
    return
}
Button26:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  60 Клевета{LEFT 11}
    return
}
Button27:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  120 Разжигание межнац. розни{LEFT 29}
    return
}
Button28:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  150 Обсуждение действий администрации{LEFT 38}
    return
}
Button29:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  120 Троллинг администрации{LEFT 27}
    return
}
Button30:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  DriveBy{LEFT 8}
    return

}
Button31:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  TeamKill{LEFT 9}
    return
}
Button32:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  Помеха проходу/спавну{LEFT 22}
    return
}
Button33:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/skick  Оскорбление в нике{LEFT 19}
    return
}
Button34:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  Неправильный /capture{LEFT 22}
    return
}
Button35:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  Cheat{LEFT 6}
    return
}
Button36:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/jail  60 Cheat{LEFT 9}
    return
}
Button37:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/jail  20 Багоюз{LEFT 10}
    return
}
Button38:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  30 Оскорбление в нике{LEFT 22}
    return
}
Button39:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/jail  10 Неправильный /capture{LEFT 25}
    return
}
Button40:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  10 Обман администрации{LEFT 23}
    return
}
Button41:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  2 Неадекватное поведение в /v{LEFT 30}
    return
}
Button42:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/cban  30 Реклама{LEFT 11}
    return
}
Button43:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  30 Оскорбление администрации{LEFT 29}
    return
}
Button44:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  30 Оскорбление родных{LEFT 22}
    return
}
Button45:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/cban  90 Оскорбление проекта{LEFT 23}
    return
}
Button46:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  30 Cheat{LEFT 9}
    return
}
Button47:
{
    Sendchat("/Duty " Duty)
    return
}
Button48:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  Жалобу на администратора можно написать на forum.monser.ru{LEFT 59}
    return
}
Button49:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/cban  30 Cheat{LEFT 9}
    return
}

PunishButton:
{
    FileRead, lastfilegive, %A_Temp%\Punishment.txt
    FileDelete, %A_Temp%\Punishment.txt
    lastfilegive := Trim(lastfilegive, "`r`n")
    Str := StrSplit(lastfilegive, "`n", "`r")
    if Strlen(lastfilegive)>0
    {
        Loop % Str.MaxIndex()
        {
            if A_Index>1
        {
            Sleep, 500
        }
        RegExMatch(Str[A_Index], "^\/(.*) (\d+)( \d+)? (.*) (.*)", reasonmm)
        cmd := RegExReplace(Str[A_Index], "^(\/\w+ \d+ ?\d* [^ ]+).*", "$1")
        Sendchat(cmd)
        Sleep, 100
        Sendinput, %reasonmm5%{enter}
    }
    Sleep 500
    AddchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Выдача наказаний окончена!")
    return
}
else
{
    AddchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Файл с наказаниями пустой!")
    return
}
}

offreconbut:
{
    Sendchat("/reoff")
    return
}
return

WallHackBut:
{
    if whbuton != 1
    {
    whbuton := 1
    WallHack(tog := -1)
    PrintLow("~g~WallHack On", 2000)
    }
    else
    {
        whbuton := 0
        WallHack(tog := 0)
        PrintLow("~r~WallHack Off", 2000)
    }
}
return

WaterDriveBut:
{
    If wdbuton != 1
    {
        wdbuton := 1
        WaterDrive(1)
        PrintLow("~g~WaterDrive On", 2000)
    }
    Else
    {
        wdbuton := 0
        WaterDrive(0)
        PrintLow("~r~WaterDrive Off", 2000)
    }
}
return

antishrebut:
{
    Sendchat("/re " ipl)
    return
}
return

Binder1:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter1 = 1
    {
        SendChat(edit1)
        return
    }
    else
    {
    SendInput {F6}%edit1%
        return
    }
    return
}
Binder2:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter2 = 1
    {
        SendChat(edit2)
        return
    }
    else
    {
    SendInput {F6}%edit2%
        return
    }
    return
}
Binder3:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter3 = 1
    {
        SendChat(edit3)
        return
    }
    else
    {
    SendInput {F6}%edit3%
        return
    }
    return
}
Binder4:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter4 = 1
    {
        SendChat(edit4)
        return
    }
    else
    {
    SendInput {F6}%edit4%
        return
    }
    return
}
Binder5:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter5 = 1
    {
        SendChat(edit5)
        return
    }
    else
    {
    SendInput {F6}%edit5%
        return
    }
    return
}
Binder6:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter6 = 1
    {
        SendChat(edit6)
        return
    }
    else
    {
    SendInput {F6}%edit6%
        return
    }
    return
}
Binder7:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter7 = 1
    {
        SendChat(edit7)
        return
    }
    else
    {
    SendInput {F6}%edit7%
        return
    }
    return
}
Binder8:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter8 = 1
    {
        SendChat(edit8)
        return
    }
    else
    {
    SendInput {F6}%edit8%
        return
    }
    return
}
Binder9:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter9 = 1
    {
        SendChat(edit9)
        return
    }
    else
    {
    SendInput {F6}%edit9%
        return
    }
    return
}
Binder10:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter10 = 1
    {
        SendChat(edit10)
        return
    }
    else
    {
    SendInput {F6}%edit10%
        return
    }
    return
}
Binder11:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter11 = 1
    {
        SendChat(edit11)
        return
    }
    else
    {
    SendInput {F6}%edit11%
        return
    }
    return
}
Binder12:
{
    if (isInChat() = 1)
    {
        return
    }
    if Enter12 = 1
    {
        SendChat(edit12)
        return
    }
    else
    {
    SendInput {F6}%edit12%
        return
    }
    return
}

Bindermsg1:
{
    if (isInChat() = 1)
    {
        return
    }
    else
    {
        Sendchat("/msg " editmsg1)
        Sleep, editmsgsleep1
        Sendchat("/msg " editmsg2)
        return
    }
}
Bindermsg2:
{
    if (isInChat() = 1)
    {
        return
    }
    else
    {
        Sendchat("/msg " editmsg3)
        Sleep, editmsgsleep2
        Sendchat("/msg " editmsg4)
        Sleep, editmsgsleep3
        Sendchat("/msg " editmsg5)
        return
    }
}
SaveButton:
{
    Gui, Submit, NoHide
    IniWrite, %recon%, %DIRSET%, Options, recon
    IniWrite, %norecon%, %DIRSET%, Options, norecon
    IniWrite, %yesrecon%, %DIRSET%, Options, yesrecon
    IniWrite, %leader%, %DIRSET%, Options, leader
    IniWrite, %armor%, %DIRSET%, Options, armor
    IniWrite, %buyadm%, %DIRSET%, Options, buyadm
    IniWrite, %rifa%, %DIRSET%, Options, rifa
    IniWrite, %vip%, %DIRSET%, Options, vip
    IniWrite, %gwdm%, %DIRSET%, Options, gwdm
    IniWrite, %duel%, %DIRSET%, Options, duel
    IniWrite, %lc%, %DIRSET%, Options, lc
    IniWrite, %gg%, %DIRSET%, Options, gg
    IniWrite, %forum%, %DIRSET%, Options, forum
    IniWrite, %acc%, %DIRSET%, Options, acc
    IniWrite, %flood%, %DIRSET%, Options, flood
    IniWrite, %caps%, %DIRSET%, Options, caps
    IniWrite, %pr%, %DIRSET%, Options, pr
    IniWrite, %buy%, %DIRSET%, Options, buy
    IniWrite, %offtoprep%, %DIRSET%, Options, offtoprep
    IniWrite, %mat%, %DIRSET%, Options, mat
    IniWrite, %osk%, %DIRSET%, Options, osk
    IniWrite, %muterod%, %DIRSET%, Options, muterod
    IniWrite, %offtopo%, %DIRSET%, Options, offtopo
    IniWrite, %neadekvat%, %DIRSET%, Options, neadekvat
    IniWrite, %oskadm%, %DIRSET%, Options, oskadm
    IniWrite, %neyvaj%, %DIRSET%, Options, neyvaj
    IniWrite, %kleveta%, %DIRSET%, Options, kleveta
    IniWrite, %natsia%, %DIRSET%, Options, natsia
    IniWrite, %movieadm%, %DIRSET%, Options, movieadm
    IniWrite, %trolladm%, %DIRSET%, Options, trolladm
    IniWrite, %db%, %DIRSET%, Options, db
    IniWrite, %tk%, %DIRSET%, Options, tk
    IniWrite, %spawn%, %DIRSET%, Options, spawn
    IniWrite, %nickosk%, %DIRSET%, Options, nickosk
    IniWrite, %capturekick%, %DIRSET%, Options, capturekick
    IniWrite, %cheatkick%, %DIRSET%, Options, cheatkick
    IniWrite, %cheatkpz%, %DIRSET%, Options, cheatkpz
    IniWrite, %bagouse%, %DIRSET%, Options, bagouse
    IniWrite, %capturekpz%, %DIRSET%, Options, capturekpz
    IniWrite, %osknick%, %DIRSET%, Options, osknick
    IniWrite, %falseadm%, %DIRSET%, Options, falseadm
    IniWrite, %neadkvatv%, %DIRSET%, Options, neadkvatv
    IniWrite, %prban%, %DIRSET%, Options, prban
    IniWrite, %oskadmban%, %DIRSET%, Options, oskadmban
    IniWrite, %oskrodban%, %DIRSET%, Options, oskrodban
    IniWrite, %oskproject%, %DIRSET%, Options, oskproject
    IniWrite, %cheatban%, %DIRSET%, Options, cheatban
    IniWrite, %checheatban%, %DIRSET%, Options, checheatban
    IniWrite, %Duty%, %DIRSET%, Options, Duty
    IniWrite, %bduty%, %DIRSET%, Options, bduty
    IniWrite, %aduty%, %DIRSET%, Options, aduty
    IniWrite, %conoff%, %DIRSET%, Options, conoff
    IniWrite, %fon%, %DIRSET%, Options, fon
    IniWrite, %timemute%, %DIRSET%, Options, timemute
    IniWrite, %infore%, %DIRSET%, Options, infore
    IniWrite, %offre%, %DIRSET%, Options, offre
    IniWrite, %banre%, %DIRSET%, Options, banre
    IniWrite, %WH%, %DIRSET%, Options, WH
    IniWrite, %WD%, %DIRSET%, Options, WD
    IniWrite, %KPZre%, %DIRSET%, Options, KPZre
    IniWrite, %cvre%, %DIRSET%, Options, cvre
    IniWrite, %ccban%, %DIRSET%, Options, ccban
    IniWrite, %reoffre%, %DIRSET%, Options, reoffre
    IniWrite, %AnticheatSH%, %DIRSET%, Options, AnticheatSH
    IniWrite, %antishre%, %DIRSET%, Options, antishre
    IniWrite, %hotkey1%, %DIRSET%, Binder, hotkey1
    IniWrite, %hotkey2%, %DIRSET%, Binder, hotkey2
    IniWrite, %hotkey3%, %DIRSET%, Binder, hotkey3
    IniWrite, %hotkey4%, %DIRSET%, Binder, hotkey4
    IniWrite, %hotkey5%, %DIRSET%, Binder, hotkey5
    IniWrite, %hotkey6%, %DIRSET%, Binder, hotkey6
    IniWrite, %hotkey7%, %DIRSET%, Binder, hotkey7
    IniWrite, %hotkey8%, %DIRSET%, Binder, hotkey8
    IniWrite, %hotkey9%, %DIRSET%, Binder, hotkey9
    IniWrite, %hotkey10%, %DIRSET%, Binder, hotkey10
    IniWrite, %hotkey11%, %DIRSET%, Binder, hotkey11
    IniWrite, %hotkey12%, %DIRSET%, Binder, hotkey12
    IniWrite, %edit1%, %DIRSET%, Binder, edit1
    IniWrite, %edit2%, %DIRSET%, Binder, edit2
    IniWrite, %edit3%, %DIRSET%, Binder, edit3
    IniWrite, %edit4%, %DIRSET%, Binder, edit4
    IniWrite, %edit5%, %DIRSET%, Binder, edit5
    IniWrite, %edit6%, %DIRSET%, Binder, edit6
    IniWrite, %edit7%, %DIRSET%, Binder, edit7
    IniWrite, %edit8%, %DIRSET%, Binder, edit8
    IniWrite, %edit9%, %DIRSET%, Binder, edit9
    IniWrite, %edit10%, %DIRSET%, Binder, edit10
    IniWrite, %edit11%, %DIRSET%, Binder, edit11
    IniWrite, %edit12%, %DIRSET%, Binder, edit12
    IniWrite, %enter1%, %DIRSET%, Binder, enter1
    IniWrite, %enter2%, %DIRSET%, Binder, enter2
    IniWrite, %enter3%, %DIRSET%, Binder, enter3
    IniWrite, %enter4%, %DIRSET%, Binder, enter4
    IniWrite, %enter5%, %DIRSET%, Binder, enter5
    IniWrite, %enter6%, %DIRSET%, Binder, enter6
    IniWrite, %enter7%, %DIRSET%, Binder, enter7
    IniWrite, %enter8%, %DIRSET%, Binder, enter8
    IniWrite, %enter9%, %DIRSET%, Binder, enter9
    IniWrite, %enter10%, %DIRSET%, Binder, enter10
    IniWrite, %enter11%, %DIRSET%, Binder, enter11
    IniWrite, %enter12%, %DIRSET%, Binder, enter12
    IniWrite, %editmsgsleep1%, %DIRSET%, BinderMSG, editmsgsleep1
    IniWrite, %editmsgsleep2%, %DIRSET%, BinderMSG, editmsgsleep2
    IniWrite, %editmsgsleep3%, %DIRSET%, BinderMSG, editmsgsleep3
    IniWrite, %editmsg1%, %DIRSET%, BinderMSG, editmsg1
    IniWrite, %editmsg2%, %DIRSET%, BinderMSG, editmsg2
    IniWrite, %editmsg3%, %DIRSET%, BinderMSG, editmsg3
    IniWrite, %editmsg4%, %DIRSET%, BinderMSG, editmsg4
    IniWrite, %editmsg5%, %DIRSET%, BinderMSG, editmsg5
    IniWrite, %hotkeymsg1%, %DIRSET%, BinderMSG, hotkeymsg1
    IniWrite, %hotkeymsg2%, %DIRSET%, BinderMSG, hotkeymsg2
    IniWrite, %youroff1%, %DIRSET%, Polez, youroff1
    IniWrite, %youroff2%, %DIRSET%, Polez, youroff2
    IniWrite, %yourcmd1%, %DIRSET%, Polez, yourcmd1
    IniWrite, %yourcmd2%, %DIRSET%, Polez, yourcmd2
    IniWrite, %punishgo%, %DIRSET%, Punishment, punishgo
    Gosub, ReadSettings
    MsgBox, 64, AutoHotKey MGW, Сохранено!
    return
}

$~Enter::
sleep, 30
if (isInChat() = 0)
return
gosub, checkdialogmenu
sleep 150
dwAddress := dwSAMP + 0x12D8F8
chatInput := readString(hGTA, dwAddress, 512)
writeString(hGTA, dwAddress, "")
if (chatInput="/ah") || if (chatInput="/ah ")
{
showDialog("0","{FFD700}Список команд", "{FFD700}/ah {FFFFFF}- Показать список команд`n{FFD700}/tabl {FFFFFF}- Таблица наказазаний`n{FFD700}/cc {FFFFFF}- Копировать ник по ID`n{FFD700}/mp {FFFFFF}- Меню мероприятий`n{FFD700}/gomp {FFFFFF}- Создать МП`n{FFD700}/mpoff{FFFFFF} - Принудительно остановить авто-телепорт на МП`n{FFD700}/gg {FFFFFF}- Пожелать приятной игры`n{FFD700}/amsg {FFFFFF}- Меню отправки /msg`n{FFD700}/itp {FFFFFF}- Меню телепорта`n{FFD700}/tpall {FFFFFF}- Телепортировать всех игроков в зоне прорисовки`n{FFD700}/askin {FFFFFF}- Выдать всем игрокам в зоне прорисовки заданный скин`n{FFD700}/raskin {FFFFFF}- Выдать всем игрокам в зоне прорисовки рандомный скин`n{32CD32}/tempcmd {FFFFFF}- Посмотреть команды для работы с Temp List'ом`n{32CD32}/dlist {FFFFFF}- Посмотреть команды ""быстрой"" выдачи наказаний`n{32CD32}/alist {FFFFFF}- Посмотреть команды выдачи наказаний`n{32CD32}/request {FFFFFF}- Команды для ""быстрых"" просьб в /a чат`n{32CD32}/byinfo {FFFFFF}- Теги для /by`n{32CD32}/bug {FFFFFF}- Решение распространённых багов скрипта`n{FFD700}/clear {FFFFFF}- Очистить чат`n{FFD700}/cv {FFFFFF} - Изменить цвет ника игроку`n{FFD700}/wh {FFFFFF}- Включить WallHack`n{FFD700}/acmd {FFFFFF}- Посмотреть /ahelp по уровням в диалоговом окне`n{FFD700}/wd {FFFFFF}- Включить езду по воде`n{FFD700}/by {FFFFFF}- Выдать наказание по просьбе администратора`n{FFD700}/rsp {FFFFFF}- Следить за рандомным ID`n{FFD700}/sh{FFFFFF} - Включить/Выключить античит на SpeedHack`n{FFD700}/skin {FFFFFF}- Узнать ID скина по ID игрока`n{FFD700}/last {FFFFFF}- Узнать ID и ник последнего рекона`n{FFD700}/thx {FFFFFF}- Благодарность для тебя`n{FF0000}/reloadahk {FFFFFF}- Перезапустить скрипт", "Закрыть")
    return
    }

if (chatinput="/request") || if (chatinput="/request ")
{
    showDialog(0, "{FFD700}Команды быстрых просьб в /a", "{FFD700}/cheat {FFFFFF}- Просьба в /a о бане игрока за читы`n{FFD700}/capt {FFFFFF}- Просьба в /a чат о неправильном /capture`n{FFD700}/kpz {FFFFFF}- Просьба в /a чат о джайле за читы`n{FFD700}/onick {FFFFFF}- Просьба в /a чат о бане за ник", "Закрыть")
    return
}

if (chatinput="/alist") || if (chatinput="/alist ")
{
showDialog("0","{FFD700}Команды выдачи наказаний", "{FFD700}/aban {FFFFFF}- Выдать бан`n{FFD700}/ajail {FFFFFF}- Выдать КПЗ`n{FFD700}/akick {FFFFFF}- Выдать кик`n{FFD700}/amute {FFFFFF}- Выдать мут", "Закрыть")
    return
}

if (chatInput="/tempcmd") || if (chatInput="/tempcmd ")
{
    showdialog("0", "{FFD700}Команды Temp List'a", "{FFD700}/temp {FFFFFF}- Посмотреть Temp List`n{FFD700}/addtemp {FFFFFF}- Добавить человека в Temp List`n{FFD700}/offtemp {FFFFFF}- Добавить человека оффлайн в Temp List`n{FFD700}/deltemp {FFFFFF}- Очистить Temp List", "Закрыть")
    return
}

if (chatInput="/tabl") || if (chatInput="/tabl ")
{
   showDialog("0", "{FFD700}Таблица наказаний", "{32CD32}Выдача кика`n{FFFFFF}ДБ`nТК`nСК`nПомеха проходу/спавну`nОскорбление в нике`n{32CD32}Выдача мута`n{FFFFFF}Флуд - 5-20 минут`nКапс - 5-20 минут`nРозжиг -60-180 минут`nРеклама любого ресурса - 60-180 минут`nТорговля - 40-60 минут`nОффтоп в репорт - 10-20 минут`nОбман администрации - 30-60 минут`nКлевета - 40-60 минут`nОскорбление проекта - 180 минут`nОскорбление игроков - 10-30 минут`nТроллинг администрации - 60-120 минут`nНеуважение к администрации - 60-120 минут`nОскорбление администрации - 180 минут`nОбсуждение действий Администрации - 120-180 минут`nКлевета на администратора - 60-120 минут`nУпоминание родных - 180 минут`nНеадекватное поведение (Капс, Флуд, Оск) 30 - 40 минут`nОффтоп в /o (Передача, обмен, покупка, продажа аккаунтов) 40-60 минут`n{32CD32}Выдача КПЗ`n{FFFFFF}Читы - 40-60 минут`nБагоюз - 10-20 минут`nКапт куском - 5-10 минут`n{32CD32}Выдача блокировки аккаунта`n{FFFFFF}Оскорбление в нике - 20-30 дней (Командой {FF0000}/ban{FFFFFF})`nОбман администрации - 5-10 дней (Командой {FF0000}/ban{FFFFFF})`nНеадекватное поведение - 2-5 днeй (Только за флуд в /v) (Командой {FF0000}/ban{FFFFFF})`nРеклама любого ресурса - Бан на 90 дней (Командой {FF0000}/cban{FFFFFF})`nОскорбление администрации - 30 дней (Командой {FF0000}/ban{FFFFFF})`nОскорбление родных - 30 дней (Командой {FF0000}/ban{FFFFFF})`nОскорбление проекта - Бан на 90 дней (Командой {FF0000}/cban{FFFFFF})`nЧиты - Бан на 30 дней (C 3-го уровня командой {FF0000}/ban{FFFFFF},  с 4-го уровня командой {FF0000}/cban{FFFFFF})`n{32CD32}Выдача блокировки IP адреса`n{FFFFFF}Неоднократное оскорбление в нике - 10 дней`nНеоднократное оскорбление родных - 10 дней`nНеоднократное оскорбление администрации - 10 дней`nОскорбление проекта - 90 дней", "Закрыть")
   return
}
If (chatInput="/bug") || If (chatInput="/bug ")
{
    showDialog("0", "{FFD700}Баги скрипта", "{32CD32}Баг с Информацией о игроке при слежке, бане или /cv в /re`n{FFFFFF}- Пропишите {FFD700}/re рандомный ID{FFFFFF}, далее введите команду {FFD700}/reloadahk{FFFFFF},`nпосле перезапуска скрипта баг будет пофикшен!`n{32CD32}Баг с /rsp (Всегда следит за 0 ID)`n{FFFFFF}- Для решения данного бага нужно, чтобы скрипт собрал информацию о онлайне сервера,`n для этого просто нажмите {FFD700}TAB{FFFFFF}, баг пофикшен!`n{32CD32}Баг с /skin (Всегда пишет ""-1"")`n{FFFFFF}- Для решения данного бана нужно прописать {FFD700}/re{FFFFFF} за нужным ID и уже тогда прописать {FFD700}/skin{FFFFFF}", "Закрыть")
    return
}

if (chatInput="/thx") || if (chatInput="/thx ")
{
    Pickname1 := RegExReplace(getusername(), "(.*)_")
    Pickname2 := RegExReplace(getusername(), "_(.*)")
    showDialog("0", "{FFD700}Thank You :3", "{FFD700} " Pickname2 " " Pickname1 "{FFFFFF}, хочу сказать тебе отдельное и большое спасибо...`n...за то, что ты пользуешься именно моим скриптом...`n...ты даёшь мне мотивацию разрабатывать его дальше и стремиться к лучшему <3", "Закрыть")
    return
}


if (chatInput="/tpc") || if (chatInput="/tpc ")
{
    SendChat("/aint")
    Sleep 10
    SendChat("/tp 1")
    Sleep 10
    SendChat("/tpc")
    Return
}

if (chatinput="/reloadahk") || if (chatinput="/reloadahk ")
{
    AddChatMessageEx("FFFFFF", "{FF0000}[A] {FFFFFF}Сейчас произойдёт перезагрузка АХК, не трогайте клавиатуру..")
    sleep 1000
    AddChatMessageEx("FFFFFF", "{FF0000}1..")d
    sleep 1000
    AddChatMessageEx("FFFFFF", "{FF0000}2..")
    sleep 1000
    AddChatMessageEx("FFFFFF", "{FF0000}3..")
    sleep 500
    Reload
}

If (chatinput="/rsp") || If (chatinput="/rsp ")
{
    if tab != 1
    {
        addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Нажмите {FFD700}TAB{FFFFFF} чтобы скрипт собрал информацию о онлайне")
        return
    }
    Random, randomrecon, 0, CountOnlinePlayers()
    {
        Sendchat("/re " randomrecon)
        return
    }
}

if (chatinput="/last") || (chatinput="/last ")
{
    lastnr := RegExReplace(getPlayerNameById(lastidrec), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Последний recon - ID:{FFD700} " lastidrec "{FFFFFF} | Nickname: {FFD700}" lastnr)
    return
}

if (chatinput="/wh") || if (chatinput="/wh ")
{
    if whbuton != 1
    {
    whbuton := 1
    WallHack(tog := -1)
    PrintLow("~g~WallHack On", 2000)
    }
    else
    {
        whbuton := 0
        WallHack(tog := 0)
        PrintLow("~r~WallHack Off", 2000)
    }
}

if (chatinput="/wd") || if (chatinput="/wd ")
{
    if wdbuton != 1
    {
        wdbuton := 1
        WaterDrive(1)
        PrintLow("~g~WaterDrive On", 2000)
    }
    else
    {
        wdbuton := 0
        WaterDrive(0)
        PrintLow("~r~WaterDrive Off", 2000)
    }
}

if (chatinput="/dlist") || if (chatinput="/dlist ")
{
showDialog("0","{FFD700}Команды быстрой выдачи наказаний", "{FFD700}/ma {FFFFFF}- Выдать мут за упоминание/оскорбление родных`n{FFD700}/offrep {FFFFFF}- Выдать мут за offtop в /report`n{FFD700}/flood {FFFFFF}- Выдать мут за флуд`n{FFD700}/caps {FFFFFF}- выдать мут за CapsLock`n{FFD700}/pr {FFFFFF}- Выдать мут за рекламу`n{FFD700}/osk {FFFFFF}- Выдать мут за оскорбление игроков`n{FFD700}/offo {FFFFFF}- Выдать мут за offtop в /o`n{FFD700}/cenz {FFFFFF}- Выдать мут за мат в /report`n{FFD700}/troll {FFFFFF}- Выдать мут за троллинг администрации`n{FFD700}/admosk{FFFFFF} - Выдать мут за оскорбление администрации`n{FFD700}/indq {FFFFFF}- Выдать мут за неадекватное поведение`n{FFD700}/movadm {FFFFFF}- Выдать мут за обсуждение действий администрации`n{FFD700}/noise {FFFFFF}- Выдать кик за помеху", "Закрыть")
    return
}

if chatInput contains /mute
{
    RegExMatch(chatInput, "/mute (.*) (.*) (.*)", mute)
    if (timemute=1)
    {
    if mute =
    {
        return
    }
    else
    {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
    }
}
return
}

if chatInput contains /cv
{
    RegExMatch(chatinput, "/cv ([0-9]+)", cv)
    if cv1 =
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /cv [ID игрока]")
        return
    }
    else
    {
        setPlayerColor(cv1, 0xFF33AA4)
        return
    }
    if(cv1 < 0)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Неверно указан ID игрока")
        return
    }
    return
}

if (chatinput="/skin") || if (chatinput="/skin ")
{
    addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /skin [ID игрока]")
    return
}

if (chatinput="/byinfo") || if (chatinput="/byinfo ")
{
    showdialog("0", "{FFD700}Теги для /by", "{FFD700}Cheat {FFFFFF}- Бан за читы`n{FFD700}Rod {FFFFFF}- Бан за оск. родных`n{FFD700}PR {FFFFFF}- Бан за рекламу`n{FFD700}Adm {FFFFFF}- Бан за оск. администрации`n{FFD700}Nick {FFFFFF}- Бан за никнейм", "Закрыть")
    return
}


If (Chatinput="/by") || If (Chatinput="/by ")
{
    addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /by [ID игрока] [Тег] [Фамилия/Имя администратора]")
    return
}
if chatinput contains /by
{
    if (RegExMatch(Chatinput, "/by (.*) (.*) (.*)", bby))
    {
        if bby2 = cheat
        {
            sendchat("/cban " bby1 " 30 Cheat • " bby3)
            return
        }
        if bby2 = rod
        {
            sendchat("/ban " bby1 " 30 Оскорбление родных • " bby3)
            return
        }
        if bby2 = pr
        {
            sendchat("/cban " bby1 " 30 Реклама • " bby3)
            return
        }
        if bby2= adm
        {
            sendchat("/ban " bby1 " 30 Оскорбление администрации • " bby3)
            return
        }
        if bby2= nick
        {
            sendchat("/ban " bby1 " 30 Nickname • " bby3)
            return
        }
        else
        {
            addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /by [ID игрока] [Тег] [Инициалы администратора]")
            return
        }
    }
    return
}

if (chatinput="/dellpunish") || if (chatinput="/dellpunish ")
{
    FileDelete, %A_Temp%\Punishment.txt
    AddChatMessageEx("FFFFFF","{FFD700}[A]{FFFFFF} Cписок успешно очищен.")
}

if (chatinput="/temp") || if (chatinput="/temp ")
{
listrtextfordialog("%A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм","{FFD700}Temp List","0")
}
    if (chatInput="/offtemp") || if (chatInput="/offtemp ")
{
    AddChatMessageEx("FFFFFF","{FFD700}[A]{FFFFFF} Используйте: {FFD700}/offtemp [Ник игрока] [Комментарий]")
}
    if (chatInput="/addtemp") || if (chatInput="/addtemp ")
{
    AddChatMessageEx("FFFFFF","{FFD700}[A]{FFFFFF} Используйте:{FFD700} /addtemp [ID игрока] [Комментарий]")
}
if chatInput contains /offtemp
{
    if RegExMatch(chatInput, "/offtemp (.*) (.*)", offan)
    {
        FileAppend, %A_DD%.%A_MM%.%A_Year% | %offan1%.  Комментарий: , %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
        FileAppend, % offan2 "`n", %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
    AddChatMessageEx("FFFFFF","{FFD700}[A]{FFFFFF} Игрок {FFD700}" offan1 " {FFFFFF}успешно добавлен в список. Комментарий:{FFD700} " offan2)
    }
}
if chatInput contains /addtemp
{
    if RegExMatch(chatInput, "/addtemp (.*) (.*)", ant)
    {
        name := RegExReplace(getPlayerNameById(ant1), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
        FileAppend, %A_DD%.%A_MM%.%A_Year% | %name%.  Комментарий: , %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
        FileAppend, % ant2 "`n", %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
    AddChatMessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Игрок {FFD700}" name " {FFFFFF}успешно добавлен в список. Комментарий:{FFD700} " ant2)
    }
}
if (chatInput="/deltemp") || if (chatInput="/deltemp ")
{
    FileDelete, %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
    AddChatMessageEx("FFFFFF","{FFD700}[A]{FFFFFF} Cписок успешно очищен.")
}
    listrtextfordialog(files,pages,dialogstyle) {
    listrtext := []
    Loop, Read, %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
    {
        listrtext.Insert(A_LoopReadLine)
        textout .= listrtext[A_Index] "`n"
    }
    Sleep 400
    showDialog(dialogstyle,pages, textout , "Enter")
    phelptext := ""
    return
}
    firstlinetofiles(files) {
    openfiles := []
    Loop, Read, %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Выдача наказаний по просьбе мл.адм.txt
    {
        openfiles.Insert(A_LoopReadLine)
    }
    firstline := openfiles[1]
    return firstline
}


if chatinput contains /skin
{
    if (RegExMatch(Chatinput, "/skin (.*)", skinpl))
    {
        if (skinpl1<0) || if (skinpl1>299)
        {
            addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /skin [ID игрока]")
            return
        }
        else
        {
            addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}ID скина:{FFD700} " getTargetPlayerSkinIdById(skinpl1) )
            return
        }
        return
    }
}


if chatInput contains /acmd
{
    if (RegExMatch(chatInput, "/acmd (.*)", ahelp))
    {
    if (ahelp1=1)
        showDialog("0","{FFD700}Команды 1-го уровня", "{FFD700}/a {FFFFFF}- админ-чат`n{FFD700}/pm {FFFFFF}- ответ игроку`n{FFD700}/re {FFFFFF}- начать наблюдение`n{FFD700}/reoff {FFFFFF}- закончить наблюдение`n{FFD700}/mute {FFFFFF}- выдать затычку`n{FFD700}/unmute {FFFFFF}- снять затычку`n{FFD700}/kick {FFFFFF}- кикнуть игрока`n{FFD700}/slap {FFFFFF}- дать пинок`n{FFD700}/ta {FFFFFF}- информация о выстрелах`n{FFD700}/admins {FFFFFF}- список администрации онлайн`n{FFD700}/ia {FFFFFF}- информация администратора`n{FFD700}/aint {FFFFFF}- телепортироваться в админ-интерьер`n{FFD700}/duty {FFFFFF}- заступить на дежурство`n{FFD700}/flycam {FFFFFF}- свободный полёт`n{FFD700}/conon {FFFFFF}- включить информацию о подключениях`n{FFD700}/conoff {FFFFFF}- выключить информацию о подключениях", "Закрыть")
    }
    if (ahelp1=2)
    {
        showDialog("0","{FFD700}Команды 2-го уровня", "{FFD700}/msg {FFFFFF}- общий чат`n{FFD700}/jail {FFFFFF}- посадить в КПЗ`n{FFD700}/unjail {FFFFFF}- высвободить из КПЗ`n{FFD700}/skick {FFFFFF}- тихо кикнуть`n{FFD700}/tpkn {FFFFFF}- телепортироваться к игроку`n{FFD700}/rr {FFFFFF}- рестарт чата`n{FFD700}/tp {FFFFFF}- телепортироваться к спавну банды`n{FFD700}/ok {FFFFFF}- подтвердить смену ника`n{FFD700}/sc {FFFFFF}- зареспавнить все машины`n{FFD700}/scapt {FFFFFF}- остановить захват территорий`n{FFD700}/amembers {FFFFFF}- посмотреть онлайн банды`n{FFD700}/af {FFFFFF}- написать в чат банды`n{FFD700}/fon {FFFFFF}- включить прослушку чата банд`n{FFD700}/foff {FFFFFF}- выключить прослушку чата банд", "Закрыть")
    }
    if (ahelp1=3)
    {
        showDialog("0","{FFD700}Команды 3-го уровня", "{FFD700}/ban {FFFFFF}- забанить игрока`n{FFD700}/unban {FFFFFF}- разбанить игрока`n{FFD700}/offban {FFFFFF}- забанить игрока оффлайн`n{FFD700}/offjail {FFFFFF}- посадить в КПЗ оффлайн`n{FFD700}/offunjail {FFFFFF}- высвободить из КПЗ оффлайн`n{FFD700}/offmute {FFFFFF}- выдать затычку оффлайн`n{FFD700}/offunmute {FFFFFF}- снять затычку оффлайн`n{FFD700}/getstats {FFFFFF}- просмотреть статистику игрока`n{FFD700}/offgetstats {FFFFFF}- посмотреть оффлайн статистику игрока`n{FFD700}/infban {FFFFFF}- информация о бане`n{FFD700}/infmute {FFFFFF}- информация о муте`n{FFD700}/infjail {FFFFFF}- информация о КПЗ`n{FFD700}/tpks {FFFFFF}- телепортировать игрока к себе`n{FFD700}/lname {FFFFFF}- история ников игрока", "Закрыть")
    }
    if (ahelp1=4)
    {
        showDialog("0","{FFD700}Команды 4-го уровня", "{FFD700}/sban {FFFFFF}- тихий бан`n{FFD700}/banip {FFFFFF}- бан IP-адреса`n{FFD700}/unbanip {FFFFFF}- разбан IP-адреса`n{FFD700}/cban {FFFFFF}- бан IP-адреса и аккаунта`n{FFD700}/offcban {FFFFFF}- бан IP-адреса и аккаунта оффлайн`n{FFD700}/infip {FFFFFF}- информация о бане IP-адреса`n{FFD700}/open {FFFFFF}- отключение запрета на выход за территории`n{FFD700}/close {FFFFFF}- включение запрета на выход из территории`n{FFD700}/giveskin {FFFFFF}- выдать временный скин игроку`n{FFD700}/uncban {FFFFFF}- разбанить аккаунт и IP-адрес`n{FFD700}/sethp {FFFFFF}- установить HP игроку`n{FFD700}/resgun {FFFFFF}- забрать оружие у игрока`n{FFD700}/aveh {FFFFFF}- заспавнить транспорт`n{FFD700}/dellcar {FFFFFF}- удалить авто`n{FFD700}/dellcars {FFFFFF}- удалить ВСЕ заспавненые авто`n{FFD700}/tpint {FFFFFF}- телепортироваться в интерьер", "Закрыть")
    }
    if (ahelp1=5)
    {
       showDialog("0","{FFD700}Команды 5-го уровня", "{FFD700}/scban {FFFFFF}- тихий бан аккаунта и IP-адреса`n{FFD700}/smson {FFFFFF}- включить прослушку SMS`n{FFD700}/smsoff {FFFFFF}- выключить прослушку SMS`n{FFD700}/von {FFFFFF}- включить прослушку VIP чата`n{FFD700}/vof {FFFFFF}- выключить прослушку VIP чата`n{FFD700}/obj {FFFFFF}- выдать объект`n{FFD700}/changegz {FFFFFF}- перекраска территории гетто`n{FFD700}/givegun {FFFFFF}- выдать оружие`n{FFD700}/allresgun {FFFFFF}- забрать оружие по радиусу`n{FFD700}/allhp {FFFFFF}- выдать HP по радиусу`n{FFD700}/givebron {FFFFFF}- выдать бронежилет", "Закрыть")
    }
    if (ahelp1=6)
    {
       addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}А ещё что ты хочешь?)")
       addchatmessage("Server closed the connection.")
    }
    if (ahelp1=7)
    {
       addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}А ещё что ты хочешь?)")
       addchatmessage("Server closed the connection.")
    }
    if (ahelp1=8)
    {
       addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}А ещё что ты хочешь?)")
       addchatmessage("Server closed the connection.")
    }
    if (ahelp1<1) || if (ahelp1>8)
    {
        AddchatmessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Используйте:`n{FFD700}/acmd 1 | 2 | 3 | 4 | 5")
    }
}

if (chatinput="/mp") || if (chatinput="/mp ")
{
    gosub, mpm
}

if (chatinput="/itp") || if (chatinput="/itp ")
{
    gosub, itp
}

if (chatinput="/amsg") || if (chatinput="/amsg ")
{
    gosub, amsg
}

if (chatinput="/amute") || if (chatinput="/amute ")
{
    addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/amute [ID Игрока]")
    return
}
if (chatinput="/akick") || if (chatinput="/akick ")
{
    addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/akick [ID Игрока]")
    return
}
if (chatinput="/ajail") || if (chatinput="/ajail ")
{
    addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/ajail [ID Игрока]")
    return
}
if (chatinput="/aban") || if (chatinput="/aban ")
{
    addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/aban [ID Игрока]")
    return
}

If (chatinput="/re") || If (chatinput="/re ")
{
    if reoffre = 1
    {
        sendchat("/reoff")
        return
    }
    else
    {
        return
    }
    return
}

if (chatInput="/gg")
{
    Random, rand, 1, 5
    if rand=1
    {
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
        Sleep 3000
        SendChat("/msg Слушайте радио вместе с нами: /play >> Monser FM")
    }
    if rand=2
    {
        SendChat("/msg Если Вы хотите услышать свой трек на радио...")
        Sleep 3000
        SendChat("/msg Вы можете заказать его: forum.monser.ru >> Радио >> Стол заказов")
        Sleep, 3000
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
    }
    if rand=3
    {
        Sendchat("/msg Есть вопросы по игровому моду? Жалоба на игрока? Пишите в /report!")
        Sleep 3000
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
    }
    if rand=4
    {
        sendchat("/msg Репорт предназначен не для высказывания/выражения своих эмоций")
        Sleep, 3000
        sendchat("/msg В репорт задают вопросы по игровому моду, а так же жалуются на игроков")
        Sleep, 3000
        sendchat("/msg За оффтоп в репорт - Вы будете наказаны.")
        Sleep, 3000
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
    }
    if rand=5
    {
        Sendchat("/msg Вы всегда можете оставить жалобу на игрока/администратора..")
        Sleep, 3000
        Sendchat("/msg ..на нашем форуме - forum.monser.ru")
        Sleep, 3000
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
    }
    return
}
if chatInput contains /cc
{
    RegExMatch(chatInput, "/cc ([0-9]+)", id)
    if (RegExMatch(chatInput, "/cc$") || RegExMatch(chatInput, "/cc $"))
AddChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы не указали ID")
    Else
    {
        gNick := getPlayerNameById(id1)
        if(strlen(gNick) < 1)
        {
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Игрок не найден")
            return
        }
        gNick := RegExReplace(getPlayerNameById(id1), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
        ClipPutText(gNick)
    addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Никнейм {FFD700}" gNick "{FFFFFF} скопирован.")
        return
    }
}

if (chatInput="/sh")
{
    if acstatus != 1
    {
        SetTimer, anticheat, 1000
        PrintLow("~g~Anticheat On", 2000)
        acstatus := 1
    }
    else
    {
        SetTimer, anticheat, off
        PrintLow("~r~Anticheat Off", 2000)
        acstatus := 0
    }
}


if (chatinput="/tpall")
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
        showGameText("~y~Teleport: ~n~~r~no players", 1000, 4)
    addChatMessageEx("FFD700", "{FFD700}[A]{FFFFFF}В зоне прорисовки нет игроков")
    }
}

if chatInput contains /gomp
{
    RegExMatch(chatInput, "/gomp ([0-9]+) (.*) ([0-9]+)", mp)
    If (mp3<0)
    {
    AddChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Используйте:`n{FFD700}/gomp [Ваш ID] [Название МП] [Кол-во участников]")
    }
    Else
    {
        vkl := 1
        SendChat("/msg Уважаемые игроки сейчас пройдет МП: """ mp2 """")
        Sleep 3000
        SendChat("/msg После того как телепортировали - строй у стены.")
        Sleep 3000
        SendChat("/msg Максимальное количество участников: "mp3)
        Sleep 3000
        SendChat("/msg Кого телепортировать на мероприятие /sms " mp1 " +")
        sleep 1000
    AddChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Дождитесь пока наберётся нужное кол-во участников {FFD700}(" mp3 ")")
    AddChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Либо же остановите авто-телепорт принудительно - /mpoff")
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
                Sleep 1
                SendChat("/tpks " idigroka1)
                Sleep 1
                nstroki+=1
                i := i+1
                if (i=mp3)
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
        AddChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Функция авто-телепорта принудительно остановлена.")
        }
        return
    }
}

if RegExMatch(chatInput, "^\/askin")
{
    if(RegExMatch(chatInput, "^\/askin([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/askin$") || RegExMatch(chatInput, "^\/askin $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /askin [ID скина]")
        return
    }
    RegExMatch(chatInput, "^\/askin ([\dA-Za-z_\[\]]+)", t)
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
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Нет игроков в зоне прорисовки")
    }
    if(id < 0)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Неверно указан ID скина")
        return
    }
}
if (chatinput="/raskin")
{
	Random, rsk, 1, 311
	{
		id := rsk
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
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Нет игроков в зоне прорисовки")
    }
    if(id < 0)
    {
		addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Неверно указан ID скина")
        return
		}
	}
}

if RegExMatch(chatInput, "^\/clear")
{
    loop 20
    addChatMessageEx("FFFFFF","")
    return
}

if(RegExMatch(chatInput, "^\/ma"))
{
    if(RegExMatch(chatInput, "^\/ma([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/ma$") || RegExMatch(chatInput, "^\/ma $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /ma [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/ma ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 180 Упоминание/Оскорбление родных")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/offrep"))
{
    if(RegExMatch(chatInput, "^\/offrep([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/offrep$") || RegExMatch(chatInput, "^\/offrep $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /offrep [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/offrep ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 10 Offtop в /report")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/flood"))
{
    if(RegExMatch(chatInput, "^\/flood([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/flood$") || RegExMatch(chatInput, "^\/flood $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /flood [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/flood ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    SendChat("/mute " id " 10 Flood")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/caps"))
{
    if(RegExMatch(chatInput, "^\/caps([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/caps$") || RegExMatch(chatInput, "^\/caps $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /caps [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/caps ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    SendChat("/mute " id " 10 Caps Lock")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/pr"))
{
    if(RegExMatch(chatInput, "^\/pr([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/pr$") || RegExMatch(chatInput, "^\/pr $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /pr [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/pr ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    SendChat("/mute " id " 120 Реклама")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    Sleep 1
    SendChat("/rr")
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/osk"))
{
    if(RegExMatch(chatInput, "^\/osk([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/osk$") || RegExMatch(chatInput, "^\/osk $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /osk [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/osk ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    SendChat("/mute " id " 30 Оскорбление игроков")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/offo"))
{
    if(RegExMatch(chatInput, "^\/offo([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/offo$") || RegExMatch(chatInput, "^\/offo $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /offo [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/offo ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 40 offtop in /o")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/cenz"))
{
    if(RegExMatch(chatInput, "^\/cenz([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/cenz$") || RegExMatch(chatInput, "^\/cenz $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /cenz [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/cenz ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 20 Мат в /report")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/troll"))
{
    if(RegExMatch(chatInput, "^\/troll([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/troll$") || RegExMatch(chatInput, "^\/troll $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /troll [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/troll ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 120 Троллинг администрации")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/admosk"))
{
    if(RegExMatch(chatInput, "^\/admosk([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/admosk$") || RegExMatch(chatInput, "^\/admosk $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /admosk [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/admosk ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 180 Оскорбление администрации")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/movadm"))
{
    if(RegExMatch(chatInput, "^\/movadm([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/movadm$") || RegExMatch(chatInput, "^\/movadm $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /movadm [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/movadm ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 150 Обсуждение действий администрации ")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if(RegExMatch(chatInput, "^\/indq"))
{
    if(RegExMatch(chatInput, "^\/indq([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/indq$") || RegExMatch(chatInput, "^\/indq $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /indq [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/indq ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/mute " id " 30 Неадекватное поведение")
    if (timemute=1)
    {
        sendchat("/time")
        sleep 500
        SendInput, {F8}
    }
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}

if(RegExMatch(chatInput, "^\/noise"))
{
    if(RegExMatch(chatInput, "^\/noise([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/noise$") || RegExMatch(chatInput, "^\/noise $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте:{FFD700} /noise [ID игрока]")
        return
    }
    RegExMatch(chatInput, "^\/noise ([\dA-Za-z_\[\]]+)", t)
    id := t1
    updateOScoreboardData()
    gNick := getPlayerNameById(id)
    gNick := RegExReplace(getPlayerNameById(id), "^(\[DM\]|\[GW\]|\[TR\])*")
    SendChat("/kick " id " Помеха")
    if(strlen(gNick) < 1)
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Игрок не найден")
        return
    }
}
if RegExMatch(chatInput, "^\/cheat")
{
    if(RegExMatch(chatInput, "^\/cheat([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/cheat$") || RegExMatch(chatInput, "^\/cheat $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте: {FFD700}/cheat [ID Игрока]")
        return
    }
    RegExMatch(chatInput, "^\/cheat ([0-9]+)", hack)
    SendChat("/a /cban " hack1 " 30 cheat")
    return
}
if RegExMatch(ChatInput, "^\/capt")
{
    if(RegExMatch(chatInput, "^\/capt([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/capt$") || RegExMatch(chatInput, "^\/capt $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте: {FFD700}/capt [ID Игрока]")
    return
    }
    RegExMatch(chatInput, "^\/capt (.*)", capture)
    SendChat("/a /jail " capture1 " 10 Неправильный /capture")
    sleep 150
    Sendchat("/a /scapt Неправильный /capture")
    return
}
if RegExMatch(ChatInput, "^\/kpz")
{
    if(RegExMatch(chatInput, "^\/kpz([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/kpz$") || RegExMatch(chatInput, "^\/kpz $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте: {FFD700}/kpz [ID Игрока]")
    return
    }
    RegExMatch(chatInput, "^\/kpz (.*)", kpz)
    SendChat("/a /jail " kpz1 " 60 Cheat")
    return
}
if RegExMatch(ChatInput, "^\/onick")
{
    if(RegExMatch(chatInput, "^\/onick([^ ])"))
    return
    if((RegExMatch(chatInput, "^\/onick$") || RegExMatch(chatInput, "^\/onick $")))
    {
    addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Используйте: {FFD700}/onick [ID Игрока]")
    return
    }
    RegExMatch(chatInput, "^\/onick (.*)", onick)
    SendChat("/a /ban " onick1 " 30 Nickname")
    return
}

if RegExMatch(ChatInput, "/amute ([0-9]+)", amut)
{
    NickIgrM := RegExReplace(getPlayerNameById(amut1), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    if (amut1<0) || if (amut1>299)
    {
        addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/amute [ID Игрока]")
        return
    }
    gosub, amute
}

if RegExMatch(ChatInput, "/akick ([0-9]+)", akik)
{
    NickIgrK := RegExReplace(getPlayerNameById(akik1), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    if (akik1<0) || if (akik1>299)
    {
        addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/akick [ID Игрока]")
        return
    }
    gosub, akick
}

if RegExMatch(ChatInput, "/ajail ([0-9]+)", akpz)
{
    NickIgrJ := RegExReplace(getPlayerNameById(akpz1), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    if (akpz1<0) || if (akpz1>299)
    {
        addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/ajail [ID Игрока]")
        return
    }
    gosub, ajail
}

if RegExMatch(ChatInput, "/aban ([0-9]+)", aban)
{
    NickIgrB := RegExReplace(getPlayerNameById(aban1), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
    if (aban1<0) || if (aban1>299)
    {
        addchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Используйте: {FFD700}/aban [ID Игрока]")
        return
    }
    gosub, aban
}
return

;=============================================
; Обнуление переменной при нажатии ESC и F6
;=============================================
~ESC::
~F6::
menu:=0
return

;=============================================
; Кнопки вызова диалогов
;=============================================

amsg:
menu := 1
showDialog("2", "{FFD700}Меню отправки MSG", "Слушайте радио вместе с нами..`nЕсли вы хотите услышать свой трек на радио..`nРепорт предназначен для..`nВы всегда можете оставить жалобу на игрока/администратора..", "Закрыть")
return

itp:
menu := 2
showDialog("2","{FFD700}Меню телепортов", "Админ интерьер (/aint)`n{009900}Grove Street Gang`n{C71585}The Ballas Gang`n{FFFF00}Los Santos Vagos`n{00FFFF}Varios Los Aztecas`nDeath Match Zone`nLiberty City`nКлуб Jizzy`nКаскадёрские трюки`nАндромеда`nДом №1`nДом №2`nДом №3`nНебоскрёб`nVineWood`nГоры Bayside`nОкраина LV`nФерма наркоманов (Epsilon)`nКладбище самолётов", "Закрыть")
return

mpm:
menu := 3
Showdialog("2", "{FFD700}Меню мероприятий", "Список интерьеров`nВыдать ХП в зоне прорисовки {FFD700}[5 уровень]`nЗабрать оружие в зоне прорисовки {FFD700}[5 уровень]`nВыдать рандомный скин в зоне прорисовки {FFD700}[4 уровень]`nПолезные команды", "Закрыть")
return

amute:
menu := 5
ShowDialog("2", "{FFD700}Mute > " NickIgrM, "Упоминание/Оскорбление родных`nКапс`nФлуд`nOfftop /report`nOfftop /o`nОскорбление игроков`nНеадекватное поведение`nОскорбление администрации`nКлевета`nОбсуждение действий администрации`nТроллинг администрации`nРеклама`nОскорбление проекта`nРозжиг", "Закрыть")
return

akick:
menu := 6
ShowDialog("2", "{FFD700}Kick > " NickIgrK, "Cheat`nПомеха`nДБ`nТК`nСК`nОскорбление в нике`nНеправильный /capture", "Закрыть")
return

ajail:
menu := 7
ShowDialog("2", "{FFD700}Jail > " NickIgrJ, "Cheat`nБагоюз`nНеправильный /capture", "Закрыть")
return

aban:
menu := 8
ShowDialog("2", "{FFD700}Ban > " NickIgrB, "Cheat {32CD32}[4 lvl]{FFFFFF}`nCheat {FF8C00}[3 lvl]{FFFFFF}`nОскорбление родных`nОскорбление администрации`nРеклама`nОскорбление в нике`nНеадекватное поведение в /v`nОбман администрации", "Закрыть")
return


~LButton::
Time := A_TickCount
while(isDialogOpen())
{
    if (A_TickCount - Time > 500)
    {
  Return
    }
}
checkdialogMenu:
if (isDialogButtonSelected() == 1)
{
    menu := 0
}
ifWinNotActive, GTA:SA:MP
{
    return
}

;=============================================
; Проверка на активное меню
;=============================================

if (menu == 1)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num=1
    {
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
        Sleep 3000
        SendChat("/msg Слушайте радио вместе с нами: /play >> Monser FM")
    }
    if line_num=2
    {
        SendChat("/msg Если Вы хотите услышать свой трек на радио...")
        Sleep 3000
        SendChat("/msg Вы можете заказать его: forum.monser.ru >> Радио >> Стол заказов")
        Sleep, 3000
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
    }
    if line_num=3
    {
        sendchat("/msg Репорт предназначен не для высказывания/выражения своих эмоций")
        Sleep, 3000
        sendchat("/msg В репорт задают вопросы по игровому моду, а так же жалуются на игроков")
        Sleep, 3000
        sendchat("/msg За оффтоп в репорт - Вы будете наказаны.")
        Sleep, 3000
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
    }
    if line_num=4
    {
        Sendchat("/msg Вы всегда можете оставить жалобу на игрока/администратора..")
        Sleep, 3000
        Sendchat("/msg ..на нашем форуме - forum.monser.ru")
        Sleep, 3000
        SendChat("/msg Администрация желает вам приятной игры и отличного настроения <3")
    }
    return
}

else if (menu == 2)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num = 1
    {
        SendChat("/aint")
        sleep 100
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Админ интерьер")
    }
    if line_num = 2
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(2450.14, -1701.89, 1013.51, 2)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{009900}Grove Street Gang")
    }
    if line_num = 3
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(-49.56, 1407.24, 1084.43, 8)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{CC00FF}The Ballas Gang")
    }
    if line_num = 4
    {
        SendChat("/tpint 107")
        Sleep 1
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{FFCD00}Los Santos Vagos")
    }
    if line_num =  5
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(221.25, 1243.05, 1082.14, 2)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{00CCFF}Varios Los Aztecas")
    }
    if line_num = 6
    {
        SendChat("/aint")
        sleep 100
        setCoordinates(-1029.88, 1064.60, 1344.00, 10)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Death Match Zone")
    }
    if line_num = 7
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(-773.51, 499.55, 1376.57, 1)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Liberty City")
    }
    if line_num = 8
    {
        SendChat("/tpint 100")
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Клуб Jizzy")
    }
    if line_num = 9
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(-1441.04, 1591.55, 1052.33,14)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Каскадерские трюки")
    }
    if line_num = 10
    {
        Sleep 100
        setCoordinates(315.87, 1024.47, 1949.80, 9)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Андромеду")
    }
    if line_num = 11
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(234.08, 1069.97, 1084.19, 6)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Дом №1")
    }
    if line_num = 12
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(2318.06, -1013.34, 1054.72, 9)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Дом №2")
    }
    if line_num = 13
    {
        SendChat("/tpint 19")
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Дом №3")
    }
    if line_num = 14
    {
        SendChat("/aint")
        Sleep 100
        SendChat("/tp 1")
        Sleep 100
        setCoordinates(1544.47, -1353.54, 329.47, 0)
        setCoordinates(1544.47, -1353.54, 329.47, 0)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Небоскрёб")
    }
    if line_num = 15
    {
        Sendchat("/aint")
        sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(1445.00, -860.81, 52.53, 0)
        setCoordinates(1445.00, -860.81, 52.53, 0)
        addchatmessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}VineWood")
    }
    if line_num = 16
    {
        Sendchat("/aint")
        sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(-2829.97, 2177.57, 177.17, 0)
        setCoordinates(-2829.97, 2177.57, 177.17, 0)
        addchatmessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Горы Bayside")
    }
    if line_num = 17
    {
        Sendchat("/aint")
        sleep 100
         sendchat("/tp 1")
         sleep 100
        setCoordinates(2538.84, 2973.17, 32.17, 0)
        setCoordinates(2538.84, 2973.17, 32.17, 0)
        addchatmessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Окраину LV")
    }
    if line_num = 18
    {
        Sendchat("/aint")
        sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(-1103.46, -1114.73, 128.27, 0)
        setCoordinates(-1103.46, -1114.73, 128.27, 0)
        addchatmessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Ферму наркоманов {00FFFF}(Epsilon)")
    }
    if line_num = 19
    {
        Sendchat("/aint")
        sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(324.17, 2543.70, 25.40, 0)
        setCoordinates(324.17, 2543.70, 25.40, 0)
        addchatmessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Кладбище самолётов")
    }
    return
}

else if (menu == 3)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num=1
    {
        menu := 4
        showDialog("2", "{FFD700}Список интерьеров", "Прятки №1`nПрятки №2`nПрятки №3`nПрятки №4`nДерби №1`nДерби №2`nОстаться в живых`nПоливалка №1`nПоливалка №2", "Закрыть")
    }
    if line_num=2
    {
        sendchat("/sallhp 100")
    }
    if line_num=3
    {
        Sendchat("/resallgun")
    }
    if line_num=4
    {
        Random, rsk, 1, 311
	{
		id := rsk
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
            addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Нет игроков в зоне прорисовки")
        }
        if(id < 0)
        {
            addChatMessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}Неверно указан ID скина")
            return
            }
        }
    }
    if line_num=5
    {
        showDialog("0", "{FFD700}Полезные команды", "{FFD700}/tpall {FFFFFF}- Телепортировать всех игроков в зоне прорисовки`n{FFD700}/askin {FFFFFF}- Выдать всем игрокам в зоне прорисовки заданный скин`n{FFD700}/raskin {FFFFFF}- Выдать всем игрокам в зоне прорисовки рандомный скин`n{FFD700}/wd {FFFFFF}- Включить езду по воде`n{FFD700}/wh {FFFFFF}- Включить WallHack", "Закрыть")
        return
    }
}

else if (menu == 4)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num=1
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(2220.28, -1147.99, 1025.80, 15)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Прятки №1")
    }
    if line_num=2
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(2526.17, -1309.49, 1031.42, 2)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Прятки №2")
    }
    if line_num=3
    {
        SendChat("/aint")
        Sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(-2313.87, 1545.12, 18.77, 0)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Прятки №3")
    }
    if line_num=4
    {
        SendChat("/aint")
        sleep 100
        setCoordinates(283.06, 177.47, 1007.17, 3)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Прятки №4")
    }
    if line_num=5
    {
        SendChat("/tpint 128")
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Дерби №1")
    }
    if line_num=6
    {
        SendChat("/aint")
        Sleep 100
        setCoordinates(-1397.13, 1242.58, 1039.87, 16)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Дерби №2")
    }
    if line_num=7
    {
        Sendchat("/aint")
        sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(2584.69, 2826.82, 10.82, 0)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Остаться в живых")
    }
    if line_num=8
    {
        Sendchat("/aint")
        sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(1515.09, -1076.30, 181.20, 0)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Поливалка №1")
    }
    if line_num=9
    {
        Sendchat("/aint")
        sleep 100
        sendchat("/tp 1")
        sleep 100
        setCoordinates(1819.68, -1301.29, 131.73, 0)
        addChatMessageEx("FFFFFF", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Поливалка №1")
    }
}

else if (menu == 5)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num=1
    {
        sendchat("/mute " amut1 " 180 Упоминание/Оскорбление родных")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=2
    {
        sendchat("/mute " amut1 " 20 Caps Lock")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=3
    {
        sendchat("/mute " amut1 " 10 Flood")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=4
    {
        sendchat("/mute " amut1 " 15 Offtop /report")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=5
    {
        sendchat("/mute " amut1 " 40 Offtop /o")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=6
    {
        sendchat("/mute " amut1 " 30 Оскорбление игроков")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=7
    {
        sendchat("/mute " amut1 " 40 Неадекватное поведение")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=8
    {
        sendchat("/mute " amut1 " 180 Оск. администрации")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=9
    {
        sendchat("/mute " amut1 " 40 Клевета")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=10
    {
        sendchat("/mute " amut1 " 120 Обсуждение действий администрации")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=11
    {
        sendchat("/mute " amut1 " 120 Троллинг администрации")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=12
    {
        sendchat("/mute " amut1 " 180 Реклама")
        sleep 300
        sendchat("/rr")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=13
    {
        sendchat("/mute " amut1 " 180 Оск. проекта")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
    if line_num=14
    {
        sendchat("/mute " amut1 " 180 Розжиг")
        if (timemute=1)
        {
        sendchat("/time")
        sleep 500
        SendInput, {f8}
        }
    }
}

else if (menu == 6)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num=1
    {
        sendchat("/kick " akik1 " Cheat")
    }
    if line_num=2
    {
        sendchat("/kick " akik1 " Помеха спавну/проходу")
    }
    if line_num=3
    {
        sendchat("/kick " akik1 " DB")
    }
    if line_num=4
    {
        sendchat("/kick " akik1 " TK")
    }
    if line_num=5
    {
        sendchat("/kick " akik1 " SK")
    }
    if line_num=6
    {
        sendchat("/kick " akik1 " Оскорбление в нике")
        sleep 300
        sendchat("/rr")
    }
    if line_num=7
    {
        sendchat("/kick " akik1 " Неправильный /capture")
    }
}

else if (menu == 7)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num=1
    {
        sendchat("/jail " akpz1 " 60 Cheat")
    }
    if line_num=2
    {
        sendchat("/jail " akpz1 " 15 Багоюз")
    }
    if line_num=3
    {
        Sendchat("/scapt Неправильный /capture")
        sendchat("/jail " akpz1 " 10 Неправильный /capture")
    }
}

else if (menu == 8)
{
    menu := 0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)

    if line_num=1
    {
        Sendchat("/cban " aban1 " 30 Cheat")
    }
    if line_num=2
    {
        Sendchat("/ban " aban1 " 30 Cheat")
    }
    if line_num=3
    {
        sendchat("/ban " aban1 " 30 Оскорбление родных")
    }
    if line_num=4
    {
        sendchat("/ban " aban1 " 30 Оскорбление администрации")
    }
    if line_num=5
    {
        sendchat("/cban " aban1 " 30 Реклама")
        sleep 300
        sendchat("/rr")
    }
    if line_num=6
    {
        sendchat("/ban " aban1 " 30 Оскорбление в нике")
        sleep 300
        sendchat("/rr")
    }
    if line_num=7
    {
        sendchat("/ban " aban1 " 3 Неадекватное поведение в /v")
    }
    if line_num=8
    {
        sendchat("/ban " aban1 " 10 Обман администрации")
    }
}
return




Login:
{
    GetChatLine(0, alogin)
    IfInString, alogin, Для зачисления онлайна в статистику /ia необходимо заступить на дежурство (/duty)
    {
        if (AnticheatSh=1)
        {
            SetTimer, anticheat, 1000
            acstatus := 1
        }
        If aduty = 1
        {
            Sendchat("/duty " Duty)
        }
        If conoff = 1
        {
            Sendchat("/conoff")
        }
        If fon = 1
        {
            Sendchat("/fon")
            sleep 500
            Sendchat("/von")
            sleep 500
            Sendchat("/smson")
        }
        if youroff1 = 1
        {
            Sendchat(yourcmd1)
        }
        if youroff2 = 1
        {
            Sendchat(yourcmd2)
        }
    }
    return
}
return

BinderTogether:
{
    Gui, 9:Destroy
    Gui, 2:Color, FFFFFF
    Gui, 2:Add, Hotkey, x6 y27 w60 h20 vhotkey1, %hotkey1%
    Gui, 2:Add, Hotkey, x6 y57 w60 h20 vhotkey2, %hotkey2%
    Gui, 2:Add, Hotkey, x6 y87 w60 h20 vhotkey3, %hotkey3%
    Gui, 2:Add, Hotkey, x6 y117 w60 h20 vhotkey4, %hotkey4%
    Gui, 2:Add, Hotkey, x6 y147 w60 h20 vhotkey5, %hotkey5%
    Gui, 2:Add, Hotkey, x6 y177 w60 h20 vhotkey6, %hotkey6%
    Gui, 2:Add, Hotkey, x6 y207 w60 h20 vhotkey7, %hotkey7%
    Gui, 2:Add, Hotkey, x6 y237 w60 h20 vhotkey8, %hotkey8%
    Gui, 2:Add, Hotkey, x6 y267 w60 h20 vhotkey9, %hotkey9%
    Gui, 2:Add, Hotkey, x6 y297 w60 h20 vhotkey10, %hotkey10%
    Gui, 2:Add, Hotkey, x6 y327 w60 h20 vhotkey11, %hotkey11%
    Gui, 2:Add, Hotkey, x6 y357 w60 h20 vhotkey12, %hotkey12%
    Gui, 2:Add, Text, x16 y7 w40 h20 , Кнопки
    Gui, 2:Add, Edit, x76 y27 w370 h20 vedit1, %edit1%
    Gui, 2:Add, Edit, x76 y57 w370 h20 vedit2, %edit2%
    Gui, 2:Add, Edit, x76 y87 w370 h20 vedit3, %edit3%
    Gui, 2:Add, Edit, x76 y117 w370 h20 vedit4, %edit4%
    Gui, 2:Add, Edit, x76 y147 w370 h20 vedit5, %edit5%
    Gui, 2:Add, Edit, x76 y177 w370 h20 vedit6, %edit6%
    Gui, 2:Add, Edit, x76 y207 w370 h20 vedit7, %edit7%
    Gui, 2:Add, Edit, x76 y237 w370 h20 vedit8, %edit8%
    Gui, 2:Add, Edit, x76 y267 w370 h20 vedit9, %edit9%
    Gui, 2:Add, Edit, x76 y297 w370 h20 vedit10, %edit10%
    Gui, 2:Add, Edit, x76 y327 w370 h20 vedit11, %edit11%
    Gui, 2:Add, Edit, x76 y357 w370 h20 vedit12, %edit12%
    Gui, 2:Add, Text, x235 y7 w50 h20 +Center, Текст
    Gui, 2:Add, CheckBox, x456 y27 w50 h20 venter1 checked%enter1%, Enter
    Gui, 2:Add, CheckBox, x456 y57 w50 h20 venter2 checked%enter2%, Enter
    Gui, 2:Add, CheckBox, x456 y87 w50 h20 venter3 checked%enter3%, Enter
    Gui, 2:Add, CheckBox, x456 y117 w50 h20 venter4 checked%enter4%, Enter
    Gui, 2:Add, CheckBox, x456 y147 w50 h20 venter5 checked%enter5%, Enter
    Gui, 2:Add, CheckBox, x456 y177 w50 h20 venter6 checked%enter6%, Enter
    Gui, 2:Add, CheckBox, x456 y207 w50 h20 venter7 checked%enter7%, Enter
    Gui, 2:Add, CheckBox, x456 y237 w50 h20 venter8 checked%enter8%, Enter
    Gui, 2:Add, CheckBox, x456 y267 w50 h20 venter9 checked%enter9%, Enter
    Gui, 2:Add, CheckBox, x456 y297 w50 h20 venter10 checked%enter10%, Enter
    Gui, 2:Add, CheckBox, x456 y327 w50 h20 venter11 checked%enter11%, Enter
    Gui, 2:Add, CheckBox, x456 y357 w50 h20 venter12 checked%enter12%, Enter
    Gui, 2:Add, Button, x6 y387 w100 h20 gInfoMetka, Метки
    Gui, 2:Add, Button, x203 y387 w110 h20 gSaveButton, Сохранить
    Gui, 2:Add, Button, x406 y387 w110 h20 gMSGBinder, MSG Binder
    Gui, 2:Show, x388 y163 h414 w524, Binder by together
}
return

MSGBinder:
{
    Gui, 9:Color, FFFFFF
    Gui, 2:Destroy
    Gui, 9:Add, GroupBox, x6 y7 w510 h110 +Center, Две строки
    Gui, 9:Add, Edit, x16 y27 w490 h20 veditmsg1, %editmsg1%
    Gui, 9:Add, Text, x16 y57 w150 h20 , Задержка в м/c (Мин. 3000)
    Gui, 9:Add, Edit, x176 y57 w90 h20 veditmsgsleep1, %editmsgsleep1%
    Gui, 9:Add, Edit, x16 y87 w490 h20 veditmsg2, %editmsg2%
    Gui, 9:Add, Hotkey, x6 y137 w60 h20 vhotkeymsg1, %hotkeymsg1%
    Gui, 9:Add, Text, x76 y137 w110 h20 , Отправка двух строк
    Gui, 9:Add, GroupBox, x6 y167 w510 h170 +Center, Три строки
    Gui, 9:Add, Edit, x16 y187 w490 h20 veditmsg3, %editmsg3%
    Gui, 9:Add, Text, x16 y217 w150 h20 , Задержка в м/c (Мин. 3000)
    Gui, 9:Add, Edit, x176 y217 w90 h20 veditmsgsleep2, %editmsgsleep2%
    Gui, 9:Add, Edit, x16 y247 w490 h20 veditmsg4, %editmsg4%
    Gui, 9:Add, Text, x16 y277 w150 h20 , Задержка в м/c (Мин. 3000)
    Gui, 9:Add, Edit, x176 y277 w90 h20 veditmsgsleep3, %editmsgsleep3%
    Gui, 9:Add, Edit, x16 y307 w490 h20 veditmsg5, %editmsg5%
    Gui, 9:Add, Hotkey, x6 y347 w60 h20 vhotkeymsg2, %hotkeymsg2%
    Gui, 9:Add, Text, x76 y347 w110 h20 , Отправка трёх строк
    Gui, 9:Add, Button, x209 y407 w100 h20 gSaveButton, Сохранить
    Gui, 9:Add, Button, x6 y407 w120 h20 gBinderTogether, Стандартный биндер
    Gui, 9:Add, Text, x155 y377 w210 h20 +Center, В поле ввода /msg писать НЕ НУЖНО
    Gui, 9:Add, Button, x416 y407 w100 h20 gWarnMSG, ВАЖНО!
    Gui, 9:Show, x346 y134 h433 w527, Binder by together | MSG Binder
}
return

EditCmd:
{
	GuiControlGet, cmd, , cmdpunish
	GuiControlGet, cmd1, , ippunish
	if cmd=/offmute
		t=5|10|15|20|30|40|60|120|180
	if cmd=/offjail
		t=10|60
	if cmd=/offban
		t=2|5|10|30
	if cmd=/offcban
	{
		GuiControl, -Disabled, ippunish,
		t=2|5|10|30
	}
	else
	{
		GuiControl, +Disabled, ippunish,
	}
	GuiControl, , dayspunish, |%t%
}
return

restorepunish:
{
	if StrLen(lastmove) = 0
	{
		MsgBox, 16, Ошибка, Откатывать нечего!
		return
	}
	else
	{
		MsgBox, 64, Успешно, Вы откатили последнее действие - %cmd% %days%%cmd1% %nick% %reason%
		FileDelete, %A_Temp%\Punishment.txt
		FileAppend, %lastmove%, %A_Temp%\Punishment.txt
	}
}
return

SaveButtonPunish:
{
	GuiControlGet, cmd, , cmdpunish
	GuiControlGet, cmd1, , ippunish
	GuiControlGet, days, , dayspunish
	GuiControlGet, nick, , nicknamepunish
	GuiControlGet, reason, , reasonpunish
	if cmd=/offcban
	{
		cmd1 :=" " cmd1
	}
	else
	{
		cmd1=
	}
	if StrLen(cmd) == 0 || StrLen(reason) == 0 || StrLen(nick) == 0 || days<1
	{
		MsgBox, 16, Ошибка, Заполните все поля перед тем как сохранить!
		return
	}

	FileRead, lastmove, %A_Temp%\Punishment.txt
	FileAppend,
(

%cmd% %days%%cmd1% %nick% %reason%
), %A_Temp%\Punishment.txt,
MsgBox, 64, Успешно, Вы добавили %nick% в список наказаний!
}
return

WarnMSG:
{
    Gui, 10:Color, FFFFFF
	Gui, 10:Add, Text, x145 y7 w110 h20 +Center, Важно к прочтению!
	Gui, 10:Add, Text, x6 y37 w400 h110 , 1. Повторю несколько раз`, в полях ввода НЕ НУЖНО писать команду /msg`, нужно писать всё`, что должно быть после неё`n`n2. Задержку ставьте БОЛЬШЕ 3000 М/C`, 1 секунда = 1000`, если поставите меньше 3000 - схватите бан за флуд`n`n3. Бред так же писать в поля ввода не стоит`, используйте данный биндер с умом и пользой
	Gui, 10:Add, Button, x150 y157 w100 h20 g10GuiClose, Закрыть
	Gui, 10:Show, x361 y195 h180 w403, Binder by together | MSG Binder
}
return


butbanre:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/cban %lastidrec% 30 Cheat{space}
    AddchatMessageEx("FFFFFF", "{FF0000}[A]{FFFFFF} Убедитесь, что Вы {FF0000}баните{FFFFFF} нужного вам игрока!" " {FF0000}(" nameidrec ")" )
    return
}
return

butkpzre:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/jail %lastidrec% 60 Cheat{space}
    AddchatMessageEx("FFFFFF", "{FF0000}[A]{FFFFFF} Убедитесь, что Вы {FF0000}садите в КПЗ{FFFFFF} нужного вам игрока!" " {FF0000}(" nameidrec ")" )
    return
}
return

chat:
{
    ;~ chat=%A_MyDocuments%/GTA San Andreas User Files/SAMP/chatlog.txt 
	;~ FileRead, chatlog, %chat% 
    ;~ if RegExMatch(chatlog, "\]\s+{00CD66}\[A:.*\] (Kenneth_Preacher|N0snam|Antonio_Together|brolly|Seliwan) \[ID:.*\]: Ну чё, доигрался", botcmd)
    ;~ {
        ;~ save(chatlog)
        ;~ addchatmessageEx("FFFFFF", "{FF6347}Администратор " botcmd1 " выдал предупреждение администратору " getusername() ". Причина: privet ot together'a")
        ;~ addchatmessageEx("FFFFFF", "Вам выдали предупреждение")
        ;~ return
    ;~ }
    ;~ else if RegExMatch(chatlog, "\]\s+{00CD66}\[A:.*\] (Kenneth_Preacher|N0snam|Antonio_Together|brolly|Seliwan) \[ID:.*\]: Дароу, чё как оно?", botcmd)
    ;~ {
        ;~ save(chatlog)
        ;~ Random, qqrand, 1, 6
        ;~ {
            ;~ if qqrand=1
            ;~ {
                ;~ sendchat("/a здравствуйте, царь")
                ;~ return
            ;~ }
            ;~ if qqrand=2
            ;~ {
                ;~ sendchat("/a welcome bro :D")
                ;~ return
            ;~ }
            ;~ if qqrand=3
            ;~ {
                ;~ sendchat("/a kyky epta")
                ;~ return
            ;~ }
            ;~ if qqrand=4
            ;~ {
                ;~ sendchat("/a чё пришёл?")
                ;~ return
            ;~ }
            ;~ if qqrand=5
            ;~ {
                ;~ sendchat("/a Тебе пред выдать?")
                ;~ return
            ;~ }
            ;~ if qqrand=6
            ;~ {
                ;~ sendchat("/a Я не понял, ты почему ещё не в строю в /aint?")   
                ;~ return
            ;~ }
        ;~ }
    ;~ }
    ;~ else if RegExMatch(chatlog, "\]\s+{00CD66}\[A:.*\] (Kenneth_Preacher|N0snam|Antonio_Together|brolly|Seliwan) \[ID:.*\]: ia чекни, бесишь", botcmd)
    ;~ {
        ;~ save(chatlog)
        ;~ Sendchat("/ia")
        ;~ return
    ;~ }
    ;~ else if RegExMatch(chatlog, "\]\s+{00CD66}\[A:.*\] (Kenneth_Preacher|N0snam|Antonio_Together|brolly|Seliwan) \[ID:.*\]: На горшок и спать", botcmd)
    ;~ {
        ;~ save(chatlog)
        ;~ SendInput, {f6}/
        ;~ sleep 500
        ;~ SendInput, q{space}
        ;~ sleep 500
        ;~ SendInput, pr
        ;~ sleep 500
        ;~ SendInput, iv
        ;~ sleep 500
        ;~ SendInput, et{space}
        ;~ sleep 500
        ;~ SendInput, ot{space}
        ;~ sleep 500
        ;~ SendInput, togethera :)
        ;~ sleep 500
        ;~ MsgBox, 48, love u <3, терроризирующий бронетранспортер с авторефрижератор
        ;~ run, https://vk.com/shulz2702
        ;~ return
    ;~ }
    ;~ else if RegExMatch(chatlog, "\]\s+{00CD66}\[A:.*\] (Kenneth_Preacher|N0snam|Antonio_Together|brolly|Seliwan) \[ID:.*\]: (Ребята, а вы знаете как меня зовут?|Ребята, а вы знаете как зовут главного следящего?)", botcmd)
    ;~ {
        ;~ save(chatlog)
        ;~ sleep 2000
        ;~ run, https://www.youtube.com/watch?v=PvtWt6DI3TI
        ;~ return
    ;~ }
    If infore = 1
    {
        chat=%A_MyDocuments%/GTA San Andreas User Files/SAMP/chatlog.txt
        FileRead, chatlog, %chat%
        if (RegExMatch(chatlog, "{32CD32}Администратор " AdminNick " \[ID\:(.*)\] начал наблюдение за игроком (.*) \[ID\:(.*)\]", out))
        {
            lastidrec := out3
            nameidrec := out2
            NickIgr := RegExReplace(getPlayerNameById(out3), "^(\[DM\]|\[GW\]|\[TR\]|\[LC\])*")
            save(chatlog)
            AddchatmessageEx("FFFFFF", "{FFD700}[A]{FFFFFF} Ник игрока: {FFD700}" NickIgr "{FFFFFF} | Кол-во убийств: {FFD700}" getPlayerScoreById(out3) "{FFFFFF} | Пинг: {FFD700}" getPlayerPingById(out3))
            sleep 100
            Sendchat("/ta " lastidrec)
            if (cvre=1)
            {
                setPlayerColor(lastidrec, 0xFF33AA4)
            }
            return
        }
    }
}
return

;перевод на ингл
:?:.кущаа::
SendInput, /reoff{space}
return

:?:.ку::
SendInput, /re{space}
return

:?:.сифт::
SendInput, /cban{space}
return

:?:.ифт::
SendInput, /ban{space}
return

:?:.лшсл::
SendInput, /kick{space}
return

:?:.ьгеу::
SendInput, /mute{space}
return

:?:.щаапуеыефеы::
SendInput, /offgetstats{space}
return

:?:.пуеыефеы::
SendInput, /getstats{space}
return

:?:.еф::
SendInput, /ta{space}
return

:?:.фьуьиукы::
SendInput, /amembers{space}
return

:?:.вген::
SendInput, /duty{space}
return

:?:.ылшсл::
SendInput, /skick{space}
return

:?:.ф::
SendInput, /a{space}
return

:?:.шф::
SendInput, /ia{space}
return

:?:.зь::
SendInput, /pm{space}
return

:?:.фвьшты::
SendInput, /admins{space}
return

:?:.кк::
SendInput, /rr{space}
return

:?:.ыдфз::
SendInput, /slap{space}
return

:?:.гтьгеу::
SendInput, /unmute{space}
return

:?:.щаагтьгеу::
SendInput, /offunmute{space}
return

:?:.щааифт::
SendInput, /offban{space}
return

:?:.щаасифт::
SendInput, /offcban{space}
return

:?:.ифтшз::
SendInput, /banip{space}
return

:?:.офшд::
SendInput, /jail{space}
return

:?:.ысфк::
SendInput, /scar{space}
return

:?:.езс::
SendInput, /tpc{space}
return

:?:.дтфьу::
SendInput, /lname{space}
return

:?:.мща::
SendInput, /vof{space}
return

:?:.куыпгт::
SendInput, /resgun{space}
return

:?:.гтофшд::
SendInput, /unjail{space}
return

:?:.щаагтофшд::
SendInput, /offunjail{space}
return

:?:.щааофшд::
SendInput, /offjail{space}
return

:?:.фрудз::
SendInput, /ahelp{space}
return

:?:.езлы::
SendInput, /tpks{space}
return

:?:.езлт::
SendInput, /tpkn{space}
return

:?:.щио::
SendInput, /obj{space}
return

:?:.штаьгеу::
SendInput, /infmute{space}
return

:?:.штаофшд::
SendInput, /infjail{space}
return

:?:.штаифт::
SendInput, /infban{space}
return

:?:.шташз::
SendInput, /infip{space}
return

:?:.ащт::
SendInput, /fon{space}
return

:?:.ащаа::
SendInput, /foff{space}
return

:?:.гтифт::
SendInput, /unban{space}
return

:?:.ыуеылшт::
SendInput, /setskin{space}
return

:?:.сщтщт::
SendInput, /conon{space}
return

:?:.сщтщаа::
SendInput, /conoff{space}
return

:?:.аднсфь::
SendInput, /flycam{space}
return

InfoMetka:
{
    Gui, 4:Color, FFFFFFF
    Gui, 4:Add, Text, x170 y7 w50 h20 +Center, Метки
    Gui, 4:Add, Button, x146 y117 w100 h20 g4GuiClose, Закрыть
    Gui, 4:Add, Text, x5 y27 w380 h30 , {LEFT кол-во символов} - Отматать по кол-ву символов курсор`nПример: /pm  Привет{LEFT 7}
    Gui, 4:Add, Text, x6 y67 w260 h30 , {SPACE} - Сделать пробел в помеченном месте`nПример: /re{space}
    Gui, 4:Show, x251 y119 h145 w394, Binder by together

}
return

InfoAHK:
{
    Gui, 11:Color, FFFFFF
    Gui, 11:Add, GroupBox, x6 y6 w460 h90 +Center, Основная информация
    Gui, 11:Add, Text, x16 y26 w200 h20 , Разработчик скрипта: Antonio Together
    Gui, 11:Add, Text, x16 y56 w200 h20 , Помощник/Вдохновитель: Rey Forelli
    Gui, 11:Add, Text, x246 y26 w200 h20 , Skype: mc5065 | VK: vk.com/shulz2702
    Gui, 11:Add, Text, x246 y56 w210 h20 , Skype: denissss03
    Gui, 11:Add, GroupBox, x6 y106 w460 h210 +Center, Хочу сказать спасибо
    Gui, 11:Add, Text, x16 y156 w300 h20 , Denis Wiberg - Без него бы скрипт вообще не существовал
    Gui, 11:Add, Text, x16 y186 w300 h20 , Rey Forelli и Logorifm - За хорошие идеи и поддержку
    Gui, 11:Add, Text, x16 y216 w440 h30 , Wanted Lambord`, BathoryS`, James DeLuca и всем остальным кто помогал тестировать новые плюшки
    Gui, 11:Add, Text, x16 y126 w440 h20 , Kenneth Preacher - За то`, что дал возможность взять на себя АХК для администрации
    Gui, 11:Add, Text, x16 y256 w440 h20 , Damager Ilinet - За нахождение ошибок на форуме и в скрипте
    Gui, 11:Add, Text, x16 y286 w430 h20 +Center, И тебе`, за то`, что пользуешься моим скриптом <3
    Gui, 11:Add, Button, x187 y326 w100 h20 g11GuiClose, Закрыть
    Gui, 11:Show, x368 y187 h355 w478, Информация о скрипте
}
return

ClickMonser:
{
    Run, http://monser.ru/?news=0
}
return

Link:
{
    Run http://forum.monser.ru/index.php/topic/13087-ahk-dlia-administratcii-update-12122017/
}
return

CMDList1:
{
    Gui, 13:Destroy
    Gui, 3:Color, FFFFFF
    Gui, 3:Add, Text, x6 y6 w470 h230 , /ah - Показать список команд`n/tabl - Таблица наказаний`n/cc - Копировать ник по ID`n/mp - Создать МП`n/mpoff - Принудительно остановить авто-телепортацию на МП`n/mp - Меню мероприятий`n/gomp - Создать мероприятие`n/gg - Пожелать приятной игры (До 5 рандомных сообщений)`n/amsg - Меню отправки /msg`n/itp - Меню телепорта`n/tpall - Телепортировать всех игроков в зоне прорисовки`n/askin - Выдать всем игрокам в зоне прорисовки заданный скин`n/raskin - Выдать всем игрокам в зоне прорисовки рандомный скин`n/by - Выдать наказание по просьбе администратора`n/byinfo - Теги для /by`n/tempcmd - Посмотреть команды для работы с Temp List'ом`n/dellpunish - Удалить список Punishment'a
    Gui, 3:Add, Button, x188 y246 w100 h20 g3GuiClose, Закрыть
    Gui, 3:Add, Button, x6 y246 w120 h20 gvetka, Подробнее о списках
    Gui, 3:Add, Button, x346 y246 w120 h20 gCMDLIST2, >>>
    Gui, 3:Show, x325 y262 h275 w478, Command List №1
    Return
}
return

CMDLIST2:
{
    Gui, 3:Destroy
    Gui, 13:Color, FFFFFF
    Gui, 13:Add, Text, x6 y6 w470 h230 , /dlist - Посмотреть команды быстрой выдачи наказаний`n/alist - Посмотреть команды выдачи наказаний`n/request - Команды для "быстрых" просьб в /a чат`n/bug - Решение распространённых багов скрипта`n/clear - Очистить чат`n/cv - Изменить цвет ника игроку (Специально для трейсера пуль)`n/wh - Включить WallHack`n/acmd - Посмотреть /ahelp по уровням в диалоговом окне`n/wd - Включить езду по воде`n/rsp - Слежка за рандомным ID`n/sh - Включить/Выключить античит на SpeedHack`n/skin - Узнать ID скина по ID игрока`n/thx - Благодарность для тебя`n/last - Узнать ID и ник последнего рекона`n/reloadahk - Перезагрузить скрипт
    Gui, 13:Add, Button, x188 y246 w100 h20 g13GuiClose, Закрыть
    Gui, 13:Add, Button, x356 y246 w120 h20 gvetka, Подробнее о списках
    Gui, 13:Add, Button, x6 y246 w120 h20 gCMDLIST1, <<<
    Gui, 13:Show, x278 y151 h277 w480, Command List №2
}
return

MoreEwe:
{
    Gui, 6:Color, FFFFFF
    Gui, 6:Add, GroupBox, x6 y6 w340 h140 +Center, Полезные функции
    Gui, 6:Add, CheckBox, x16 y27 w200 h20 vinfore Checked%infore%, Информация о игроке при слежке
    Gui, 6:Add, CheckBox, x16 y57 w220 h20 vfon Checked%fon%, Включить все прослушки (+3 уровень)
    Gui, 6:Add, CheckBox, x16 y87 w160 h20 vcvre Checked%cvre%, Автоматическое /cv по /re
    Gui, 6:Add, Button, x72 y219 w90 h20 gSaveButton, Сохранить
    Gui, 6:Add, Button, x182 y219 w90 h20 g6GuiClose, Закрыть
    Gui, 6:Add, CheckBox, x16 y116 w220 h20 vreoffre Checked%reoffre%, Пустое значение /re как /reoff
    Gui, 6:Add, CheckBox, x22 y149 w20 h20 vyouroff1 Checked%youroff1%, 
    Gui, 6:Add, Edit, x52 y149 w150 h20 vyourcmd1, %yourcmd1%
    Gui, 6:Add, CheckBox, x22 y179 w20 h20 vyouroff2 Checked%youroff2%, 
    Gui, 6:Add, Edit, x52 y179 w150 h20 vyourcmd2, %yourcmd2%
    Gui, 6:Show, x528 y165 h248 w361, Полезные функции #2
    return
}
return

vetka:
{
    Gui, 8:Color, FFFFFF
    Gui, 8:Add, Button, x35 y17 w120 h30 gAlistInfo, Подробнее о /alist
    Gui, 8:Add, Button, x35 y67 w120 h30 gInfospiski, Подробнее о /request
    Gui, 8:Add, Button, x35 y116 w120 h30 gDlistInfo, Подробнее о /dlist
    Gui, 8:Show, x579 y174 h159 w192, Подробнее о списках
    return
}
return

Infospiski:
{
    Gui, 8:Destroy
    Gui, 7:Color, FFFFFF
    Gui, 7:Add, Text, x6 y7 w340 h70 , /cheat - Просьба в /a о бане игрока за читы`n/capt - Просьба в /a чат о неправильном /capture`n/kpz - Просьба в /a чат о джайле за читы`n/onick - Просьба в /a чат о бане за ник
    Gui, 7:Add, Button, x124 y77 w100 h20 g7GuiClose, Закрыть
    Gui, 7:Show, x332 y182 h103 w350, Request List
    Return
}
return


Alistinfo:
{
    Gui, 8:Destroy
    Gui, 5:Color, FFFFFF
    Gui, 5:Add, Text, x6 y6 w180 h70 +Left, /aban - Выдать бан`n/ajail - Выдать КПЗ`n/akick - Выдать кик`n/amute - Выдать мут
    Gui, 5:Add, Button, x46 y86 w100 h20 g5GuiClose, Закрыть
    Gui, 5:Show, x516 y195 h111 w194, AList
    return
}
return

Dlistinfo:
{
    Gui, 8:Destroy
    Gui, 5:Color, FFFFFF
    Gui, 5:Add, Text, x6 y7 w480 h180 , /ma - Выдать мут за упоминание/оскорбление родных`n/offrep - Выдать мут за offtop в /report`n/flood- Выдать мут за флуд`n/caps - выдать мут за CapsLock`n/pr - Выдать мут за рекламу`n/osk - Выдать мут за оскорбление игроков`n/offo - Выдать мут за offtop в /o`n/cenz - Выдать мут за мат в /report`n/troll - Выдать мут за троллинг администрации`n/admosk - Выдать мут за оскорбление администрации`n/indq - Выдать мут за неадекватное поведение`n/movadm - Выдать мут за обсуждение действий администрации`n/noise - Выдать кик за помеху
    Gui, 5:Add, Button, x126 y187 w100 h20 +Center g5GuiClose, Закрыть
    Gui, 5:Show, x332 y182 h211 w354, DList
    return
}
return

Anticheat:
hat := getChatLineEx(line := 0)
dout:=""
Players := getStreamedInPlayersInfo()
p := 0
For ipl, o in Players
{
    car := isTargetDriverbyId(ipl)
    if (car=="1")
    {
        speed := getTargetVehicleSpeedById(ipl)
        namecar := getTargetVehicleModelNameById(ipl)
        nick := RegExReplace(getPlayerNameById(ipl), "^(\[DM\]|\[GW\])*")
        if (speed>=135)
        {
            If (Speed>=165)
            {
                if namecar = Bullet
                {
                    return
                }
                if namecar = Infernus
                {
                    return
                }
                if namecar = Turismo
                {
                    return
                }
                if namecar = NRG-500
                {
                    return
                }
                if namecar = Elegy
                {
                    return
                }
                if namecar = Sultan
                {
                    return
                }
                if namecar = Super GT
                {
                    return
                }
                else
                {
                AddChatMessageEx("FFFFFF", "{FF0000}(SH){FF0000} " nick " [ID:" ipl "] {FFFFFF}возможно использует SpeedHack! Авто:{FF0000} " namecar " {FFFFFF}| Скорость:{FF0000} " Speed)
                Sleep 2000
            }
            }
            Else
            {
                AddChatMessageEx("FFFFFF", "{32CD32}(SH){32CD32} " nick " [ID:" ipl "] {FFFFFF}возможно использует SpeedHack! Авто:{32CD32} " namecar " {FFFFFF}| Скорость:{32CD32} " Speed)
                Sleep 2000
            }
        }
    }
}
return

~$vk9::
{
    tab := 1
}
return

Alert:
{
    Random, randalert, 1, 2
    if randalert = 1
    {
        AddchatmessageEx("FFFFFF", "{32CD32}[A] {FFFFFF}Я всегда жду ваших предложений по АХК на форуме, бегом строчить!1!!")
    }
    if randalert = 2
    {
        AddchatmessageEx("FFFFFF", "{32CD32}[A] {FFFFFF}Возможно решение какой-то проблемы со скриптом есть в {FFD700}/bug")
    }
}
return

TempList:
{
    Gui, 12:Color, FFFFFF
    Gui, 12:Add, Button, x151 y206 w80 h20 g12GuiClose, Закрыть
    Gui, 12:Add, GroupBox, x6 y6 w370 h190 +Center, Temp List
    Gui, 12:Add, Text, x16 y26 w350 h160 vTempList, %TempList%
    Gui, 12:Show, x437 y184 h234 w384, Temp List
    return

}
return

13GuiClose:
Gui, 13:Destroy
return

12GuiClose:
Gui, 12:Destroy
return

11GuiClose:
Gui, 11:Destroy
return

10GuiClose:
Gui, 10:Destroy
Return

9GuiClose:
Gui, 9:Destroy
return

8GuiClose:
Gui, 8:Destroy
return

7GuiClose:
Gui, 7:Destroy
return

6GuiClose:
Gui, 6:Destroy
return

5GuiClose:
Gui, 5:Destroy
return

4GuiClose:
Gui, 4:Destroy
return

3GuiClose:
Gui, 3:Destroy
return

2GuiClose:
Gui, 2:Destroy
return

GuiClose:
ExitApp
return
