param(
    [Parameter(Mandatory = $true)]
    [int]$Day
)

$projectRoot = $PSScriptRoot
$dayNumber = $Day.ToString("D2")
$dayClass = "Day$dayNumber"
$dayFile = Join-Path $projectRoot "Days\$dayClass.cs"
$inputFile = Join-Path $projectRoot "Inputs\day$dayNumber.txt"

# Check if day already exists
if (Test-Path $dayFile) {
    Write-Host "Error: $dayClass already exists at $dayFile" -ForegroundColor Red
    exit 1
}

# Create the Day class file
$dayContent = @"
namespace AdventOfCode.Days;

public class $dayClass : DayBase
{
    public ${dayClass}() : base($Day) { }

    public override object SolvePart1()
    {
        // TODO: Implement Part 1 solution
        return "Not implemented";
    }

    public override object SolvePart2()
    {
        // TODO: Implement Part 2 solution
        return "Not implemented";
    }
}
"@

# Create the input file if it doesn't exist
if (-not (Test-Path $inputFile)) {
    $inputContent = "# Paste your Advent of Code input here"
    Set-Content -Path $inputFile -Value $inputContent -NoNewline
    Write-Host "Created input file: $inputFile" -ForegroundColor Green
}

# Write the day class file
Set-Content -Path $dayFile -Value $dayContent
Write-Host "Created day class: $dayFile" -ForegroundColor Green

Write-Host "`nDay $Day is ready! Edit the following files:" -ForegroundColor Cyan
Write-Host "  - $dayFile" -ForegroundColor Yellow
Write-Host "  - $inputFile" -ForegroundColor Yellow
