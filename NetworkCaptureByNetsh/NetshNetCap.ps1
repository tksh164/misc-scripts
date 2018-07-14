$VerbosePreference = 'Continue'

# Configurations
$basePath = 'Q:\Work\capture\'
$fileSwitchIntervalInSec = 3600 * 24

##

$netshExePath = 'C:\Windows\System32\netsh.exe'

$captureFileIndex = 0
while(1)
{
    $captureFilePath = Join-Path -Path $basePath -ChildPath ('netcap-{0}-{1}-{2:d3}.etl' -f $env:ComputerName,(Get-Date -Format 'yyyyMMdd-HHmmss'),$captureFileIndex)
    
    Write-Verbose -Message ('Current capture file: {0}' -f $captureFilePath)

    netsh trace start capture=yes report=disabled correlation=disabled maxSize=500 traceFile=$captureFilePath
    #Start-Process -FilePath $netshExePath -ArgumentList 'trace','start','capture=yes','report=disabled','correlation=disabled','maxSize=500',('traceFile={0}' -f $captureFilePath) -Wait

    Start-Sleep -Seconds $fileSwitchIntervalInSec

    netsh trace stop
    #Start-Process -FilePath $netshExePath -ArgumentList 'trace','stop' -Wait

    $captureFileIndex++
}
