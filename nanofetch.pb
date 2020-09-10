; 
; nanofetch - A native screenfetch for Windows
; Copyright (c) 2020 spect
; 
; This program is free software: you can redistribute it And/Or modify  
; it under the terms of the GNU General Public License As published by  
; the Free Software Foundation, version 3.
;
; This program is distributed in the hope that it will be useful, but 
; WITHOUT ANY WARRANTY; without even the implied warranty of 
; MERCHANTABILITY Or FITNESS For A PARTICULAR PURPOSE. See the GNU 
; General Public License For more details.
;
; You should have received a copy of the GNU General Public License 
; along With this program. If Not, see <http://www.gnu.org/licenses/>.
;
; BASIC ROCKS! :-)
;

; Custom OS Constants
#PB_WIN_95_98_2K = 0
#PB_WIN_XP_VISTA_7_2008 = 1
#PB_WIN_8_81_10_2012 = 2

;Color Constants
#PB_BLACK = 0
#PB_DARKBLUE = 1
#PB_BLUE = 3
#PB_MAGENTA = 5
#PB_GREY = 7
#PB_RED = 12
#PB_GREEN = 10
#PB_YELLOW = 14
#PB_WHITE = 15

Global currentOS.b
Global OSName.s
Global freeSpace.s
Global diskSize.s

Global conSize.SMALL_RECT
  conSize\left = 0
  conSize\top = 0
  conSize\right = 100
  conSize\bottom = 100

Select OSVersion()

    Case #PB_OS_Windows_2000
      currentOS = #PB_WIN_95_98_2K
      OSName = "Microsoft Windows 2000"

    Case #PB_OS_Windows_XP
      currentOS = #PB_WIN_XP_VISTA_7_2008
      OSName = "Microsoft Windows XP"
      
    Case #PB_OS_Windows_Server_2003
      currentOS = #PB_WIN_XP_VISTA_7_2008
      OSName = "Microsoft Windows Server 2003"
      
    Case #PB_OS_Windows_Vista
      currentOS = #PB_WIN_XP_VISTA_7_2008
      OSName = "Microsoft Windows Vista"
      
    Case #PB_OS_Windows_7
      currentOS = #PB_WIN_XP_VISTA_7_2008
      OSName = "Microsoft Windows 7"
      
    Case #PB_OS_Windows_Server_2008
      currentOS = #PB_WIN_XP_VISTA_7_2008
      OSName = "Microsoft Windows Server 2008"
      
    Case #PB_OS_Windows_Server_2008_R2
      currentOS = #PB_WIN_XP_VISTA_7_2008
      OSName = "Microsoft Windows Server 2008 R2"
      
    Case #PB_OS_Windows_8
      currentOS = #PB_WIN_8_81_10_2012
      OSName = "Microsoft Windows 8"
      
    Case #PB_OS_Windows_8_1 
      currentOS = #PB_WIN_8_81_10_2012
      OSName = "Microsoft Windows 8.1"
      
    Case #PB_OS_Windows_Server_2012
      currentOS = #PB_WIN_8_81_10_2012
      OSName = "Microsoft Windows Server 2012"
      
    Case #PB_OS_Windows_Server_2012_R2
      currentOS = #PB_WIN_8_81_10_2012
      OSName = "Microsoft Windows Server 2012 R2"
      
    Case #PB_OS_Windows_10
      currentOS = #PB_WIN_8_81_10_2012
      OSName = "Microsoft Windows 10"

    Default
      Debug(OSVersion())
EndSelect

Dim winart2k.s(15)
 winart2k(0) = "`"
 winart2k(1) = "      `. .`"
 winart2k(2) = "     .` `.```"
 winart2k(3) = "     ` .- `::`---"
 winart2k(4) = "       ```-. .:-.://.  -:::::-  .`"
 winart2k(5) = "  `      ...-/:.-::.  -//////` .ss+/."
 winart2k(6) = "  -```      ...://:  .//////. .osssss."
 winart2k(7) = "`.  -:```      ```  `://///- `osssss/"
 winart2k(8) = "`.`-. -/:.--`       ```````  :ossss+"
 winart2k(9) = "  `.`.-.`/+/-///` `/++++/.  .``.-++`"
 winart2k(10) = "    `//./+/.+++.  /ooooo+` +hhs/.. `"
 winart2k(11) = "       .::-+oo-  :oooooo` :dddddh`"
 winart2k(12) = "          .-..  .++++oo. -dddddd:"
 winart2k(13) = "                    ```  +ydddd/"
 winart2k(14) = "                          `./yo"

Dim winart7.s(15)
  winart7(0) = "       ,.=:^!^!t3Z3z.,"
  winart7(1) = "       :tt:::tt333EE3"
  winart7(2) = "       Et:::ztt33EEE  @Ee.,      ..,"
  winart7(3) = "      ;tt:::tt333EE7  ;EEEEEEttttt33#"
  winart7(4) = "     :Et:::zt333EEQ.  SEEEEEttttt33QL"
  winart7(5) = "     it::::tt333EEF @EEEEEEttttt33F"
  winart7(6) = "    ;3=*^```'*4EEV :EEEEEEttttt33@."
  winart7(7) = "    ,.=::::it=., ` @EEEEEEtttz33QF"
  winart7(8) = "   ;::::::::zt33)    '4EEEtttji3P*"
  winart7(9) = "   :t::::::::tt33.:Z3z..  `` ,..g."
  winart7(10) = "  i::::::::zt33F AEEEtttt::::ztF"
  winart7(11) = " ;:::::::::t33V  ;EEEttttt::::t3"
  winart7(12) = " E::::::::zt33L  @EEEtttt::::z3F"
  winart7(13) = " {3=*^```'*4E3) ;EEEtttt:::::tZ`"
  winart7(14) = "             ` :EEEEtttt::::z7"
  winart7(15) = "                 'VEzjt:;;z>*`"

Dim winart10.s(15)
  winart10(0) = "                           ....::::"
  winart10(1) = "                   ....::::::::::::"
  winart10(2) = "          ....:::: ::::::::::::::::"
  winart10(3) = "  ....:::::::::::: ::::::::::::::::"
  winart10(4) = "  :::::::::::::::: ::::::::::::::::"
  winart10(5) = "  :::::::::::::::: ::::::::::::::::"
  winart10(6) = "  :::::::::::::::: ::::::::::::::::"
  winart10(7) = "  :::::::::::::::: ::::::::::::::::"
  winart10(8) = "  ................ ................"
  winart10(9) = "  :::::::::::::::: ::::::::::::::::"
  winart10(10) = "  :::::::::::::::: ::::::::::::::::"
  winart10(11) = "  :::::::::::::::: ::::::::::::::::"
  winart10(12) = "  '''':::::::::::: ::::::::::::::::"
  winart10(13) = "          '''':::: ::::::::::::::::"
  winart10(14) = "                   ''''::::::::::::"
  winart10(15) = "                           ''''::::"

; Get host info
Procedure.s getHostInfo()
  cmd = RunProgram("cmd", "/c wmic baseboard get manufacturer", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        manufacturer$ + ReadProgramString(cmd)
      EndIf
    Wend
    manufacturer$ = RemoveString(manufacturer$, "Manufacturer           ", #PB_String_NoCase)
    manufacturer$ = RemoveString(manufacturer$, "  ", #PB_String_NoCase)
  EndIf
  CloseProgram(cmd)
  
  ProcedureReturn manufacturer$
EndProcedure

; Get motherboard info
Procedure.s getMotherboardInfo()
  cmd = RunProgram("cmd", "/c wmic baseboard get product", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        model$ + ReadProgramString(cmd)
      EndIf
    Wend
  EndIf
  model$ = RemoveString(model$, "Product               ", #PB_String_NoCase)
  model$ = RemoveString(model$, "  ", #PB_String_NoCase)
  CloseProgram(cmd)

  ProcedureReturn model$
EndProcedure

; Get BIOS info
Procedure.s getBIOSInfo()
  cmd = RunProgram("cmd", "/c wmic bios get manufacturer", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        bios$ + ReadProgramString(cmd)
      EndIf
    Wend
  EndIf
  CloseProgram(cmd)
  bios$ = RemoveString(bios$, "Manufacturer              ", #PB_String_NoCase)
  bios$ = RemoveString(bios$, "  ", #PB_String_NoCase)
  
  ProcedureReturn bios$
EndProcedure

; Get build info  
Procedure.s getKernelInfo()
  cmd = RunProgram("cmd", "/c wmic os get version", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        kernelVersion$ + ReadProgramString(cmd)
      EndIf
    Wend
    kernelVersion$ = RemoveString(kernelVersion$, "Version   ", #PB_String_NoCase)
    kernelVersion$ = RemoveString(kernelVersion$, "  ", #PB_String_NoCase)
  EndIf
  CloseProgram(cmd)
  
  ProcedureReturn kernelVersion$
EndProcedure

; Get the CPU Architecture
Procedure checkAddressWidth()
  cmd = RunProgram("cmd", "/c wmic cpu get AddressWidth", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        addressWidth$ + ReadProgramString(cmd)
      EndIf
    Wend
  EndIf
  ;Debug(addressWidth$)
  CloseProgram(cmd)
  If CountString(addressWidth$, "64") > 0
    ProcedureReturn 64
  Else
    ProcedureReturn 86
  EndIf
EndProcedure

; Get current GPU
Procedure.s getCurrentGPU()
  cmd = RunProgram("cmd", "/c  wmic path Win32_VideoController get Caption", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        currentGPU$ + ReadProgramString(cmd)
      EndIf
    Wend
    currentGPU$ = RemoveString(currentGPU$, "Caption                 ", #PB_String_NoCase)
    currentGPU$ = RemoveString(currentGPU$, "  ", #PB_String_NoCase)
  EndIf
  CloseProgram(cmd)
  ProcedureReturn currentGPU$
EndProcedure

getCurrentGPU()
  

; Get the HDD size & space
Procedure getHDDSize()
  ; Get free space
  cmd = RunProgram("cmd", "/c wmic volume get freespace", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    incr = 0
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        If incr < 2
          freeSpace + ReadProgramString(cmd)
        EndIf
        If incr > 2
          Break
        EndIf
        incr + 1
      EndIf
    Wend
  EndIf
  CloseProgram(cmd)
  freeSpace = RemoveString(freeSpace, "FreeSpace     ", #PB_String_NoCase)
  ;Debug(Val(freeSpace) / 1073741824)
  
  ; Get HDD size
  cmd = RunProgram("cmd", "/c wmic volume get capacity", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    incr = 0
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        If incr < 2
          diskSize + ReadProgramString(cmd)
        EndIf
        If incr > 2
          Break
        EndIf
        incr + 1
      EndIf
    Wend
  EndIf
  CloseProgram(cmd)
  diskSize = RemoveString(diskSize, "Capacity     ", #PB_String_NoCase)
  ;Debug(Val(diskSize) / 1073741824)
EndProcedure

; Expand the cmd console
Procedure extendOurConsole()
  OpenConsole()
  wHnd.l = GetStdHandle_(#STD_OUTPUT_HANDLE)
  ConsoleTitle("nanofetch")
  SetConsoleWindowInfo_(wHnd, 1, @conSize)
  EnableGraphicalConsole(1)
  ClearConsole()
  PrintN("")
EndProcedure

; Get our max and available RAM
Procedure getAvailableRAM()
  ProcedureReturn MemoryStatus(#PB_System_FreePhysical)
EndProcedure

Procedure getTotalRAM()
  ProcedureReturn MemoryStatus(#PB_System_TotalPhysical)
EndProcedure

; Get the system uptime
Procedure.s getUptime()
  uptime.f = GetTickCount_() ;gets the system uptime in miliseconds
  ;determine hours
  upth.f = uptime/3600000
  ;determine minutes 
  rmnd.f = upth - Round(upth,0)
  uptm.f = rmnd*60
  ;determine seconds
  rmnd = uptm - Round(uptm,0)
  upts.f = rmnd*60
  ;determine miliseconds 
  rmnd = upts - Round(upts,0)
  uptms.f = rmnd*1000
  ;Format the string to H:M:S.MS
  sysuptime.s = Str(upth) + "h " + Str(uptm) + "m"
  ProcedureReturn sysuptime
EndProcedure

; Get amount of running processes
Procedure.s getCurrentRunningProcesses()
  cmd = RunProgram("cmd", "/c tasklist | find /c /v " + #DQUOTE$ + #DQUOTE$, "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        runningProcesses$ + ReadProgramString(cmd)
      EndIf
    Wend
  EndIf
  CloseProgram(cmd)
  
  ProcedureReturn runningProcesses$
EndProcedure

getCurrentRunningProcesses()

; Get the current screen resolution
Procedure.s getScreenRes()
  ; Get width
  cmd = RunProgram("cmd", "/c wmic desktopmonitor get screenwidth", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        currentResWidth$ + ReadProgramString(cmd)
      EndIf
    Wend
    currentResWidth$ = RemoveString(currentResWidth$, "ScreenWidth  ", #PB_String_NoCase)
    currentResWidth$ = RemoveString(currentResWidth$, "         ", #PB_String_NoCase)
  EndIf
  CloseProgram(cmd)
  
  ; Get height
  cmd = RunProgram("cmd", "/c wmic desktopmonitor get screenheight", "", #PB_Program_Open | #PB_Program_Read | #PB_Program_Hide)
  If cmd
    While ProgramRunning(cmd)
      If AvailableProgramOutput(cmd)
        currentResHeight$ + ReadProgramString(cmd)
      EndIf
    Wend
  EndIf
  currentResHeight$ = RemoveString(currentResHeight$, "ScreenHeight  ", #PB_String_NoCase)
  currentResHeight$ = RemoveString(currentResHeight$, "          ", #PB_String_NoCase)
  CloseProgram(cmd)
  
  ProcedureReturn currentResWidth$ + " X " + currentResHeight$
EndProcedure

extendOurConsole()

; Windows 95, 98, 2000
If currentOS = #PB_WIN_95_98_2K
  For i = 0 To 15
    Select i
      Case 0
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        PrintN(winart2k(i))
        
      Case 1
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        PrintN(winart2k(i))
        
      Case 2
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        PrintN(winart2k(i))
        
      Case 3
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        PrintN(winart2k(i))
        
      Case 4
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        PrintN(winart2k(i))
        
      Case 5
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        For z = 0 To 44
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 46 To 58
          ConsoleColor(#PB_RED, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 60 To 70
          ConsoleColor(#PB_GREEN, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 72 To 74
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
          
      Case 6
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        For z = 0 To 42
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 44 To 58
          ConsoleColor(#PB_RED, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 60 To 72
          ConsoleColor(#PB_GREEN, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 74 To 76
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        
      Case 7
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        For z = 0 To 42
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 44 To 56
          ConsoleColor(#PB_RED, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 58 To 70
          ConsoleColor(#pb_GREEN, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 72 To 74
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        
      Case 8
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        For z = 0 To 42
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 44 To 54
          ConsoleColor(#PB_RED, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 56 To 68
          ConsoleColor(#PB_GREEN, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 70 To 72
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        
      Case 9
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        For z = 0 To 38
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 40 To 54
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 56 To 68
          ConsoleColor(#PB_YELLOW, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 70 To 72
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        
      Case 10
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        For z = 0 To 36
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 38 To 52
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 54 To 66
          ConsoleColor(#PB_YELLOW, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 68 To 70
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        
      Case 11
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        For z = 0 To 34
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 36 To 48
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 50 To 64
          ConsoleColor(#PB_YELLOW, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 66 To 68
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        
      Case 12
        PrintN("")
        ConsoleColor(#pb_white, #PB_BLACK)
        For z = 0 To 34
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 36 To 46
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 48 To 62
          ConsoleColor(#PB_YELLOW, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        For z = 64 To 66
          ConsoleColor(#PB_WHITE, #PB_BLACK)
          Print(PeekS(@winart2k(i) + z, 1, #PB_UTF8))
        Next
        
      Case 13
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        Print(winart2k(i))
        
      Case 14
        PrintN("")
        ConsoleColor(#PB_WHITE, #PB_BLACK)
        Print(winart2k(i))
    EndSelect
  Next
; Windows XP, Vista, 7
ElseIf currentOS = #PB_WIN_XP_VISTA_7_2008
  For i = 0 To 15
    Select i
        Case 0
          ConsoleColor(#PB_RED, #PB_BLACK)
          PrintN(winart7(i))
          
        Case 1
          ConsoleColor(#PB_RED, #PB_BLACK)
          PrintN(winart7(i))
          
        Case 2
          ConsoleColor(#PB_RED, #PB_BLACK)
          For z = 0 To 40
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 40 To 70
            ConsoleColor(#PB_GREEN, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 3
          PrintN("")
          ConsoleColor(#PB_RED, #PB_BLACK)
          For z = 0 To 39
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 39 To 72
            ConsoleColor(#PB_GREEN, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 4
          PrintN("")
          ConsoleColor(#PB_RED, #PB_BLACK)
          For z = 0 To 39
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 39 To 72
            ConsoleColor(#PB_GREEN, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 5
          PrintN("")
          ConsoleColor(#PB_RED, #PB_BLACK)
          For z = 0 To 38
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 38 To 70
            ConsoleColor(#PB_GREEN, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 6
          PrintN("")
          ConsoleColor(#PB_RED, #PB_BLACK)
          For z = 0 To 36
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 36 To 70
            ConsoleColor(#PB_GREEN, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 7
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 34
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 36 To 72
            ConsoleColor(#PB_GREEN, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 8
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 32
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 34 To 70
            ConsoleColor(#PB_GREEN, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 9
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 34
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 36 To 70
            ConsoleColor(#PB_YELLOW, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 10
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 32
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 32 To 70
            ConsoleColor(#PB_YELLOW, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 11
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 30
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 32 To 70
            ConsoleColor(#PB_YELLOW, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 12
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 28
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 30 To 70
            ConsoleColor(#PB_YELLOW, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 13
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 28
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 30 To 70
            ConsoleColor(#PB_YELLOW, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 14
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 26
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 28 To 70
            ConsoleColor(#PB_YELLOW, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          
        Case 15
          PrintN("")
          ConsoleColor(#PB_BLUE, #PB_BLACK)
          For z = 0 To 26
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next
          For z = 28 To 70
            ConsoleColor(#PB_YELLOW, #PB_BLACK)
            Print(PeekS(@winart7(i) + z, 1, #PB_UTF8))
          Next              
      EndSelect
    Next
    ; Windows 8, 8.1, 10
ElseIf currentOS = #PB_WIN_8_81_10_2012
  ConsoleColor(#PB_DARKBLUE, #PB_BLACK)
  For i = 0 To 15
    PrintN(winart10(i))
  Next
EndIf

; Print user@pcname title
ConsoleLocate(40, 2)
ConsoleColor(#PB_RED, #PB_BLACK)
Print(UserName()) : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print("@") : ConsoleColor(#PB_YELLOW, #PB_BLACK) : Print(ComputerName())

; Print OS Data
ConsoleLocate(40, 4)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("OS: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(OSName)
If checkAddressWidth() = 64
  Print(" 64-bit")
Else
  Print(" 32-bit")
EndIf

; Print build data
ConsoleLocate(40, 5)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("Build: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getKernelInfo())

; Print host data
ConsoleLocate(40, 6)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("Host: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getHostInfo())

; Print motherboard data
ConsoleLocate(40, 7)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("Motherboard: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getMotherboardInfo())

; Print bios data
ConsoleLocate(40, 8)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("BIOS: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getBIOSInfo())

; Print CPU
ConsoleLocate(40, 9)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("CPU: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(CPUName()) : Print(" (" + Str(CountCPUs(#PB_System_CPUs)) + ")")

; Print GPU
ConsoleLocate(40, 10)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("GPU: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getCurrentGPU())

; Print main HDD data
ConsoleLocate(40, 11)
getHDDSize()
freeSpaceMiB = (Val(diskSize) / 1073741824) - (Val(freeSpace) / 1073741824)
totalSpace = Val(diskSize) / 1073741824
floatTotal.f = freeSpaceMiB / totalSpace
ConsoleColor(#PB_RED, #PB_BLACK) : Print("HDD: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(Str((Val(diskSize) - Val(freeSpace)) / 1073741824) + "G /" + " " + Str(Val(diskSize) / 1073741824) + "G" + " (" + Str(floatTotal * 100) + "%)")

; Print RAM data
ConsoleLocate(40, 12)
availRam = getAvailableRAM()
totalRam = getTotalRAM()
finalAvailableRAM = (totalRAM - availRam) / 1048576
floatRamTotal.f = finalAvailableRAM / (totalRam / 1048576)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("Memory: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(Str(finalAvailableRAM) + "MB /" + " " + Str(totalRAM / 1048576) + "MB" + " (" + Str(floatRamTotal * 100) + "%)")

; Print uptime data
ConsoleLocate(40, 13)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("Uptime: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getUptime())

; Print running processes
ConsoleLocate(40, 14)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("Processes: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getCurrentRunningProcesses())

; Print resolution data
ConsoleLocate(40, 15)
ConsoleColor(#PB_RED, #PB_BLACK) : Print("Resolution: ") : ConsoleColor(#PB_WHITE, #PB_BLACK) : Print(getScreenRes())

; Print Color bar
ConsoleLocate(42, 17)
ConsoleColor(#PB_RED, #PB_RED) : Print("   ") : ConsoleColor(#PB_GREEN, #PB_GREEN) : Print("   ") : ConsoleColor(#PB_YELLOW, #PB_YELLOW) : Print("   ") : ConsoleColor(#PB_DARKBLUE, #PB_DARKBLUE) : Print("   ") : ConsoleColor(#PB_MAGENTA, #PB_MAGENTA) : Print("   ") : ConsoleColor(#PB_BLUE, #PB_BLUE) : Print("   ") : ConsoleColor(#PB_GREY, #PB_GREY) : Print("   ") : PrintN("")

;Reset the console
ConsoleColor(#PB_WHITE, #PB_BLACK) : ConsoleLocate(42, 18) : EnableGraphicalConsole(0)

;Input()
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; ExecutableFormat = Console
; CursorPosition = 18
; Folding = ---
; Executable = bin\nanofetch.exe