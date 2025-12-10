# Quick Reference Guide for Advent of Code Project

Write-Host "`n╔═══════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  Advent of Code - Quick Reference Guide  ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "📋 COMMON COMMANDS:" -ForegroundColor Yellow
Write-Host "  Run latest day:      " -NoNewline; Write-Host "dotnet run" -ForegroundColor Green
Write-Host "  Run specific day:    " -NoNewline; Write-Host "dotnet run <day>" -ForegroundColor Green
Write-Host "  Create new day:      " -NoNewline; Write-Host ".\AddDay.ps1 -Day <day>" -ForegroundColor Green
Write-Host "  Download input:      " -NoNewline; Write-Host ".\GetInput.ps1 -Day <day>" -ForegroundColor Green
Write-Host "  Setup session:       " -NoNewline; Write-Host ".\SetSession.ps1 -SessionCookie '<cookie>'" -ForegroundColor Green
Write-Host "  Build project:       " -NoNewline; Write-Host "dotnet build" -ForegroundColor Green
Write-Host ""

Write-Host "📁 PROJECT STRUCTURE:" -ForegroundColor Yellow
Write-Host "  Days/                - Day implementations (Day01.cs, Day02.cs, ...)"
Write-Host "  Inputs/              - Input files (day01.txt, day02.txt, ...)"
Write-Host "  DayRunner.cs         - Benchmarking and execution logic"
Write-Host "  AddDay.ps1           - Script to scaffold new days"
Write-Host ""

Write-Host "🎨 PERFORMANCE COLORS:" -ForegroundColor Yellow
Write-Host "  " -NoNewline; Write-Host "Blue   " -ForegroundColor Blue -NoNewline; Write-Host "  < 1ms       (Excellent)"
Write-Host "  " -NoNewline; Write-Host "Green  " -ForegroundColor Green -NoNewline; Write-Host "  1-10ms      (Very Good)"
Write-Host "  " -NoNewline; Write-Host "Yellow " -ForegroundColor Yellow -NoNewline; Write-Host "  10-100ms    (Good)"
Write-Host "  " -NoNewline; Write-Host "Orange " -ForegroundColor DarkYellow -NoNewline; Write-Host "  100-1000ms  (Acceptable)"
Write-Host "  " -NoNewline; Write-Host "Red    " -ForegroundColor Red -NoNewline; Write-Host "  > 1000ms    (Needs optimization)"
Write-Host ""

Write-Host "💡 WORKFLOW:" -ForegroundColor Yellow
Write-Host "  1. Create a new day: .\AddDay.ps1 -Day X"
Write-Host "  2. Paste your input into Inputs/dayXX.txt"
Write-Host "  3. Implement SolvePart1() and SolvePart2() in Days/DayXX.cs"
Write-Host "  4. Run: dotnet run"
Write-Host ""

Write-Host "🔍 AVAILABLE IN BASE CLASS:" -ForegroundColor Yellow
Write-Host "  InputText            - Full input as string"
Write-Host "  InputLines           - Input split by lines (string[])"
Write-Host "  DayNumber            - Current day number (int)"
Write-Host ""

Write-Host "Happy coding! 🎄" -ForegroundColor Green
Write-Host ""
