getMonitorHandle()
{
    hMon := DllCall("MonitorFromPoint"
        ,"int64",   0
        ,"uint",    1)

    VarSetCapacity(Physical_Monitor, 8 + 256, 0)

    DllCall("dxva2\GetPhysicalMonitorsFromHMONITOR"
        ,"int",     hMon
        ,"uint",    1
        ,"int",     &Physical_Monitor)

    return hPhysMon := NumGet(Physical_Monitor)
}

destroyMonitorHandle(handle)
{
    DllCall("dxva2\DestroyPhysicalMonitor", "int", handle)
}

setMonitorInputSource(source)
{
    handle := getMonitorHandle()

    DllCall("dxva2\SetVCPFeature"
        ,"int",     handle
        ,"char",    0x60
        ,"uint",    source)

    destroyMonitorHandle(handle)
}

getMonitorInputSource()
{
    handle := getMonitorHandle()

    DllCall("dxva2\GetVCPFeatureAndVCPFeatureReply"
        ,"int",     handle
        ,"char",    0x60
        ,"Ptr",     0
        ,"uint*",   currentValue
        ,"uint*",   maximumValue)

      destroyMonitorHandle(handle)
      return currentValue
}