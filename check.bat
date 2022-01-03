for %%# in (*.jpg) do (
    for /f "delims=? tokens=2" %%a in ('toolTipInfo.bat "%%~#" ^|find "Dimensions:"')  do  (
        if "%%a" NEQ "1920 x 1080" ( del %%# )
    )
)

forfiles /m *.jpg /D -30 /C "cmd /c del @file"