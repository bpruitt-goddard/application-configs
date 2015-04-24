#Default Sublime Location for packages
$packageDir = "$env:APPDATA\Sublime Text 3\Packages"
#Name of the theme package
$themeDir = 'Color Scheme - Default'
#Name of theme to update
$themeToUpdate = 'Monokai.tmTheme'
$updatedTheme = Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "$themeToUpdate"

Function apply
{
    $destinationFile = $packageDir, $themeDir, $themeToUpdate -join '\'
    #'touch' the destination to ensure folder exists
    New-Item -ItemType File -Path $destinationFile -Force > $null
    Copy-Item -LiteralPath $updatedTheme -Destination $destinationFile -Force -Recurse
    #Sublime requires the file to be 'touched' before it detects the change.
    #Open file and append nothing to do this
    ''|Out-File $destinationFile -Append
}