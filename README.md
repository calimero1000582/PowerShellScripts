# PowerShellScripts

Collection of some Scripts I use in different cases

## ConvertFrom-Xml

Simple tool that I use in a Pipeline to convert Xml to Json

Not tested with many cases, but it works really well with the cases I had

```powershell
[xml]$xmlDocument = $xmlFile | Get-Content
$json = $xmlDocument.DocumentElement | ConvertFrom-Xml | ConvertTo-Json
```