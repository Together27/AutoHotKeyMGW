#NoEnv
#SingleInstance force
#include samp.ahk
#IfWinActive GTA:SA:MP

DIR = %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Settings
FileCreateDir, %DIR%
DIRSET = %A_MyDocuments%\GTA San Andreas User Files\AutoHotKey MGW\Settings\options.ini

IfNotExist,%DIR%\*.ini
{
    SplashTextOn, , 60,Monser Gang War AHK,���������� ��������`n��� ��������� ������ ������...
    UrlDownloadToFile, https://www.dropbox.com/s/urpzy5kypr3jucv/options.ini?dl=1, %DIR%\options.ini
    SplashTextoff
}
settimer, Login, 100

;AutoHotKey for Monser Gang War by together.

;GUI
IfExist, %DIR%\options.ini
{
Gosub, ReadSettings
Gui, Add, Button, x214 y317 w150 h30 gSaveButton, ���������
Gui, Add, Tab, x6 y7 w580 h350 , �������|����|���� � ���|����|�������������
Gui, Tab, �������
Gui, Add, GroupBox, x16 y37 w270 h120 +Center, ������ �� �������
Gui, Add, Hotkey, x26 y67 w60 h20 vrecon, %recon%
Gui, Add, Text, x96 y67 w160 h20 , ������� �� ����� ������
Gui, Add, Hotkey, x26 y97 w60 h20 vnorecon, %norecon%
Gui, Add, Text, x96 y97 w140 h20 , ��������� �� ��������
Gui, Add, Hotkey, x26 y127 w60 h20 vyesrecon, %yesrecon%
Gui, Add, Text, x96 y127 w120 h20 , ������ ����� �������
Gui, Add, GroupBox, x16 y167 w540 h140 +Center, ����� ���������� �������
Gui, Add, Hotkey, x26 y187 w60 h20 vleader, %leader%
Gui, Add, Text, x96 y187 w120 h20 , ��� �������� �������?
Gui, Add, Hotkey, x26 y217 w60 h20 varmor, %armor%
Gui, Add, Text, x96 y217 w130 h20 , ��� ����� ����������?
Gui, Add, Hotkey, x26 y247 w60 h20 vbuyadm, %buyadm%
Gui, Add, Text, x96 y247 w110 h20 , ��� ������ �������?
Gui, Add, Hotkey, x26 y277 w60 h20 vrifa, %rifa%
Gui, Add, Text, x96 y277 w140 h20 , ������ ��� ����� "Rifa"?
Gui, Add, Hotkey, x256 y187 w60 h20 vvip, %vip%
Gui, Add, Text, x326 y187 w140 h20 , ����������� "VIP"?
Gui, Add, Hotkey, x256 y217 w60 h20 vgwdm, %gwdm%
Gui, Add, Text, x326 y217 w140 h20 , ��� ������� �� GW/DM ?
Gui, Add, Hotkey, x256 y247 w60 h20 vduel, %duel%
Gui, Add, Text, x326 y247 w160 h20 , ��� ������� ������ �� �����?
Gui, Add, Hotkey, x256 y277 w60 h20 vlc, %lc%
Gui, Add, Text, x326 y277 w210 h20 , ��� ������� ���� ������ �������? (/lc)
Gui, Add, GroupBox, x296 y37 w260 h120 +Center +, ������
Gui, Add, Hotkey, x306 y67 w60 h20 vgg, %gg%
Gui, Add, Text, x376 y67 w140 h20 , �������� �������� ����
Gui, Add, Hotkey, x306 y97 w60 h20 vforum, %forum%
Gui, Add, Text, x376 y97 w170 h20 , ��������� �� ����� ������ ��
Gui, Add, Hotkey, x306 y127 w60 h20 vacc, %acc%
Gui, Add, Text, x376 y127 w170 h20 , ��� ������������ �������?
Gui, Tab, ����
Gui, Add, Hotkey, x16 y47 w60 h20 vflood, %flood%
Gui, Add, Text, x86 y47 w30 h20 , Flood
Gui, Add, Hotkey, x16 y77 w60 h20 vcaps, %caps%
Gui, Add, Text, x86 y77 w60 h20 , Caps Lock
Gui, Add, Hotkey, x16 y107 w60 h20 vpr, %pr%
Gui, Add, Text, x86 y107 w140 h20 , ������� (������/�������)
Gui, Add, Hotkey, x16 y137 w60 h20 vbuy, %buy%
Gui, Add, Text, x86 y137 w50 h20 , ��������
Gui, Add, Hotkey, x16 y167 w60 h20 vofftoprep, %offtoprep%
Gui, Add, Text, x86 y167 w80 h20 , Offtop � ������
Gui, Add, Hotkey, x16 y197 w60 h20 vmat, %mat%
Gui, Add, Text, x86 y197 w70 h20 , ��� � ������
Gui, Add, Hotkey, x16 y227 w60 h20 vosk, %osk%
Gui, Add, Text, x86 y227 w70 h20 , ���. �������
Gui, Add, Hotkey, x16 y257 w60 h20 vmuterod, %muterod%
Gui, Add, Text, x86 y257 w180 h20 , ����������/����������� ������
Gui, Add, Hotkey, x286 y257 w60 h20 vofftopo, %offtopo%
Gui, Add, Text, x356 y257 w60 h20 , Offtop � /o
Gui, Add, Hotkey, x286 y227 w60 h20 vneadekvat, %neadekvat%
Gui, Add, Text, x356 y227 w140 h20 , ������������ ���������
Gui, Add, Hotkey, x286 y197 w60 h20 voskadm, %oskadm%
Gui, Add, Text, x356 y197 w110 h20 , ���. �������������
Gui, Add, Hotkey, x286 y167 w60 h20 vneyvaj, %neyvaj%
Gui, Add, Text, x356 y167 w160 h20 , ���������� � �������������
Gui, Add, Hotkey, x286 y137 w60 h20 vkleveta, %kleveta%
Gui, Add, Text, x356 y137 w50 h20 , �������
Gui, Add, Hotkey, x286 y107 w60 h20 vnatsia, %natsia%
Gui, Add, Text, x356 y107 w180 h20 , ������ ���. ������������ �����
Gui, Add, Hotkey, x286 y77 w60 h20 vmovieadm, %movieadm%
Gui, Add, Text, x356 y77 w200 h20 , ���������� �������� �������������
Gui, Add, Hotkey, x286 y47 w60 h20 vtrolladm, %trolladm%
Gui, Add, Text, x356 y47 w140 h20 , �������� �������������
Gui, Tab, ���� � ���
Gui, Add, Hotkey, x26 y47 w60 h20 vdb, %db%
Gui, Add, Text, x96 y47 w70 h20 , DriveBy (DB)
Gui, Add, Hotkey, x26 y77 w60 h20 vtk, %tk%
Gui, Add, Text, x96 y77 w70 h20 , Team Kill (TK)
Gui, Add, Hotkey, x26 y107 w60 h20 vspawn, %spawn%
Gui, Add, Text, x96 y107 w130 h20 , ������ �������/������
Gui, Add, Hotkey, x26 y137 w60 h20 vnickosk, %nickosk%
Gui, Add, Text, x96 y137 w110 h20 , ����������� � ����
Gui, Add, Hotkey, x26 y167 w60 h20 vcapturekick, %capturekick%
Gui, Add, Text, x96 y167 w130 h20 , ������������ /capture
Gui, Add, Hotkey, x26 y197 w60 h20 vcheatkick, %cheatkick%
Gui, Add, Text, x96 y197 w160 h20 , ������������� ���-��������
Gui, Add, GroupBox, x266 y27 w290 h200 +Center, ����������
Gui, Add, Text, x276 y47 w270 h40 , ���� �� ������� ������������ ������������� +2 ������ � ����`, �� ����� ������ �� ����� ������� ���:
Gui, Add, Text, x276 y97 w270 h30 , ������������ /capture (+2 ������� ����� ������ ���)
Gui, Add, Text, x276 y137 w260 h30 , ����������� � ���� (+3 ������� ����� �������� ������� ������)
Gui, Add, Text, x276 y177 w260 h30 , ������������� ���-�������� (+2 ������� ����� ���� ���`, ���� +3 ��������)
Gui, Add, GroupBox, x16 y27 w240 h200 +Center, ����
Gui, Add, GroupBox, x16 y237 w550 h60 +Center, ���
Gui, Add, Hotkey, x26 y257 w50 h20 vcheatkpz, %cheatkpz%
Gui, Add, Text, x86 y257 w160 h20 , ������������� ���-��������
Gui, Add, Hotkey, x256 y257 w50 h20 vbagouse, %bagouse%
Gui, Add, Text, x316 y257 w40 h20 , ������
Gui, Add, Text, x426 y257 w130 h20 , ������������ /capture
Gui, Add, Hotkey, x366 y257 w50 h20 vcapturekpz, %capturekpz%
Gui, Tab, ����
Gui, Add, Hotkey, x266 y47 w60 h20 vosknick, %osknick%
Gui, Add, Text, x336 y47 w110 h20 , ����������� � ����
Gui, Add, Hotkey, x266 y107 w60 h20 vfalseadm, %falseadm%
Gui, Add, Text, x336 y107 w120 h20 , ����� �������������
Gui, Add, Hotkey, x266 y137 w60 h20 vneadekvatv, %neadkvatv%
Gui, Add, Text, x336 y137 w160 h20 , ������������ ��������� � /v
Gui, Add, Hotkey, x16 y107 w60 h20 vprban, %prban%
Gui, Add, Text, x86 y107 w140 h20 , ������� ������ �������
Gui, Add, Hotkey, x16 y137 w60 h20 voskadmban, %oskadmban%
Gui, Add, Text, x86 y137 w160 h20 , ����������� �������������
Gui, Add, Hotkey, x16 y77 w60 h20 voskrodban, %oskrodban%
Gui, Add, Text, x86 y77 w110 h20 , ����������� ������
Gui, Add, Hotkey, x266 y77 w60 h20 voskproject, %oskproject%
Gui, Add, Text, x336 y77 w120 h20 , ����������� �������
Gui, Add, Hotkey, x16 y47 w60 h20 cheatban, %cheatban%
Gui, Add, Text, x86 y47 w160 h20 , ������������� ���-��������
Gui, Add, GroupBox, x16 y177 w550 h130 +Center, ����������
Gui, Add, Text, x26 y197 w530 h30 , ���� ���������`, ��� ������ �� "�������" ����� ����������� � ���������`, �.�. ������ ����� ���������
Gui, Add, Text, x26 y237 w530 h30 , �� ������� ������ ����� ���`, � �� ���. ������ �� ������� ����� � ��� ������`, ���� ������� ����������� �����/������/������ � �� � �.�.
Gui, Add, Text, x238 y277 w100 h20 , ������ ���������
Gui, Tab, �������������
Gui, Add, GroupBox, x296 y157 w270 h90 +Center, ��������� /Duty
Gui, Add, Edit, x306 y177 w30 h20 vDuty, %Duty%
Gui, Add, Text, x356 y177 w120 h20 , ID ����� �� ���������
Gui, Add, Hotkey, x306 y207 w40 h20 vbduty, %bduty%
Gui, Add, Text, x356 y207 w130 h20 , ��������� �� ���������
Gui, Add, GroupBox, x296 y37 w270 h110 +Center, �������� �������
Gui, Add, CheckBox, x306 y57 w20 h20 vaduty Checked%aduty%, 
Gui, Add, Text, x336 y57 w210 h20 , ������������� ��������� �� ���������
Gui, Add, CheckBox, x306 y87 w20 h20 vconoff Checked%conoff%, 
Gui, Add, Text, x336 y87 w130 h20 , �������������� /conoff
Gui, Add, CheckBox, x306 y117 w20 h20 vfon Checked%fon%, 
Gui, Add, Text, x336 y117 w200 h20 , �������� ��� ��������� (+3 �������)
Gui, Tab, �������������
Gui, Font, Comic Sans, 
Gui, Add, Button, x26 y47 w240 h50 gBinderTogether, ������
Gui, Add, Button, x26 y107 w240 h50 gLink, ���� �� ������
Gui, Add, Button, x26 y167 w240 h50 , ������ ������
Gui, Add, Text, x96 y247 w110 h20 , Version 1.1.00
Gui, Font, , 
Gui, Tab, �������������
Gui, Add, GroupBox, x296 y257 w270 h50 +Center, ����� � ��������������:
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
    IniRead, forum, %DIRSET%, Options, acc ; �������
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
    IniRead, trolladm, %DIRSET%, Options, trolladm ; ����
    IniRead, db, %DIRSET%, Options, db
    IniRead, tk, %DIRSET%, Options, tk
    IniRead, spawn, %DIRSET%, Options, spawn
    IniRead, nickosk, %DIRSET%, Options, nickosk
    IniRead, capturekick, %DIRSET%, Options, capturekick
    IniRead, cheatkick, %DIRSET%, Options, cheatkick ; ����
    IniRead, cheatkpz, %DIRSET%, Options, cheatkpz
    IniRead, bagouse, %DIRSET%, Options, bagouse
    IniRead, capturekpz, %DIRSET%, Options, capturekpz ; ���
    IniRead, osknick, %DIRSET%, Options, osknick
    IniRead, falseadm, %DIRSET%, Options, falseadm
    IniRead, neadkvatv, %DIRSET%, Options, neadkvatv
    IniRead, prban, %DIRSET%, Options, prban
    IniRead, oskadmban, %DIRSET%, Options, oskadmban
    IniRead, oskrodban, %DIRSET%, Options, oskrodban
    IniRead, oskproject, %DIRSET%, Options, oskproject
    IniRead, cheatban, %DIRSET%, Options, cheatban ; ����
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
    SendInput, {f6}/pm  ������� �� ����� ������{LEFT 25}
    return
}
Button2:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  ��������� �� ��������{LEFT 23}
    return
}
Button3:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  ������ ����� �������{LEFT 21}
    return
}
Button4:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  �� ������ ������� ������ ������, ��� � �������� ������{LEFT 55}
    return
}
Button5:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  �� �������� � ������ �� Gang War{LEFT 34}
    return
}
Button6:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  �����-����� ���������� �� monser.ru/buy{LEFT 41}
    return
}
Button7:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  Rifa - ����� � San-Fierro{LEFT 27}
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
    SendInput, {f6}/pm  ������������ � ����� �� ������� �� /dm{LEFT 39}
    return
}
Button11:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  ��������� ������ � VIP, �������� - /loc{LEFT 40}
    return
}
Button12:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  �������� ���� �� Monser Gang War <3{LEFT 36}
    return
}
Button13:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  �������� � ���. ������ �� ������ - forum.monser.ru{LEFT 51}
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
    SendInput, {f6}/mute  120 �������{LEFT 12}
    return
}
Button17:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  50 ��������{LEFT 12}
    return
}
Button18:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  10 Offtop � /report{LEFT 20}
    return
}
Button19:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  20 ��� � /report{LEFT 17}
    return
}
Button20:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  15 ����������� �������{LEFT 23}
    return
}
Button21:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  180 ����������/����������� ������{LEFT 34}
    return
}
Button22:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  50 Offtop � /o{LEFT 15}
    return
}
Button23:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {F6}/mute  35 ������������ ���������{LEFT 26}
    return
}
Button24:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  180 ����������� �������������{LEFT 30}
    return
}
Button25:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  120 ���������� � �������������{LEFT 31}
    return
}
Button26:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  60 �������{LEFT 11}
    return
}
Button27:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  120 ���������� ������. �����{LEFT 29}
    return
}
Button28:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  150 ���������� �������� �������������{LEFT 38}
    return
}
Button29:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/mute  120 �������� �������������{LEFT 27}
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
    SendInput, {f6}/kick  ������ �������/������{LEFT 22}
    return
}
Button33:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/skick  ����������� � ����{LEFT 19}
    return
}
Button34:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/kick  ������������ /capture{LEFT 22}
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
    SendInput, {f6}/jail  20 ������{LEFT 10}
    return
}
Button38:
{
    SendMessage, 0x50,, 0x410419,, A
    SendInput, {f6}/jail  10 ������������ /capture{LEFT 25}
    return
}
Button39:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  30 ����������� � ����{LEFT 22}
    return
}
Button40:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  10 ����� �������������{LEFT 23}
    return
}
Button41:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  2 ������������ ��������� � /v{LEFT 30}
    return
}
Button42:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/cban  30 90 �������{LEFT 14}
    return
}
Button43:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  30 ����������� �������������{LEFT 29}
    return
}
Button44:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  30 ����������� ������{LEFT 22}
    return
}
Button45:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/cban  30 90 ����������� �������{LEFT 26}
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
;������
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
    IniWrite, %forum%, %DIRSET%, Options, acc ; �������
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
    IniWrite, %trolladm%, %DIRSET%, Options, trolladm ; ����
    IniWrite, %db%, %DIRSET%, Options, db
    IniWrite, %tk%, %DIRSET%, Options, tk
    IniWrite, %spawn%, %DIRSET%, Options, spawn
    IniWrite, %nickosk%, %DIRSET%, Options, nickosk
    IniWrite, %capturekick%, %DIRSET%, Options, capturekick
    IniWrite, %cheatkick%, %DIRSET%, Options, cheatkick ; ����
    IniWrite, %cheatkpz%, %DIRSET%, Options, cheatkpz
    IniWrite, %bagouse%, %DIRSET%, Options, bagouse
    IniWrite, %capturekpz%, %DIRSET%, Options, capturekpz ; ���
    IniWrite, %osknick%, %DIRSET%, Options, osknick
    IniWrite, %falseadm%, %DIRSET%, Options, falseadm
    IniWrite, %neadkvatv%, %DIRSET%, Options, neadkvatv
    IniWrite, %prban%, %DIRSET%, Options, prban
    IniWrite, %oskadmban%, %DIRSET%, Options, oskadmban
    IniWrite, %oskrodban%, %DIRSET%, Options, oskrodban
    IniWrite, %oskproject%, %DIRSET%, Options, oskproject
    IniWrite, %cheatban%, %DIRSET%, Options, cheatban ; ����
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
    MsgBox, 64, Monser Gang War AHK, ���������!
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
    showDialog("0","{FFD700}������ ������", "{FFD700}/tabl {FFFFFF}- ������� �����������`n{FFD700}/cc [ID] {FFFFFF}- ���������� ��� �� ID`n{FFD700}/setweather [0-255] {FFFFFF}- �������� ��������� ������`n{FFD700}/gomp {FFFFFF}- ������� ��`n{FFD700}/gg {FFFFFF}- �������� �������� ����`n{FFD700}/itp [1-18] {FFFFFF}- ����������������� �� ���� ���������`n{FFD700}/tplist {FFFFFF}- ���� ���������", "�������")
    return
}
    if (chatInput="/tabl")
    {
    showDialog("0", "{FFD700}������� ���������", "{FFFF00}������ ����`n{FFFFFF}��`n��`n��`n������ �������/������`n����������� � ����`n{FFFF00}������ ����`n{FFFFFF}���� - 5-20 �����`n���� - 5-20 �����`n������ -60-180 �����`n������� ������ ������� - 60-180 �����`n�������� - 40-60 �����`n������ � ������ - 10-20 �����`n����� ������������� - 30-60 �����`n������� - 40-60 �����`n����������� ������� - 180 �����`n����������� ������� - 10-30 �����`n�������� ������������� - 60-120 �����`n���������� � ������������� - 60-120 �����`n����������� ������������� - 180 �����`n���������� �������� ������������� - 120-180 �����`n������� �� �������������� - 60-120 �����`n���������� ������ - 180 �����`n������������ ��������� ( ����, ����, ��� ) 30 - 40 �����`n������ � /o (  ��������, �����, �������, ������� ���������  ) 40-60 �����`n{FFFF00}������ ���`n{FFFFFF}���� - 40-60 �����`n������ - 10-20 �����`n���� ������ - 5-10 �����`n{FFFF00}������ ���������� ��������`n{FFFFFF}����������� � ���� - 20-30 ����`n����� ������������� - 5-10 ����`n������������ ��������� - 2-5 ��e�.( ������ �� ���� � /v )`n������� ������ ������� - ��� �� 30 ���� + ��� �� �� 90 ����.`n����������� ������������� - 30 ����`n����������� ������ - 30 ����`n����������� ������� - ��� �� 30 ���� + ��� �� �� 90 ����`n���� - ��� �� 30 ���� + ��� �� �� 5 ����. ( ������ -  ��� �� �� 2 ��� )`n{FFFF00}������ ���������� IP ������`n{FFFFFF}������������� ����������� � ���� - 10 ����`n������������� ����������� ������ - 10 ����`n������������� ����������� ��������������� - 30 ����`n����������� ������� - 90 ����`n", "�������")
    return
}
if (chatInput="/tplist")
    {
    showDialog("0","{FFD700}���� ����������", "{FFFAFA}1 - ����� �������� (/aint)`n2 - {009900}Grove Street Gang`n{FFFAFA}3 - {800080}The Ballas Gang`n{FFFAFA}4 - {FFFF00}Los Santos Vagos`n{FFFAFA}5 - {00FFFF}Varios Los Aztecas`n{FFFAFA}6 - DM Zona`n7 - Liberty City`n8 - ������ �1`n9 - ���� Jizzy`n10 - �����`n11 - ����������� �����`n12 - ���������`n13 - ��� �1`n14 - ������ �2`n15 - ��� �2`n16 - ����� �2`n17 - ��� �3`n18 - ��������� LS`n", "�������")
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
            AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ������� ������ ��:`n{FFD700}"setweather1)
            }
        }
    }
        if chatInput contains /gomp
    {
        RegExMatch(chatInput, "/gomp (.*) (.*) (.*)", gomp)
        If (gomp3<0)
        {
        AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�����������:`n{FFFFFF}/gomp [��� ID] ""�������� ��"" [���-�� ����������]")
        AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}������:`n{FFFFFF}/gomp 32 ""�����"" 30")
        }
        Else
        {
            vkl := 1
            SendChat("/msg ��������� ������ ������ ������� ��: "gomp2)
            Sleep 3000
            SendChat("/msg ����� ���� ��� ��������������� - ����� � �����.")
            Sleep 3000
            SendChat("/msg ������������ ���������� ����������: "gomp3)
            Sleep 3000
            SendChat("/msg ���� ��������������� �� ����������� /sms " gomp1 " +")
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
            IfInString, stroka, SMS ��
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
                        SendChat("/msg ������� ������������ ���������� ����������. �������� �������.")
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
            AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}������� ����-��������� ������������� �����������.")
            }
            return
        }
    }
    if (chatInput="/gg")
    {
    Random, rand, 1, 5
    if rand=1
    {
        SendChat("/msg ������������� ������ ��� �������� ���� � �������� ����������")
        Sleep 3000
        SendChat("/msg �������� ����� ������ � ����: /play >> Monser FM")
    }
    if rand=2
    {
        SendChat("/msg ���� �� ������ �������� ���� ���� �� �����...")
        Sleep 3000
        SendChat("/msg �� ������ �������� ���: forum.monser.ru >> ����� >> ���� �������")
    }
    if rand=3
    {
        Sendchat("/msg ������������� ������ ��� �������� ���� � �������� ����������")
        Sleep 3000
        Sendchat("/msg ���� �������: ����� - forum.monser.ru | ������ ���������: vk.com/monser_gangwar")
    }
    if rand=4
    {
        sendchat("/msg ������ ������������ �� ��� ������������/��������� ����� ������")
        Sleep, 3000
        sendchat("/msg � ������ ������ ������� �� �������� ����, � ��� �� �������� �� �������")
        Sleep, 3000
        sendchat("/msg �� ������ � ������ - �� ������ ��������.")
        Sleep, 3000
        sendchat("/msg ������������� ������� Monser Gang War ������ ��� �������� ���� :3")
    }
     if rand=5
    {
        Sendchat("/msg ���� ������ �� �������� ����? ������� ����������? - /report")
    }
    return
}
 if chatInput contains /cc
    {
        RegExMatch(chatInput, "/cc (.*)", id)
        if (RegExMatch(chatInput, "/cc$") || RegExMatch(chatInput, "/cc $"))
    AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� �� ������� ID")
        Else
        {
            gNick := getPlayerNameById(id1)
            if(strlen(gNick) < 1)
            {
            addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}����� �� ������")
                return
            }
            gNick := RegExReplace(getPlayerNameById(id1), "^(\[DM\]|\[GW\]|\[TR\])*")
            ClipPutText(gNick)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}������� {FFD700}" gNick "{FFFFFF} ����������.")
            return
        }
    }
    if (chatInput="/itp")
    {
    AddChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�����������:`n{FFFFFF}/itp [1-18]")
    }
    if chatInput contains /itp
    {
        RegExMatch(chatInput, "/itp (.*)", atp)
        If (atp1=1)
    {
            SendChat("/aint")
            sleep 100
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}����� ����")
    }
        If (atp1=2)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(2450.14, -1701.89, 1013.51, 2)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{009900}Grove Street Gang")
    }
        If (atp1=3)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-49.56, 1407.24, 1084.43, 8)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{CC00FF}The Ballas Gang")
    }
        If (atp1=4)
    {
            SendChat("/tpint 107")
            Sleep 1
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFCD00}Los Santos Vagos")
    }
        If (atp1=5)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(221.25, 1243.05, 1082.14, 2)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{00CCFF}Varios Los Aztecas")
    }
        If (atp1=6)
    {
            SendChat("/tpint 113")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}DM ZONE")
    }
        If (atp1=7)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-773.51, 499.55, 1376.57, 1)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}Liberty City")
    }
        If (atp1=8)
    {
            SendChat(/aint)
            Sleep 100
            setCoordinates(2220.28, -1147.99, 1025.80, 15)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� ��`n{FFD700}������ �1")
    }
        If (atp1=9)
    {
            SendChat("/tpint 100")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}���� Jizzy")
    }
        If (atp1=10)
    {
            SendChat("/tpint 128")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� ��`n{FFD700}�����")
    }
        If (atp1=11)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-1441.04, 1591.55, 1052.33,14)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� ��`n{FFD700}������������ �����")
    }
        If (atp1=12)
    {
            Sleep 100
            setCoordinates(315.87, 1024.47, 1949.80, 9)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}���������")
        }
        If (atp1=13)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(234.08, 1069.97, 1084.19, 6)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}��� �1")
    }
        If (atp1=14)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(2526.17, -1309.49, 1031.42, 2)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� ��`n{FFD700}������ �2")
        }
        If (atp1=15)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(2318.06, -1013.34, 1054.72, 9)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}��� �2")
    }
        If (atp1=16)
    {
            SendChat("/aint")
            Sleep 100
            setCoordinates(-1397.13, 1242.58, 1039.87, 16)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� ��`n{FFD700}����� �2")
    }
        If (atp1=17)
    {
            SendChat("/tpint 19")
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� �`n{FFD700}��� �3")
    }
        If (atp1=18)
    {
            SendChat("/aint")
            Sleep 100
            SendChat("/tp 1")
            Sleep 100
            setCoordinates(1544.47, -1353.54, 329.47, 0)
        addChatMessageEx("FFD700", "{FFD700}[A]`n{FFFFFF}�� ���� ��������������� ��`n{FFD700}��������")
    }
}
Return


Login:
{
    GetChatLine(0, alogin)
    IfInString, alogin, ��� ���������� ������� � ���������� /ia ���������� ��������� �� ��������� (/duty)
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
    Gui, 2:Add, Text, x16 y7 w40 h20 , ������
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
    Gui, 2:Add, Text, x235 y7 w50 h20 +Center, �����
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
    Gui, 2:Add, Button, x203 y387 w110 h20 gSaveButton, ���������
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

