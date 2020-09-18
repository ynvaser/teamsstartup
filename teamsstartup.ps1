$appName= "Teams"
$date = Get-Date
$day = $date.DayOfWeek
$daysYouDontWorkExpr = $day.Equals([System.DayOfWeek]::Saturday) -or $day.Equals([System.DayOfWeek]::Sunday)
$hour = $date.TimeOfDay.Hours
$hourYouStartWorking = 6
$hourYouStopWorking = 18


if ($daysYouDontWorkExpr) {
    Write-Output "Today is $day, no need to start Teams :)"
} elseif ($hour -le $hourYouStartWorking -or $hour -ge $hourYouStopWorking) {
    Write-Output "It's EOB / too early, no need to start Teams :)"
} else {
    Write-Output "It's business hours on a weekday, starting Teams..."
    $userprofile = $env:USERPROFILE
    Start-Process -FilePath "$userprofile\AppData\Local\Microsoft\Teams\Update.exe" -ArgumentList "--processStart `"Teams.exe`""
}