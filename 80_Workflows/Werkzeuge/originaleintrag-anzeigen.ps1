#requires -Version 7.0

[CmdletBinding(DefaultParameterSetName = 'Suche')]
param(
    [Parameter(Mandatory, ParameterSetName = 'Suche')]
    [ValidateNotNullOrEmpty()]
    [string] $Suchbegriff,

    [Parameter(ParameterSetName = 'Suche')]
    [string[]] $Startpfad,

    [Parameter(Mandatory, ParameterSetName = 'Pfad')]
    [ValidateNotNullOrEmpty()]
    [string] $Pfad,

    [Parameter(ParameterSetName = 'Suche')]
    [ValidateRange(1, 100)]
    [int] $MaxKandidaten = 20
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$repoRoot = [System.IO.Path]::GetFullPath(
    (Join-Path $PSScriptRoot '..\..')
).TrimEnd([System.IO.Path]::DirectorySeparatorChar)

$activeRelativeRoots = @(
    '10_Wissen'
    '20_Projekte'
    '30_Anleitungen'
    '40_Personen_und_Kontakte'
    '50_Dokumentation'
    '60_Quellen'
)

$activeRoots = @(
    foreach ($relativeRoot in $activeRelativeRoots) {
        [System.IO.Path]::GetFullPath((Join-Path $repoRoot $relativeRoot))
    }
)

function Test-InActiveRoot {
    param([Parameter(Mandatory)][string] $FullPath)

    foreach ($activeRoot in $activeRoots) {
        $prefix = $activeRoot.TrimEnd(
            [System.IO.Path]::DirectorySeparatorChar
        ) + [System.IO.Path]::DirectorySeparatorChar

        if ($FullPath.StartsWith(
            $prefix,
            [System.StringComparison]::OrdinalIgnoreCase
        )) {
            return $true
        }
    }

    return $false
}

function Resolve-RepositoryPath {
    param([Parameter(Mandatory)][string] $InputPath)

    $combined = if ([System.IO.Path]::IsPathRooted($InputPath)) {
        $InputPath
    }
    else {
        Join-Path $repoRoot $InputPath
    }

    return [System.IO.Path]::GetFullPath($combined)
}

function Get-RelativePath {
    param([Parameter(Mandatory)][string] $FullPath)

    return [System.IO.Path]::GetRelativePath(
        $repoRoot,
        $FullPath
    ).Replace('\', '/')
}

function Write-OriginalEntry {
    param([Parameter(Mandatory)][string] $FullPath)

    if (-not (Test-InActiveRoot -FullPath $FullPath)) {
        throw 'Der Pfad liegt nicht in einem aktiven Wissensbereich.'
    }
    if ([System.IO.Path]::GetExtension($FullPath) -ine '.md') {
        throw 'Originaleinträge müssen Markdown-Dateien sein.'
    }
    if (-not [System.IO.File]::Exists($FullPath)) {
        throw "Datei nicht gefunden: $FullPath"
    }

    $content = [System.IO.File]::ReadAllText($FullPath)
    $fenceLength = 3
    foreach ($run in [regex]::Matches($content, '`+')) {
        if ($run.Length -ge $fenceLength) {
            $fenceLength = $run.Length + 1
        }
    }
    $fence = '`' * $fenceLength

    [Console]::Out.WriteLine($fence)
    [Console]::Out.Write($content)
    if (-not ($content.EndsWith("`n") -or $content.EndsWith("`r"))) {
        [Console]::Out.WriteLine()
    }
    [Console]::Out.WriteLine($fence)
    [Console]::Out.Write("Pfad: $FullPath")
}

function Write-Candidates {
    param([Parameter(Mandatory)][System.IO.FileInfo[]] $Candidates)

    $shown = @($Candidates | Select-Object -First $MaxKandidaten)
    Write-Output 'Mehrere aktive Dateien passen:'
    foreach ($candidate in $shown) {
        $relativePath = Get-RelativePath -FullPath $candidate.FullName
        Write-Output ('- `' + $relativePath + '`')
    }
    if ($Candidates.Count -gt $shown.Count) {
        $remaining = $Candidates.Count - $shown.Count
        Write-Output "Weitere Treffer: $remaining. Bitte die Suche eingrenzen."
    }
    else {
        Write-Output 'Bitte einen relativen Pfad auswählen.'
    }
}

if ($PSCmdlet.ParameterSetName -eq 'Pfad') {
    $fullPath = Resolve-RepositoryPath -InputPath $Pfad
    Write-OriginalEntry -FullPath $fullPath
    exit 0
}

if ([string]::IsNullOrWhiteSpace($Suchbegriff)) {
    throw 'Der Suchbegriff darf nicht leer sein.'
}

$searchRoots = if ($null -ne $Startpfad -and $Startpfad.Count -gt 0) {
    @(
        foreach ($inputRoot in $Startpfad) {
            $fullRoot = Resolve-RepositoryPath -InputPath $inputRoot
            if (-not (Test-InActiveRoot -FullPath ($fullRoot + '\dummy'))) {
                throw "Startpfad liegt nicht in einem aktiven Bereich: $inputRoot"
            }
            if (-not [System.IO.Directory]::Exists($fullRoot)) {
                throw "Startpfad nicht gefunden: $inputRoot"
            }
            $fullRoot
        }
    )
}
else {
    $activeRoots
}

$allFiles = @(
    Get-ChildItem -LiteralPath $searchRoots -File -Recurse -Filter '*.md' |
        Sort-Object -Property FullName -Unique
)

$pathCandidates = @(
    $allFiles | Where-Object {
        (Get-RelativePath -FullPath $_.FullName).IndexOf(
            $Suchbegriff,
            [System.StringComparison]::OrdinalIgnoreCase
        ) -ge 0
    }
)

$candidates = @(
    if ($pathCandidates.Count -gt 0) {
        $pathCandidates
    }
    else {
        foreach ($file in $allFiles) {
            $content = [System.IO.File]::ReadAllText($file.FullName)
            if ($content.IndexOf(
                $Suchbegriff,
                [System.StringComparison]::OrdinalIgnoreCase
            ) -ge 0) {
                $file
            }
        }
    }
)

if ($candidates.Count -eq 0) {
    Write-Output 'Kein passender aktiver Eintrag gefunden.'
    exit 0
}
if ($candidates.Count -gt 1) {
    Write-Candidates -Candidates $candidates
    exit 0
}

Write-OriginalEntry -FullPath $candidates[0].FullName
