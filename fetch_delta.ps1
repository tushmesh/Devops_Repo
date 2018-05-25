#Get-Content .\Release_Notes.txt | Where-Object {$_ -like '*.xml'} | out-file files_to_pkg.txt

$str=Get-Content "C:\Users\tushar.u.meshram\OneDrive - Accenture\SSE\Document\Release_Notes.txt" -raw

$str | Select-String -Pattern '(?ms)CHANGED_FILES_START(
.*?)CHANGED_FILES_END' -AllMatches | foreach {
     $_.Matches | foreach {
         $_.Groups[0].Value
     }
 } | out-file files_to_pkg.txt