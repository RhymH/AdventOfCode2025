param(
    [Parameter(Mandatory = $false)]
    [int]$Day,
    
    [Parameter(Mandatory = $false)]
    [int]$Year = 2025
)

$projectRoot = $PSScriptRoot
$sessionFile = Join-Path $projectRoot ".session"

# Check if session file exists
if (-not (Test-Path $sessionFile)) {
    Write-Host "ERROR: Session cookie not found!" -ForegroundColor Red
    Write-Host "`nTo set up automatic input downloads:" -ForegroundColor Yellow
    Write-Host "1. Log in to https://adventofcode.com in your browser"
    Write-Host "2. Open Developer Tools (F12)"
    Write-Host "3. Go to Application/Storage -> Cookies -> https://adventofcode.com"
    Write-Host "4. Copy the value of the 'session' cookie"
    Write-Host "5. Run: " -NoNewline
    Write-Host ".\SetSession.ps1 -SessionCookie 'your_session_value'" -ForegroundColor Cyan
    Write-Host ""
    exit 1
}

$sessionCookie = Get-Content $sessionFile -Raw
$sessionCookie = $sessionCookie.Trim()

if ([string]::IsNullOrWhiteSpace($sessionCookie)) {
    Write-Host "ERROR: Session cookie is empty!" -ForegroundColor Red
    Write-Host "Run: " -NoNewline
    Write-Host ".\SetSession.ps1 -SessionCookie 'your_session_value'" -ForegroundColor Cyan
    exit 1
}

# Determine which day to download
$dayToDownload = $Day
if (-not $dayToDownload) {
    # Auto-detect: download for today's date if in December
    $today = Get-Date
    if ($today.Month -eq 12 -and $today.Day -le 25) {
        $dayToDownload = $today.Day
    }
    else {
        Write-Host "ERROR: Please specify a day with -Day parameter" -ForegroundColor Red
        Write-Host "Usage: .\GetInput.ps1 -Day 1" -ForegroundColor Yellow
        exit 1
    }
}

if ($dayToDownload -lt 1 -or $dayToDownload -gt 25) {
    Write-Host "ERROR: Day must be between 1 and 25" -ForegroundColor Red
    exit 1
}

$dayNumber = $dayToDownload.ToString("D2")
$inputFile = Join-Path $projectRoot "Inputs\day$dayNumber.txt"

# Check if file already exists
if (Test-Path $inputFile) {
    $fileSize = (Get-Item $inputFile).Length
    if ($fileSize -gt 0) {
        Write-Host "Input file already exists: $inputFile" -ForegroundColor Yellow
        $response = Read-Host "Overwrite? (y/N)"
        if ($response -ne 'y' -and $response -ne 'Y') {
            Write-Host "Cancelled." -ForegroundColor Gray
            exit 0
        }
    }
}

# Download the input
$url = "https://adventofcode.com/$Year/day/$dayToDownload/input"
Write-Host "Downloading input for Day $dayToDownload ($Year)..." -ForegroundColor Cyan

try {
    $headers = @{
        "Cookie" = "session=$sessionCookie"
    }
    
    $userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
    
    $response = Invoke-WebRequest -Uri $url -Headers $headers -UserAgent $userAgent -UseBasicParsing
    
    if ($response.StatusCode -eq 200) {
        # Ensure Inputs directory exists
        $inputsDir = Join-Path $projectRoot "Inputs"
        if (-not (Test-Path $inputsDir)) {
            New-Item -ItemType Directory -Path $inputsDir | Out-Null
        }
        
        # Save the input (trim trailing newline that AoC adds)
        $content = $response.Content
        if ($content.EndsWith("`n")) {
            $content = $content.Substring(0, $content.Length - 1)
        }
        
        [System.IO.File]::WriteAllText($inputFile, $content)
        
        $fileSize = (Get-Item $inputFile).Length
        Write-Host "✓ Successfully downloaded $fileSize bytes to: $inputFile" -ForegroundColor Green
    }
    else {
        Write-Host "ERROR: Unexpected response (Status: $($response.StatusCode))" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "ERROR: Failed to download input" -ForegroundColor Red
    
    if ($_.Exception.Message -like "*400*" -or $_.Exception.Message -like "*500*") {
        Write-Host "The puzzle for Day $dayToDownload may not be available yet." -ForegroundColor Yellow
    }
    elseif ($_.Exception.Message -like "*401*" -or $_.Exception.Message -like "*403*") {
        Write-Host "Authentication failed. Your session cookie may have expired." -ForegroundColor Yellow
        Write-Host "Please update it using: " -NoNewline
        Write-Host ".\SetSession.ps1 -SessionCookie 'your_new_session_value'" -ForegroundColor Cyan
    }
    else {
        Write-Host "Details: $($_.Exception.Message)" -ForegroundColor Gray
    }
    
    exit 1
}
