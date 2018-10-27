#Include monitor.ahk

input := getMonitorInputSource()

msgbox The monitor's current input is %input%. To switch to it, first call getMonitorHandle(), then setMonitorInputSource(%input%).