$str=Get-Content "$ENV:WORKSPACE\Release_Notes\Release_Notes.txt" -raw
$str | Select-String -Pattern '(?ms)CHANGED_FILES_START(.*?)CHANGED_FILES_END' -AllMatches | foreach {$_.Matches | foreach {$_.Groups[0].Value}} | out-file $ENV:WORKSPACE\Logs\files_to_pkg.txt

Get-Content $ENV:WORKSPACE\Logs\files_to_pkg.txt  | foreach-object {$_ -replace "CHANGED_FILES_START",""} | foreach-object {$_ -replace "CHANGED_FILES_END",""} | out-file $ENV:WORKSPACE\Logs\files_to_pkg1.txt
## Remove Blank Lines

Get-Content $ENV:WORKSPACE\Logs\files_to_pkg1.txt | ? {$_.trim() -ne "" } | set-content  $ENV:WORKSPACE\Logs\files_to_pkg2.txt
foreach ( $exec in Get-Content $ENV:WORKSPACE\Logs\files_to_pkg2.txt ) 
{
     Copy-Item -Path $exec -Destination C:\Tushar\ 
}

Compress-Archive -Path C:\Tushar\* -DestinationPath C:\Tushar\Bundle.zip
    
    
