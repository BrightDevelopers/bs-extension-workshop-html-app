' BrightSign HTML app bootstrap for the extension workshop.
' Loads the webpack-bundled HTML app from the SD card and displays it full-screen.

Sub Main()
    msgPort = CreateObject("roMessagePort")

    ' Full-screen rectangle at 1080p.
    rect = CreateObject("roRectangle", 0, 0, 1920, 1080)

    config = CreateObject("roAssociativeArray")
    config.port = msgPort

    html = CreateObject("roHtmlWidget", rect, config)
    html.SetPort(msgPort)

    ' Load the bundled app from the SD card root.
    html.SetURL("file:///sd:/dist/index.html")

    ' Event loop — keep the process alive.
    While True
        msg = Wait(0, msgPort)
    End While
End Sub
