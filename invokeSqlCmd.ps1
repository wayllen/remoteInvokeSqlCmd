# For use "Invoke-Sqlcmd" command in powershell v1.0, you need to register below two dlls after install sql server 2008R2.
set-alias installutil $env:windir\microsoft.net\framework\v2.0.50727\installutil

installutil -i “C:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\Microsoft.SqlServer.Management.PSProvider.dll”

installutil -i “C:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\Microsoft.SqlServer.Management.PSSnapins.dll” 

add-pssnapin sqlserverprovidersnapin100 -ErrorAction SilentlyContinue
add-pssnapin sqlservercmdletsnapin100 -ErrorAction SilentlyContinue

# Execute sql script on remote server.
Invoke-Sqlcmd -ServerInstance "remoteServerName"  -InputFile "localSQLScriptfile" -U "DB-username" -P "DB-password"
