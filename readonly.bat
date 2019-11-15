@ECHO OFF
SET args=%*

IF NOT DEFINED args GOTO END

attrib %args% | grep 'R    ' > tmpFile
set /p readonly= < tmpFile
del tmpFile

IF "%readonly%"=="" (
	:: Not Read-Only
	attrib +r %args%
	cacls %args% /e /d %username%
	cacls %args% /e /g %username%:r
	echo Read-Only Enabled
) ELSE (
	:: Read-Only
	cacls %args% /e /g %username%:f
	attrib -r %args%
	echo Read-Only Disabled
)

sleep 2
GOTO:EOF
:END
ECHO You didn't call this from a file action.
pause
