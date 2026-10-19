param(
    [string]$RootPath = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$xliffNamespace = 'urn:oasis:names:tc:xliff:document:1.2'

function Read-Xliff([string]$Path) {
    [xml]$document = Get-Content -LiteralPath $Path -Raw
    $manager = [Xml.XmlNamespaceManager]::new($document.NameTable)
    $manager.AddNamespace('x', $xliffNamespace)
    return @{ Document = $document; Manager = $manager }
}

function Get-NodeText($Node, [string]$Name, $Manager) {
    $child = $Node.SelectSingleNode("x:$Name", $Manager)
    if ($null -eq $child) { return '' }
    return $child.InnerText
}

$english = Read-Xliff (Join-Path $RootPath 'src\translation.en-US.xlf')
$spanish = Read-Xliff (Join-Path $RootPath 'src\translation.es-ES.xlf')
$englishById = @{}
foreach ($unit in $english.Document.SelectNodes('//x:trans-unit', $english.Manager)) {
    $englishById[$unit.id] = Get-NodeText $unit 'source' $english.Manager
}

$candidates = @{}
foreach ($unit in $spanish.Document.SelectNodes('//x:trans-unit', $spanish.Manager)) {
    if (-not $englishById.ContainsKey($unit.id)) { continue }
    $spanishText = Get-NodeText $unit 'target' $spanish.Manager
    $englishText = $englishById[$unit.id]
    if ([string]::IsNullOrWhiteSpace($spanishText) -or [string]::IsNullOrWhiteSpace($englishText)) { continue }
    if (-not $candidates.ContainsKey($spanishText)) { $candidates[$spanishText] = [Collections.Generic.HashSet[string]]::new() }
    [void]$candidates[$spanishText].Add($englishText)
}

$translation = @{}
foreach ($entry in $candidates.GetEnumerator()) {
    if ($entry.Value.Count -eq 1) { $translation[$entry.Key] = @($entry.Value)[0] }
}

function To-English([string]$Text) {
    $plainText = $Text.Replace("''", "'")
    if ($translation.ContainsKey($plainText)) { return ([string]$translation[$plainText]).Replace("'", "''") }
    return $Text
}

$fieldPattern = [regex]::new('(?ms)^(?<indent>\s*)field\s*\(\s*\d+\s*;\s*(?<name>"(?:[^"]|"")*"|[^;\r\n]+)\s*;[^\r\n]*\)\s*\r?\n\k<indent>\{(?<body>.*?)(?=^\k<indent>\})')
$captionPattern = [regex]::new("(?im)^(?<indent>\s*)Caption\s*=\s*'(?<text>(?:''|[^'])*)';")
$changedFiles = 0
$addedCaptions = 0
$addedToolTips = 0
$translatedCaptions = 0

$alFiles = @(Get-ChildItem (Join-Path $RootPath 'src'), (Join-Path $RootPath 'projects') -Recurse -Filter '*.al' -File)
foreach ($file in $alFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    $newline = if ($content.Contains("`r`n")) { "`r`n" } else { "`n" }

    $content = $captionPattern.Replace($content, {
        param($match)
        $englishText = To-English $match.Groups['text'].Value
        if ($englishText -ne $match.Groups['text'].Value) { $script:translatedCaptions++ }
        return "$($match.Groups['indent'].Value)Caption = '$englishText';"
    })

    $content = $fieldPattern.Replace($content, {
        param($match)
        $indent = $match.Groups['indent'].Value
        $propertyIndent = $indent + '    '
        $body = $match.Groups['body'].Value
        $fieldName = $match.Groups['name'].Value.Trim().Trim('"').Replace('""', '"')
        $captionMatch = $captionPattern.Match($body)

        if ($captionMatch.Success) {
            $caption = $captionMatch.Groups['text'].Value
        } else {
            $caption = To-English ($fieldName.Replace("'", "''"))
            $body = "$newline$propertyIndent" + "Caption = '$caption';" + $body
            $script:addedCaptions++
        }

        if ($body -notmatch '(?im)^\s*ToolTip\s*=') {
            $tooltipCaption = $caption.Replace("''", "'").TrimEnd('.')
            $tooltip = "Specifies the value of the $tooltipCaption field.".Replace("'", "''")
            $insertion = "$newline$propertyIndent" + "ToolTip = '$tooltip';"
            $captionInBody = $captionPattern.Match($body)
            if ($captionInBody.Success) {
                $position = $captionInBody.Index + $captionInBody.Length
                $body = $body.Insert($position, $insertion)
            } else {
                $body = $insertion + $body
            }
            $script:addedToolTips++
        }

        return $match.Value.Substring(0, $match.Groups['body'].Index - $match.Index) + $body
    })

    $original = Get-Content -LiteralPath $file.FullName -Raw
    if ($content -ne $original) {
        [IO.File]::WriteAllText($file.FullName, $content, [Text.UTF8Encoding]::new($false))
        $changedFiles++
    }
}

"Changed files: $changedFiles"
"Translated captions: $translatedCaptions"
"Added captions: $addedCaptions"
"Added tooltips: $addedToolTips"
