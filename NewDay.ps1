param(
    [Parameter(Mandatory = $true)]
    [int]$Day,
    
    [Parameter(Mandatory = $false)]
    [switch]$SkipDownload
)

$projectRoot = $PSScriptRoot
$ErrorActionPreference = "Stop"

Write-Host "`n╔═══════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Setting up Advent of Code Day $($Day.ToString('D2'))    ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════╝`n" -ForegroundColor Cyan

# Step 1: Download input (if not skipped)
if (-not $SkipDownload) {
    Write-Host "[1/3] Downloading input file..." -ForegroundColor Yellow
    
    $sessionFile = Join-Path $projectRoot ".session"
    if (Test-Path $sessionFile) {
        try {
            & "$projectRoot\GetInput.ps1" -Day $Day
            Write-Host ""
        }
        catch {
            Write-Host "Warning: Could not download input file" -ForegroundColor Yellow
            Write-Host "You can download it manually later with: .\GetInput.ps1 -Day $Day" -ForegroundColor Gray
            Write-Host ""
        }
    }
    else {
        Write-Host "⚠ Session not configured. Skipping download." -ForegroundColor Yellow
        Write-Host "To enable automatic downloads, run: .\SetSession.ps1 -SessionCookie '<your_session>'" -ForegroundColor Gray
        Write-Host ""
    }
}
else {
    Write-Host "[1/3] Skipping input download (-SkipDownload specified)" -ForegroundColor Gray
    Write-Host ""
}

# Step 2: Create day class
Write-Host "[2/3] Creating day class..." -ForegroundColor Yellow
try {
    & "$projectRoot\AddDay.ps1" -Day $Day
    Write-Host ""
}
catch {
    Write-Host "Error creating day class: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 3: Open files in VS Code (if available)
Write-Host "[3/3] Opening files..." -ForegroundColor Yellow
$dayNumber = $Day.ToString("D2")
$dayFile = Join-Path $projectRoot "Days\Day$dayNumber.cs"
$inputFile = Join-Path $projectRoot "Inputs\day$dayNumber.txt"

if (Get-Command code -ErrorAction SilentlyContinue) {
    code $dayFile
    code $inputFile
    Write-Host "✓ Opened files in VS Code" -ForegroundColor Green
}
else {
    Write-Host "Files created at:" -ForegroundColor Gray
    Write-Host "  - $dayFile" -ForegroundColor White
    Write-Host "  - $inputFile" -ForegroundColor White
}

Write-Host "`n✨ Day $Day is ready! Happy coding! 🎄`n" -ForegroundColor Green
