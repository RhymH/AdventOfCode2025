# Quick Start Guide - Advent of Code Automatic Input Download

Write-Host "`n╔══════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  Advent of Code - Quick Start Guide         ║" -ForegroundColor Green
Write-Host "╚══════════════════════════════════════════════════╝`n" -ForegroundColor Green

Write-Host "🎄 FIRST TIME SETUP (One-time only):" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Log in to Advent of Code:" -ForegroundColor Cyan
Write-Host "   → Open: " -NoNewline; Write-Host "https://adventofcode.com" -ForegroundColor White
Write-Host "   → Log in with Google/GitHub/Twitter/Reddit"
Write-Host ""

Write-Host "2. Get your session cookie:" -ForegroundColor Cyan
Write-Host "   → Press F12 (Developer Tools)"
Write-Host "   → Go to: Application → Storage → Cookies → https://adventofcode.com"
Write-Host "   → Find the 'session' cookie"
Write-Host "   → Copy its VALUE (long hexadecimal string)"
Write-Host ""

Write-Host "3. Save your session:" -ForegroundColor Cyan
Write-Host "   → Run: " -NoNewline
Write-Host ".\SetSession.ps1 -SessionCookie 'paste_your_value_here'" -ForegroundColor Green
Write-Host ""

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""

Write-Host "🚀 DAILY WORKFLOW:" -ForegroundColor Yellow
Write-Host ""
Write-Host "Option A - Full Automatic (Recommended):" -ForegroundColor Cyan
Write-Host "   " -NoNewline; Write-Host ".\NewDay.ps1 -Day 1" -ForegroundColor Green
Write-Host "   → Downloads input + Creates day class + Opens files"
Write-Host ""

Write-Host "Option B - Manual Steps:" -ForegroundColor Cyan
Write-Host "   1. " -NoNewline; Write-Host ".\GetInput.ps1 -Day 1  " -ForegroundColor Green -NoNewline; Write-Host "  # Download input"
Write-Host "   2. " -NoNewline; Write-Host ".\AddDay.ps1 -Day 1    " -ForegroundColor Green -NoNewline; Write-Host "  # Create day class"
Write-Host "   3. Edit Days/Day01.cs and implement your solution"
Write-Host "   4. " -NoNewline; Write-Host "dotnet run             " -ForegroundColor Green -NoNewline; Write-Host "  # Run and benchmark"
Write-Host ""

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""

Write-Host "📚 USEFUL COMMANDS:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Run today's puzzle:          " -NoNewline; Write-Host "dotnet run" -ForegroundColor Green
Write-Host "  Run specific day:            " -NoNewline; Write-Host "dotnet run 5" -ForegroundColor Green
Write-Host "  Download input for today:    " -NoNewline; Write-Host ".\GetInput.ps1" -ForegroundColor Green
Write-Host "  Download input for any day:  " -NoNewline; Write-Host ".\GetInput.ps1 -Day 10" -ForegroundColor Green
Write-Host "  View all commands:           " -NoNewline; Write-Host ".\Help.ps1" -ForegroundColor Green
Write-Host ""

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""

Write-Host "⚠️  IMPORTANT NOTES:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  • Keep your .session file private (already in .gitignore)" -ForegroundColor Red
Write-Host "  • Session cookies expire - re-run SetSession.ps1 if downloads fail"
Write-Host "  • Inputs only available after puzzle unlocks (midnight EST)"
Write-Host "  • Be respectful: Don't spam the AoC servers"
Write-Host ""

Write-Host "Ready to code! 🎄✨" -ForegroundColor Green
Write-Host ""
