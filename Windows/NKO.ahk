; These shortcut keys use Shortcut Key Chords, meaning there are two parts
; to each combo. For example, the first one listed below is executed by
; pressing Windows+Z, and then the Z key again. The second is executed by
; pressing Windows+Z, and then the X key. The other combos follow suit.
; Under the "Powershell Snippets" section, you'll find combos that start
; with Windows+X instead of Windows+Z. This makes it easier to keep our
; custom key combos from interfering with the many standard ones that come
; with Windows or with programs we might be running.

; Misc strings
#z::
  Input,v,L1
    if (v="z") {
      ; Date in ISO-8601 format
      FormatTime, CurrentDate,, yyyy-MM-dd
      SendInput %CurrentDate%
      Return
    }
    if (v="x") {
      ; Time in 24 hour format
      FormatTime, CurrentTime,, HH:mm
      SendInput %CurrentTime%
      Return
    }
    if (v="c") {
      ; Day of the week
      FormatTime, CurrentDay,, dddd
      SendInput %CurrentDay%
      Return
    }
    if (v="v") {
      ; datetime line formatted for note taking
      FormatTime, CurrentDate,, yyyy-MM-dd
      FormatTime, CurrentTime,, HH:mm
      FormatTime, CurrentDay,, dddd
      SendInput %CurrentDate% (%CurrentDay%) %CurrentTime% -{Space}
      Return
    }
    if (v="h") {
      ; Hostname
      SendInput %A_ComputerName%
      Return
    }
    if (v="p") {
      ; Puts a random password on the CLIPBOARD
      ; You'll still need to paste it to see the output
      Length = 8
      Characters = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$`%^&*()_+-=
      Password = 
      Loop %Length% {
        Random, r, 1, % StrLen(Characters)
        Password .= SubStr(Characters, r, 1)
      }
      Clipboard := ""
      While (Clipboard != "")
      Sleep, 10
      Clipboard := Password
      Return
    }
    if (v="w") {
      ; Puts a random "word" on the CLIPBOARD
      ; You'll still need to paste it to see the output
      Length = 12
      Characters = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
      FakeWord = 
      Loop %Length% {
        Random, r, 1, % StrLen(Characters)
        FakeWord .= SubStr(Characters, r, 1)
      }
      Clipboard := ""
      While (Clipboard != "")
      Sleep, 10
      Clipboard := FakeWord
      Return
    }
    if (v="r") {
      ; Reload AHK
      Reload
      Return
    }
    if (v="u") {
      ; Outputs our home directory
      SendInput %USERPROFILE%
      Return
    }
	if (v="l") {
    ; Turns the clipboard contents to lowercase
		StringLower, Clipboard, Clipboard
		Clipboard := StrReplace(Clipboard, A_Space, "-")
		SendRaw %Clipboard%
	}
return

; powershell snippets
#x::
  Input,v,L1

    if (v="w") {
      ; Boiler-plate Where-Object statement
      SendInput Where-Object {{}$_.Name -like "**"
      SendRaw }
      Send {Left 3}
      Return
    }
    if (v="h") {
      ; Prints Powershell history. More sensible as a profile function but hey, here it is
      SendInput Get-History | Select-Object Id,Duration,StartExecutionTime,EndExecutionTime,CommandLine | sort -Property Duration -Descending | Format-Table
      Return
    }
    if (v="c") {
      ; Turn the current line into a "count" method call
      SendInput {HOME}({END}).count
      Return
    }
	if (v="(") {
      ; Encapsulate the current line in parentheses
      SendInput {HOME}({END}).
      Return
    }
	if (v="{") {
      ; Encapsulate the current line in braces
      SendInput {HOME}{{}{END}{}}
      Return
    }
return

StrPad(str, padchar, padlen, left=1){
 	if (i := padlen-StrLen(str))
		VarSetCapacity(w, i, asc(padchar)),  NumPut(0, &w+i, "Char"),  VarSetCapacity(w, -1)
	return left ? w str : str w
}

; Windows + Shift + z, a good shortcut for testing AHK commands
#+z::
; put test commands here
	StringLower, Clipboard, Clipboard
	Clipboard := StrReplace(Clipboard, A_Space, "-")
	SendRaw %Clipboard%
Return

; Windows + Shift + m, mute Microsoft Teams video calls
; https://www.lprp.fr/2020/03/keyboard-shortcut-to-mute-teams-with-autohotkey/
#+m::
	#HotkeyInterval 200
	WinGet, active_id, ID, A
	WinActivate, ahk_exe Teams.exe
	Send ^+m
	WinActivate, ahk_id %active_id%
	SoundBeep, 200, 100
Return
