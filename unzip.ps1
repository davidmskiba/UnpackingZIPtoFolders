C:
cd C:\
cd C:\Downloads
$Heute=Get-Date -Format dd-MM-yyyy
mkdir $Heute

mkdir temp
mv *.zip .\temp\
cd C:\Downloads\Temp\
expand *.zip  C:\Downloads\
Get-ChildItem *.zip | Rename-Item -NewName { $_.Name -replace '.zip','.tmp' } -Force
cd C:\Downloads

gci -Recurse -Filter *.zip |ForEach-Object {$n=($_.Fullname.trimend('.zip')); Expand-Archive -Path $_.Fullname.ToUpper() -DestinationPath $n -Force} 
mv *.zip .\$Heute
$Directories=Get-ChildItem -Directory
foreach ($Verzeichnis in $Directories)
	{
	Rename-Item -Path $Verzeichnis.name -NewName dummy 
	Rename-Item -Path .\dummy\ -NewName ($Verzeichnis.Name.ToUpper())
	}

exit



