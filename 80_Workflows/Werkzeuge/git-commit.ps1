#requires -Version 7.0

[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string] $Nachricht,

    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string[]] $Dateien
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$repoRoot = [System.IO.Path]::GetFullPath(
    (Join-Path $PSScriptRoot '..\..')
).TrimEnd([System.IO.Path]::DirectorySeparatorChar)

function Invoke-Git {
    param([Parameter(Mandatory)][string[]] $Argumente)

    $output = @(& git @Argumente 2>&1)
    if ($LASTEXITCODE -ne 0) {
        $details = ($output -join [Environment]::NewLine).Trim()
        throw "Git-Befehl fehlgeschlagen: git $($Argumente -join ' ')`n$details"
    }
    return $output
}

function Get-RelativeRepositoryPath {
    param([Parameter(Mandatory)][string] $InputPath)

    $fullPath = if ([System.IO.Path]::IsPathRooted($InputPath)) {
        [System.IO.Path]::GetFullPath($InputPath)
    }
    else {
        [System.IO.Path]::GetFullPath((Join-Path $repoRoot $InputPath))
    }

    $repoPrefix = $repoRoot + [System.IO.Path]::DirectorySeparatorChar
    if (-not $fullPath.StartsWith(
        $repoPrefix,
        [System.StringComparison]::OrdinalIgnoreCase
    )) {
        throw "Datei liegt außerhalb des Repositorys: $InputPath"
    }
    if ([System.IO.Directory]::Exists($fullPath)) {
        throw "Bitte einzelne Dateien statt Ordner angeben: $InputPath"
    }

    $relativePath = [System.IO.Path]::GetRelativePath(
        $repoRoot,
        $fullPath
    ).Replace('\', '/')

    if ($relativePath -ieq 'Sicherheit' -or
        $relativePath.StartsWith(
            'Sicherheit/',
            [System.StringComparison]::OrdinalIgnoreCase
        )) {
        throw 'Dateien aus dem Sicherheitsbereich dürfen nicht committet werden.'
    }
    if ($relativePath -ieq '.git' -or
        $relativePath.StartsWith(
            '.git/',
            [System.StringComparison]::OrdinalIgnoreCase
        )) {
        throw 'Interne Git-Dateien dürfen nicht committet werden.'
    }

    if (-not [System.IO.File]::Exists($fullPath)) {
        try {
            $null = Invoke-Git -Argumente @(
                'ls-files', '--error-unmatch', '--', $relativePath
            )
        }
        catch {
            throw "Datei ist weder vorhanden noch als Löschung verfolgt: $InputPath"
        }
    }

    return $relativePath
}

Push-Location $repoRoot
try {
    $actualRoot = (Invoke-Git -Argumente @(
        'rev-parse', '--show-toplevel'
    ) | Select-Object -First 1).Trim()
    if ([System.IO.Path]::GetFullPath($actualRoot) -ine $repoRoot) {
        throw 'Das Skript wurde nicht im erwarteten Repository ausgeführt.'
    }

    $requestedPaths = @(
        foreach ($inputFile in $Dateien) {
            Get-RelativeRepositoryPath -InputPath $inputFile
        }
    ) | Sort-Object -Unique

    $alreadyStaged = @(
        Invoke-Git -Argumente @(
            '-c', 'core.quotepath=false',
            'diff', '--cached', '--name-only', '--'
        ) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )
    $foreignStaged = @(
        $alreadyStaged | Where-Object { $_ -notin $requestedPaths }
    )
    if ($foreignStaged.Count -gt 0) {
        throw "Bereits vorgemerkte fremde Dateien:`n$($foreignStaged -join "`n")"
    }

    $target = $requestedPaths -join ', '
    if (-not $PSCmdlet.ShouldProcess(
        $target,
        "Dateien vormerken und Commit '$Nachricht' erstellen"
    )) {
        Write-Output 'Keine Änderungen vorgenommen.'
        exit 0
    }

    $addArguments = @('add', '--') + $requestedPaths
    $null = Invoke-Git -Argumente $addArguments

    $stagedPaths = @(
        Invoke-Git -Argumente @(
            '-c', 'core.quotepath=false',
            'diff', '--cached', '--name-only', '--'
        ) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )
    if ($stagedPaths.Count -eq 0) {
        throw 'Für die angegebenen Dateien gibt es nichts zu committen.'
    }

    $unexpectedStaged = @(
        $stagedPaths | Where-Object { $_ -notin $requestedPaths }
    )
    if ($unexpectedStaged.Count -gt 0) {
        throw "Unerwartet vorgemerkte Dateien erkannt:`n$($unexpectedStaged -join "`n")"
    }

    $null = Invoke-Git -Argumente @('diff', '--cached', '--check')
    $null = Invoke-Git -Argumente @('commit', '--quiet', '-m', $Nachricht)

    $commit = (Invoke-Git -Argumente @(
        'log', '-1', '--format=%h %s'
    ) | Select-Object -First 1).Trim()
    Write-Output "Commit erstellt: $commit"

    $remaining = @(
        Invoke-Git -Argumente @(
            '-c', 'core.quotepath=false', 'status', '--short'
        )
    )
    if ($remaining.Count -eq 0) {
        Write-Output 'Arbeitsbaum sauber.'
    }
    else {
        Write-Output 'Verbleibende Änderungen:'
        $remaining | Write-Output
    }
}
finally {
    Pop-Location
}
