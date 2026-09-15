; ==========================================================
; ReplaceURL_AllFiles.ahk
; Recursively replaces the VapeCompiled URL with MapeCompiled
; in ALL files that contain it.
; ==========================================================

#SingleInstance Force

OldURL := "https://raw.githubusercontent.com/alvindandme/MapeCompiled/"
NewURL := "https://raw.githubusercontent.com/alvindandme/MapeCompiled/"

; Scan all files recursively
Loop, Files, *.*, R
{
    FilePath := A_LoopFileFullPath

    ; Read file
    FileRead, Content, %FilePath%
    if (ErrorLevel)
        continue

    ; Replace URL everywhere
    if InStr(Content, OldURL)
    {
        Content := StrReplace(Content, OldURL, NewURL)

        ; Overwrite file
        FileDelete, %FilePath%
        FileAppend, %Content%, %FilePath%
    }
}

MsgBox, 64, Done, URL replaced in all files.
ExitApp
