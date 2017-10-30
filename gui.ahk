#NoEnv
#SingleInstance force
#include samp.ahk
#IfWinActive GTA:SA:MP

DIR = %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Settings
FileCreateDir, %DIR%
DIRSET = %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Settings\options.ini

IfNotExist,%DIR%\*.ini
{
    SplashTextOn, , 60,Monser Gang War AHK,Наберитесь терпения`nидёт установка нужных файлов...
    UrlDownloadToFile, https://www.dropbox.com/s/urpzy5kypr3jucv/options.ini?dl=1, %DIR%\options.ini
    SplashTextoff
}
settimer, Login, 100

;AutoHotKey for Monser Gang War by together.

;GUI
IfExist, %DIR%\options.ini
{
Gosub, ReadSettings
Gui, Add, Button, x214 y317 w150 h30 gSaveButton, Сохранить
Gui, Add, Tab, x6 y7 w580 h350 , Репорты|Муты|Кики и КПЗ|Баны|Дополнительно
Gui, Tab, Репорты
Gui, Add, GroupBox, x16 y37 w270 h120 +Center, Слежка за игроком
Gui, Add, Hotkey, x26 y67 w60 h20 vrecon, %recon%
Gui, Add, Text, x96 y67 w160 h20 , Работаю по вашей жалобе
Gui, Add, Hotkey, x26 y97 w60 h20 vnorecon, %norecon%
Gui, Add, Text, x96 y97 w140 h20 , Нарушений не выявлено
Gui, Add, Hotkey, x26 y127 w60 h20 vyesrecon, %yesrecon%
Gui, Add, Text, x96 y127 w120 h20 , Данный игрок наказан
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
Gui, Add, Hotkey, x306 y67 w60 h20 vgg, %gg%
Gui, Add, Text, x376 y67 w140 h20 , Пожелать приятной игры
Gui, Add, Hotkey, x306 y97 w60 h20 vforum, %forum%
Gui, Add, Text, x376 y97 w170 h20 , Отправить на форум писать ЖБ
Gui, Add, Hotkey, x306 y127 w60 h20 vacc, %acc%
Gui, Add, Text, x376 y127 w170 h20 , Как восстановить аккаунт?
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
Gui, Add, Text, x356 y107 w180 h20 , Розжиг меж. национальной розни
Gui, Add, Hotkey, x286 y77 w60 h20 vmovieadm, %movieadm%
Gui, Add, Text, x356 y77 w200 h20 , Обсуждение действий администрации
Gui, Add, Hotkey, x286 y47 w60 h20 vtrolladm, %trolladm%
Gui, Add, Text, x356 y47 w140 h20 , Троллинг администрации
Gui, Tab, Кики и КПЗ
Gui, Add, Hotkey, x26 y47 w60 h20 vdb, %db%
Gui, Add, Text, x96 y47 w70 h20 , DriveBy (DB)
Gui, Add, Hotkey, x26 y77 w60 h20 vtk, %tk%
Gui, Add, Text, x96 y77 w70 h20 , Team Kill (TK)
Gui, Add, Hotkey, x26 y107 w60 h20 vspawn, %spawn%
Gui, Add, Text, x96 y107 w130 h20 , Помеха проходу/спавну
Gui, Add, Hotkey, x26 y137 w60 h20 vnickosk, %nickosk%
Gui, Add, Text, x96 y137 w110 h20 , Оскорбление в нике
Gui, Add, Hotkey, x26 y167 w60 h20 vcapturekick, %capturekick%
Gui, Add, Text, x96 y167 w130 h20 , Неправильный /capture
Gui, Add, Hotkey, x26 y197 w60 h20 vcheatkick, %cheatkick%
Gui, Add, Text, x96 y197 w160 h20 , Использование чит-программ
Gui, Add, GroupBox, x266 y27 w290 h200 +Center, Примечание
Gui, Add, Text, x276 y47 w270 h40 , Если на сервере присутствует администратор +2 уровня и выше`, не нужно кикать за такие причины как:
Gui, Add, Text, x276 y97 w270 h30 , Неправильный /capture (+2 уровень может выдать КПЗ)
Gui, Add, Text, x276 y137 w260 h30 , Оскорбление в нике (+3 уровень может забанить данного игрока)
Gui, Add, Text, x276 y177 w260 h30 , Использование чит-программ (+2 уровень может дать КПЗ`, либо +3 забанить)
Gui, Add, GroupBox, x16 y27 w240 h200 +Center, Кики
Gui, Add, GroupBox, x16 y237 w550 h60 +Center, КПЗ
Gui, Add, Hotkey, x26 y257 w50 h20 vcheatkpz, %cheatkpz%
Gui, Add, Text, x86 y257 w160 h20 , Использование чит-программ
Gui, Add, Hotkey, x256 y257 w50 h20 vbagouse, %bagouse%
Gui, Add, Text, x316 y257 w40 h20 , Багоюз
Gui, Add, Text, x426 y257 w130 h20 , Неправильный /capture
Gui, Add, Hotkey, x366 y257 w50 h20 vcapturekpz, %capturekpz%
Gui, Tab, Баны
Gui, Add, Hotkey, x266 y47 w60 h20 vosknick, %osknick%
Gui, Add, Text, x336 y47 w110 h20 , Оскорбление в нике
Gui, Add, Hotkey, x266 y107 w60 h20 vfalseadm, %falseadm%
Gui, Add, Text, x336 y107 w120 h20 , Обман администрации
Gui, Add, Hotkey, x266 y137 w60 h20 vneadekvatv, %neadkvatv%
Gui, Add, Text, x336 y137 w160 h20 , Неадекватное поведение в /v
Gui, Add, Hotkey, x16 y107 w60 h20 vprban, %prban%
Gui, Add, Text, x86 y107 w140 h20 , Реклама любого ресурса
Gui, Add, Hotkey, x16 y137 w60 h20 voskadmban, %oskadmban%
Gui, Add, Text, x86 y137 w160 h20 , Оскорбление администрации
Gui, Add, Hotkey, x16 y77 w60 h20 voskrodban, %oskrodban%
Gui, Add, Text, x86 y77 w110 h20 , Оскорбление родных
Gui, Add, Hotkey, x266 y77 w60 h20 voskproject, %oskproject%
Gui, Add, Text, x336 y77 w120 h20 , Оскорбление проекта
Gui, Add, Hotkey, x16 y47 w60 h20 cheatban, %cheatban%
Gui, Add, Text, x86 y47 w160 h20 , Использование чит-программ
Gui, Add, GroupBox, x16 y177 w550 h130 +Center, Примечание
Gui, Add, Text, x26 y197 w530 h30 , Хочу напомнить`, что банить за "Рекламу" нужно внимательно и осознанно`, т.к. иногда можно ошибиться
Gui, Add, Text, x26 y237 w530 h30 , За рекламу скайпа даётся мут`, а не бан. Банить за рекламу нужно в том случае`, если человек рекламирует канал/сервер/группу в вк и т.д.
Gui, Add, Text, x238 y277 w100 h20 , Будьте бдительны
Gui, Tab, Дополнительно
Gui, Add, GroupBox, x296 y157 w270 h90 +Center, Настройки /Duty
Gui, Add, Edit, x306 y177 w30 h20 vDuty, %Duty%
Gui, Add, Text, x356 y177 w120 h20 , ID скина на дежурстве
Gui, Add, Hotkey, x306 y207 w40 h20 vbduty, %bduty%
Gui, Add, Text, x356 y207 w130 h20 , Заступить на дежурство
Gui, Add, GroupBox, x296 y37 w270 h110 +Center, Полезные функции
Gui, Add, CheckBox, x306 y57 w20 h20 vaduty Checked%aduty%, 
Gui, Add, Text, x336 y57 w210 h20 , Автоматически заступать на дежурство
Gui, Add, CheckBox, x306 y87 w20 h20 vconoff Checked%conoff%, 
Gui, Add, Text, x336 y87 w130 h20 , Автоматический /conoff
Gui, Add, CheckBox, x306 y117 w20 h20 vfon Checked%fon%, 
Gui, Add, Text, x336 y117 w200 h20 , Включить все прослушки (+3 уровень)
Gui, Tab, Дополнительно
Gui, Font, Comic Sans, 
Gui, Add, Button, x26 y47 w240 h50 gBinderTogether, Биндер
Gui, Add, Button, x26 y107 w240 h50 gLink, Тема на форуме
Gui, Add, Button, x26 y167 w240 h50 , Список команд
Gui, Add, Text, x96 y247 w110 h20 , Version 1.1.00
Gui, Font, , 
Gui, Tab, Дополнительно
Gui, Add, GroupBox, x296 y257 w270 h50 +Center, Связь с разработчиками:
Gui, Add, Text, x376 y277 w100 h20 +Center, Together - mc5065
; Generated using SmartGUI Creator 4.0
Gui, Show, x428 y149 h354 w582, AHK Monser Gang War
}

ReadSettings:
{
    IniRead, recon, %DIRSET%, Options, recon
    IniRead, norecon, %DIRSET%, Options, norecon
    IniRead, yesrecon, %DIRSET%, Options, yesrecpn
    IniRead, leader, %DIRSET%, Options, leader
    IniRead, armor, %DIRSET%, Options, armor
    IniRead, buyadm, %DIRSET%, Options, buyadm
    IniRead, rifa, %DIRSET%, Options, rifa
    IniRead, vip, %DIRSET%, Options, vip
    IniRead, gwdm, %DIRSET%, Options, gwdm
    IniRead, duel, %DIRSET%, Options, duel
    IniRead, lc, %DIRSET%, Options, lc
    IniRead, gg, %DIRSET%, Options, gg
    IniRead, forum, %DIRSET%, Options, acc ; Репорты
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
    IniRead, trolladm, %DIRSET%, Options, trolladm ; Муты
    IniRead, db, %DIRSET%, Options, db
    IniRead, tk, %DIRSET%, Options, tk
    IniRead, spawn, %DIRSET%, Options, spawn
    IniRead, nickosk, %DIRSET%, Options, nickosk
    IniRead, capturekick, %DIRSET%, Options, capturekick
    IniRead, cheatkick, %DIRSET%, Options, cheatkick ; Кики
    IniRead, cheatkpz, %DIRSET%, Options, cheatkpz
    IniRead, bagouse, %DIRSET%, Options, bagouse
    IniRead, capturekpz, %DIRSET%, Options, capturekpz ; КПЗ
    IniRead, osknick, %DIRSET%, Options, osknick
    IniRead, falseadm, %DIRSET%, Options, falseadm
    IniRead, neadkvatv, %DIRSET%, Options, neadkvatv
    IniRead, prban, %DIRSET%, Options, prban
    IniRead, oskadmban, %DIRSET%, Options, oskadmban
    IniRead, oskrodban, %DIRSET%, Options, oskrodban
    IniRead, oskproject, %DIRSET%, Options, oskproject
    IniRead, cheatban, %DIRSET%, Options, cheatban ; Баны
    IniRead, Duty, %DIRSET%, Options, Duty
    IniRead, bduty, %DIRSET%, Options, bduty
    IniRead, aduty, %DIRSET%, Options, aduty
    IniRead, conoff, %DIRSET%, Options, conoff
    IniRead, fon, %DIRSET%, Options, fon
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
        if rec !=
        {
            Hotkey, ~%recon%, Button1
        }
          if norec !=
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
          if offtoprep !=
        {
            Hotkey, ~%offtoprep%, button17
        }
          if mat !=
        {
            Hotkey, ~%mat%, button18
        }
          if osk !=
        {
            Hotkey, ~%osk%, button19
        }
           if muterod !=
        {
            Hotkey, ~%muterod%, button20
        }
           if offtopo !=
        {
            Hotkey, ~%offtopo%, button21
        }
           if neadekvat !=
        {
            Hotkey, ~%neadekvat%, button22
        }
           if oskadm !=
        {
            Hotkey, ~%oskadm%, button23
        }
           if neyvaj !=
        {
            Hotkey, ~%neyvaj%, button24
        }
           if kleveta !=
        {
            Hotkey, ~%kleveta%, button25
        }
           if natsia !=
        {
            Hotkey, ~%natsia%, button26
        }
           if movieadm !=
        {
            Hotkey, ~%movieadm%, button27
        }
           if trolladm !=
        {
            Hotkey, ~%trolladm%, button28
        }
           if db !=
        {
            Hotkey, ~%db%, button29
        }
           if tk !=
        {
            Hotkey, ~%tk%, button30
        }
           if spawn !=
        {
            Hotkey, ~%spawn%, button31
        }
           if nickosk !=
        {
            Hotkey, ~%nickosk%, button32
        }
           if capturekick !=
        {
            Hotkey, ~%capturekick%, button33
        }
           if cheatkick !=
        {
            Hotkey, ~%cheatkick%, button34
        }
           if cheatkpz !=
        {
            Hotkey, ~%cheatkpz%, button35
        }
           if bagouse !=
        {
            Hotkey, ~%bagouse%, button36
        }
           if capturekpz !=
        {
            Hotkey, ~%capturekpz%, button37
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
           if bduty !=
        {
            Hotkey, ~%bduty%, button47
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
    }
    return
}

;Button's
Button1:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  Работаю по вашей жалобе{LEFT 25}
    return
}
Button2:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  Нарушений не выявлено{LEFT 23}
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
    SendInput, {f6}/pm  Он выпадает с убитых на Gang War{LEFT 34}
    return
}
Button6:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  Админ-права покупаются на monser.ru/buy{LEFT 41}
    return
}
Button7:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  Rifa - банда в San-Fierro{LEFT 27}
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
    SendInput, {f6}/pm  Создается только с VIP, командой - /loc{LEFT 40}
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
    SendInput, {f6}/pm  Напишите в тех. раздел на форуме - forum.monser.ru{LEFT 51}
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
    SendInput, {f6}/mute  15 Оскорбление игроков{LEFT 23}
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
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/kick  TeamKill{LEFT 9}
    return
}
Button32:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/kick  Помеха проходу/спавну{LEFT 22}
    return
}
Button33:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/skick  Оскорбление в нике{LEFT 19}
    return
}
Button34:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/kick  Неправильный /capture{LEFT 22}
    return
}
Button35:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/kick  Cheat{LEFT 6}
    return
}
Button36:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/jail  60 Cheat{LEFT 9}
    return
}
Button37:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/jail  20 Багоюз{LEFT 10}
    return
}
Button38:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/jail  10 Неправильный /capture{LEFT 25}
    return
}
Button39:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  30 Оскорбление в нике{LEFT 22}
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
    SendInput, {f6}/cban  30 90 Реклама{LEFT 14}
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
    SendInput, {f6}/cban  30 90 Оскорбление проекта{LEFT 26}
    return
}
Button46:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/cban  30 5 Cheat{LEFT 11}
    return
}
Button47:
{
    Sendchat("/Duty " Duty)
    return
}
;Биндер
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




;Save
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
    IniWrite, %forum%, %DIRSET%, Options, acc ; Репорты
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
    IniWrite, %trolladm%, %DIRSET%, Options, trolladm ; Муты
    IniWrite, %db%, %DIRSET%, Options, db
    IniWrite, %tk%, %DIRSET%, Options, tk
    IniWrite, %spawn%, %DIRSET%, Options, spawn
    IniWrite, %nickosk%, %DIRSET%, Options, nickosk
    IniWrite, %capturekick%, %DIRSET%, Options, capturekick
    IniWrite, %cheatkick%, %DIRSET%, Options, cheatkick ; Кики
    IniWrite, %cheatkpz%, %DIRSET%, Options, cheatkpz
    IniWrite, %bagouse%, %DIRSET%, Options, bagouse
    IniWrite, %capturekpz%, %DIRSET%, Options, capturekpz ; КПЗ
    IniWrite, %osknick%, %DIRSET%, Options, osknick
    IniWrite, %falseadm%, %DIRSET%, Options, falseadm
    IniWrite, %neadkvatv%, %DIRSET%, Options, neadkvatv
    IniWrite, %prban%, %DIRSET%, Options, prban
    IniWrite, %oskadmban%, %DIRSET%, Options, oskadmban
    IniWrite, %oskrodban%, %DIRSET%, Options, oskrodban
    IniWrite, %oskproject%, %DIRSET%, Options, oskproject
    IniWrite, %cheatban%, %DIRSET%, Options, cheatban ; Баны
    IniWrite, %Duty%, %DIRSET%, Options, Duty
    IniWrite, %bduty%, %DIRSET%, Options, bduty
    IniWrite, %aduty%, %DIRSET%, Options, aduty
    IniWrite, %conoff%, %DIRSET%, Options, conoff
    IniWrite, %fon%, %DIRSET%, Options, fon
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
    Gosub, ReadSettings
    MsgBox, 64, Monser Gang War AHK, Сохранено!
    return
}

$~Enter::
sleep, 30
if (isInChat() = 0)
return
sleep 150
dwAddress := dwSAMP + 0x12D8F8
chatInput := readString(hGTA, dwAddress, 512)
writeString(hGTA, dwAddress, "")
if (chatInput="/ah")
{
    showDialog("0","{FFD700}Список команд", "{FFD700}/tabl {FFFFFF}- Таблица наказазаний`n{FFD700}/cc [ID] {FFFFFF}- Копировать ник по ID`n{FFD700}/setweather [0-255] {FFFFFF}- Изменить визуально погоду`n{FFD700}/gomp {FFFFFF}- Создать МП`n{FFD700}/gg {FFFFFF}- Пожелать приятной игры`n{FFD700}/itp [1-18] {FFFFFF}- Телепортироваться по меню телепорта`n{FFD700}/tplist {FFFFFF}- Меню телепорта", "Закрыть")
    return
}
    if (chatInput="/tabl")
    {
    showDialog("0", "{FFD700}Таблица наказаний", "{FFFF00}Выдача кика`n{FFFFFF}ДБ`nТК`nСК`nПомеха проходу/спавну`nОскорбление в нике`n{FFFF00}Выдача мута`n{FFFFFF}Флуд - 5-20 минут`nКапс - 5-20 минут`nРозжиг -60-180 минут`nРеклама любого ресурса - 60-180 минут`nТорговля - 40-60 минут`nОффтоп в репорт - 10-20 минут`nОбман администрации - 30-60 минут`nКлевета - 40-60 минут`nОскорбление проекта - 180 минут`nОскорбление игроков - 10-30 минут`nТроллинг администрации - 60-120 минут`nНеуважение к администрации - 60-120 минут`nОскорбление администрации - 180 минут`nОбсуждение действий Администрации - 120-180 минут`nКлевета на администратора - 60-120 минут`nУпоминание родных - 180 минут`nНеадекватное поведение ( Капс, Флуд, Оск ) 30 - 40 минут`nОффтоп в /o (  Передача, обмен, покупка, продажа аккаунтов  ) 40-60 минут`n{FFFF00}Выдача КПЗ`n{FFFFFF}Читы - 40-60 минут`nБагоюз - 10-20 минут`nКапт куском - 5-10 минут`n{FFFF00}Выдача блокировки аккаунта`n{FFFFFF}Оскорбление в нике - 20-30 дней`nОбман администрации - 5-10 дней`nНеадекватное поведение - 2-5 днeй.( Только за флуд в /v )`nРеклама любого ресурса - Бан на 30 дней + бан ип на 90 дней.`nОскорбление администрации - 30 дней`nОскорбление родных - 30 дней`nОскорбление проекта - Бан на 30 дней + бан ип на 90 дней`nЧиты - Бан на 30 дней + бан ип на 5 дней. ( Макрос -  бан ип на 2 дня )`n{FFFF00}Выдача блокировки IP адреса`n{FFFFFF}Неоднократное оскорбление в нике - 10 дней`nНеоднократное оскорбление родных - 10 дней`nНеоднократное оскорбление администраторов - 30 дней`nОскорбление проекта - 90 дней`n", "Закрыть")
    return
}
if (chatInput="/tplist")
    {
    showDialog("0","{FFD700}Меню телепортов", "{FFFAFA}1 - Админ интерьер (/aint)`n2 - {009900}Grove Street Gang`n{FFFAFA}3 - {800080}The Ballas Gang`n{FFFAFA}4 - {FFFF00}Los Santos Vagos`n{FFFAFA}5 - {00FFFF}Varios Los Aztecas`n{FFFAFA}6 - DM Zona`n7 - Liberty City`n8 - Прятки №1`n9 - Клуб Jizzy`n10 - Дерби`n11 - Каскадёрские трюки`n12 - Андромеда`n13 - Дом №1`n14 - Прятки №2`n15 - Дом №2`n16 - Дерби №2`n17 - Дом №3`n18 - Небоскреб LS`n", "Закрыть")
    return
    }
    if (chatInput="/tpc")
    {
        SendChat("/aint")
        Sleep 10
        SendChat("/tp 1")
        Sleep 10
        SendChat("/tpc")
        Return
    }
    if (chatInput="/setweather")
    {
    AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}/setweather [0-255]")
        Return
    }
    if chatInput contains /setweather
    {
        if RegExMatch(chatInput, "/setweather (.*)", setweather)
        {
            If  (setweather1<0)
            {
            AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}/setweather [0-255]")
            }
            Else
            {
                setWeather(setweather1)
            AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы сменили погоду на:`n{FFD700}"setweather1)
            }
        }
    }
        if chatInput contains /gomp
    {
        RegExMatch(chatInput, "/gomp (.*) (.*) (.*)", gomp)
        If (gomp3<0)
        {
        AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Используйте:`n{FFFFFF}/gomp [Ваш ID] ""Название МП"" [Кол-во участников]")
        AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Пример:`n{FFFFFF}/gomp 32 ""Дерби"" 30")
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
                    Sleep 1
                    SendChat("/tpks " idigroka1)
                    Sleep 1
                    nstroki+=1
                    i := i+1
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
        :?:/gompoff::
        {
            if vkl=1
            {
                vkl := 0
            AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Функция авто-телепорта принудительно остановлена.")
            }
            return
        }
    }
    if (chatInput="/gg")
    {
    Random, rand, 1, 5
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
        Sendchat("/msg Администрация желает Вам приятной игры и хорошего настроения")
        Sleep 3000
        Sendchat("/msg Наши ресурсы: Форум - forum.monser.ru | Группа Вконтакте: vk.com/monser_gangwar")
    }
    if rand=4
    {
        sendchat("/msg Репорт предназначен не для высказывания/выражения своих эмоций")
        Sleep, 3000
        sendchat("/msg В репорт задают вопросы по игровому моду, а так же жалуются на игроков")
        Sleep, 3000
        sendchat("/msg За оффтоп в репорт - Вы будете наказаны.")
        Sleep, 3000
        sendchat("/msg Администрация сервера Monser Gang War желает Вам Приятной игры :3")
    }
     if rand=5
    {
        Sendchat("/msg Есть вопрос по игровому моду? Увидели нарушителя? - /report")
    }
    return
}
 if chatInput contains /cc
    {
        RegExMatch(chatInput, "/cc (.*)", id)
        if (RegExMatch(chatInput, "/cc$") || RegExMatch(chatInput, "/cc $"))
    AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы не указали ID")
        Else
        {
            gNick := getPlayerNameById(id1)
            if(strlen(gNick) < 1)
            {
            addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Игрок не найден")
                return
            }
            gNick := RegExReplace(getPlayerNameById(id1), "^(\[DM\]|\[GW\]|\[TR\])*")
            ClipPutText(gNick)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Никнейм {FFD700}" gNick "{FFFFFF} скопирован.")
            return
        }
    }
    if (chatInput="/itp")
    {
    AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Используйте:`n{FFFFFF}/itp [1-18]")
    }
    if chatInput contains /itp
    {
        RegExMatch(chatInput, "/itp (.*)", atp)
        If (atp1=1)
    {
            SendChat("/aint")
            sleep 100
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Админ Зону")
    }
        If (atp1=2)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(2450.14, -1701.89, 1013.51, 2)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{009900}Grove Street Gang")
    }
        If (atp1=3)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-49.56, 1407.24, 1084.43, 8)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{CC00FF}The Ballas Gang")
    }
        If (atp1=4)
    {
            SendChat("/tpint 107")
            Sleep 1
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{FFCD00}Los Santos Vagos")
    }
        If (atp1=5)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(221.25, 1243.05, 1082.14, 2)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы к`n{00CCFF}Varios Los Aztecas")
    }
        If (atp1=6)
    {
            SendChat("/tpint 113")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}DM ZONE")
    }
        If (atp1=7)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-773.51, 499.55, 1376.57, 1)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Liberty City")
    }
        If (atp1=8)
    {
            SendChat(/aint)
            Sleep 100
            setCoordinates(2220.28, -1147.99, 1025.80, 15)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Прятки №1")
    }
        If (atp1=9)
    {
            SendChat("/tpint 100")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Клуб Jizzy")
    }
        If (atp1=10)
    {
            SendChat("/tpint 128")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Дерби")
    }
        If (atp1=11)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-1441.04, 1591.55, 1052.33,14)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Каскадерские трюки")
    }
        If (atp1=12)
    {
            Sleep 100
            setCoordinates(315.87, 1024.47, 1949.80, 9)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Андромеду")
        }
        If (atp1=13)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(234.08, 1069.97, 1084.19, 6)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Дом №1")
    }
        If (atp1=14)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(2526.17, -1309.49, 1031.42, 2)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Прятки №2")
        }
        If (atp1=15)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(2318.06, -1013.34, 1054.72, 9)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Дом №2")
    }
        If (atp1=16)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-1397.13, 1242.58, 1039.87, 16)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Дерби №2")
    }
        If (atp1=17)
    {
            SendChat("/tpint 19")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы в`n{FFD700}Дом №3")
    }
        If (atp1=18)
    {
            SendChat("/aint")
            Sleep 100
            SendChat("/tp 1")
            Sleep 100
            setCoordinates(1544.47, -1353.54, 329.47, 0)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}Вы были телепортированы на`n{FFD700}Небоскрёб")
    }
}
Return


Login:
{
    GetChatLine(0, alogin)
    IfInString, alogin, Для зачисления онлайна в статистику /ia необходимо заступить на дежурство (/duty)
    {
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
    }
    return
}

BinderTogether:
{
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
    Gui, 2:Add, Button, x203 y387 w110 h20 gSaveButton, Сохранить
    Gui, 2:Show, x388 y163 h416 w519, Binder by together

}
return

Link:
{
    Run http://forum.monser.ru/index.php/topic/6985-ahk-dlia-administratcii-update-09102017/
}
return


2GuiClose:
Gui, 2:Destroy
return

GuiClose:
Gui, 2:Destroy
ExitApp
return

