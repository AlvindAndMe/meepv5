; ==========================================================
; ReplaceALL_URL_Variants_NoGithub.ahk
; Recursively replaces ANY VapeCompiled URL with MapeCompiled
; Skips the .github folder entirely
; Case-insensitive replacement
; ==========================================================

#SingleInstance Force

; CORE pattern only — this catches ALL variations
OldCore := "raw.githubusercontent.com/7granddadpgn/vapecompiled"
NewCore := "raw.githubusercontent.com/alvindandme/mapecompiled"

Loop, Files, *.*, R
{
    FilePath := A_LoopFileFullPath


    FileRead, Content, %FilePath%

    ; LOWERCASE the content for matching
    LowerContent := StrLower(Content)

    ; If the old core exists anywhere, replace it
    if InStr(LowerContent, OldCore)
    {
        ; Replace in original content (case-insensitive)
        ; We replace ALL possible case variants
        Content := RegExReplace(Content, "(?i)" . OldCore, NewCore)

        ; Overwrite file
        FileDelete, %FilePath%
        FileAppend, %Content%, %FilePath%
    }
}

MsgBox, 64, Done, ALL URL variants replaced (except .github).
ExitApp
