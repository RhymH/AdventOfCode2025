param(
    [Parameter(Mandatory = $true)]
    [string]$SessionCookie
)

$projectRoot = $PSScriptRoot
$sessionFile = Join-Path $projectRoot ".session"

# Validate the session cookie format (should be a long hex string)
if ($SessionCookie -notmatch '^[a-f0-9]{96,}$') {
    Write-Host "WARNING: Session cookie format looks unusual." -ForegroundColor Yellow
    Write-Host "Expected a long hexadecimal string (96+ characters)" -ForegroundColor Yellow
    Write-Host "Current length: $($SessionCookie.Length) characters" -ForegroundColor Gray
    Write-Host ""
    $response = Read-Host "Continue anyway? (y/N)"
    if ($response -ne 'y' -and $response -ne 'Y') {
        Write-Host "Cancelled." -ForegroundColor Gray
        exit 0
    }
}

# Save the session cookie
Set-Content -Path $sessionFile -Value $SessionCookie -NoNewline

Write-Host "✓ Session cookie saved to: $sessionFile" -ForegroundColor Green
Write-Host ""
Write-Host "You can now download inputs using:" -ForegroundColor Cyan
Write-Host "  .\GetInput.ps1 -Day 1" -ForegroundColor White
Write-Host "  .\GetInput.ps1           (auto-detects today's day in December)" -ForegroundColor White
Write-Host ""
Write-Host "Note: Keep .session file private! It's already in .gitignore" -ForegroundColor Yellow
