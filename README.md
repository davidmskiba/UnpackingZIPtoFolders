# UnpackingPDFtoFolders

<h1>Unpacking PDFs from ZIP Files into seperate folders which gather their name from a xml-file within each folder.</h1>

WINDOWS ONLY


Problem: You have multiple ZIP-Files to extract. The extraction should be in seperate folders. (Step 1)
How-To: Download all of you ZIPs to C:\Downloads (you can change it in the unzip.ps1)
Now execute the "Step 1 Unzip.bat"

Problem 2: You need to change the foldername-prefix of each folder you have extracted according to a line in a xml within this folder
i.e.: XML-Line in "pruefvermerk.xml" is < Betreff > ABC ./. DEF < /Betreff >. Foldername is "GHI" and you want to name this folder automatically "ABC GHI". 

Execute "Step 2 Namen einfügen"

You can modify this batch as you please: mode con cp select=65001 means that you have german keyboard with ö ä ü.
you can set the source directory as you want. Now it's "C:\Downloads"
You can change the xml-file from where you want to parse your foldername. Now it is %SourceDir%\pruefvermerk.xml
You can change tokens (now 2,3) and you limiter until where your parsing should happen. (Now it is delims=</> 
You can specify from what tag you want to extract you data. Now it is "< Betreff > < /Betreff >"

Change every "Betreff" to your tag you want to search in!!


Problem3: You need to get rid of certain files wihtin all folders you have extracted (Now it is C:\Downloads)
Modify Step 3 NachExtrahieren.bat as you please. Execute.


This was a project done by me for downloading masses of zips for work. I had to extract every single zip and rename every single folder by hand, because our IT didnt allow any third-party apps. So i had to program those ps1 and batch files.

Feel free to spread it or make it a real program! 

