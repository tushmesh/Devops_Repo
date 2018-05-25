$str=Get-Content "C:\Users\tushar.u.meshram\OneDrive - Accenture\SSE\Document\Release_Notes.txt" -raw
$str | Select-String -Pattern '(?ms)CHANGED_FILES_START(.*?)CHANGED_FILES_END' -AllMatches | 
foreach 
     {
          $_.Matches | foreach {
          $_.Groups[0].Value
          }
     } | out-file files_to_pkg.txt
get-content .\files_to_pkg.txt  | foreach-object {$_ -replace "CHANGED_FILES_START",""} | foreach-object {$_ -replace "CHANGED_FILES_END",""} | out-file files_to_pkg1.txt  
## Remove Blank Lines
get-content .\files_to_pkg1.txt | ? {$_.trim() -ne "" } | set-content  .\files_to_pkg2.txt
     
