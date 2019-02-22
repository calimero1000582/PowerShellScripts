
<#PSScriptInfo
.VERSION 1.0
.GUID 0c3a31f4-028b-498e-afa0-3ed0d22cac6a
.AUTHOR Pier-Luc.Duchaine@groupecanam.com
#>

<# 
.DESCRIPTION 
 Convert XmlElement to PSObject 

 Usage: 
     [xml]$xmlDocument = $xmlFile | Get-Content
     $xmlDocument.DocumentElement | ConvertFrom-Xml

 This also work in conjunction with "ConvertTo-Json" to convert Xml to Json
#> 

[CmdletBinding()]
Param([System.Xml.XmlElement][Parameter(ValueFromPipeline)]$xmlElement)

$PSObject = New-Object PSObject
    
foreach($attribute in $xmlElement.Attributes){
    $PSObject | Add-Member NoteProperty $attribute.Name $attribute.Value
}

if($null -ne $xmlElement.'#text'){
    return $xmlElement.'#text'
}
elseif($xmlElement.ChildNodes.Count -ne 0) {
    $PSArray = @()
    foreach($data in $xmlElement.ChildNodes){
        $PSArray += $data | ConvertFrom-Xml
    }
    $PSObject | Add-Member NoteProperty $xmlElement.LocalName $PSArray
}

return $PSObject 
