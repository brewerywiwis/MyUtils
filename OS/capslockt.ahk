global state := 0
global wait_time := 2000 ; 2 seconds (can adjust what you want)

CapsLock::
	EndTime := A_TickCount + wait_time
	While GetKeyState("CapsLock", "P"){
		if (A_TickCount >= EndTime and state = 0){
			state = 1
			SetCapsLockState % !GetKeyState("CapsLock", "T")	
		}
	}
	if (state = 0) {
		Send, {Alt Down}{Shift Down}{Shift Up}{Alt Up}
	}else{
		state = 0
	}
	Return