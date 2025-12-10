# Advent of Code - C# .NET 9

A structured console application for solving Advent of Code challenges with automatic input loading, benchmarking, and color-coded performance results.

## Features

- 🎯 **Auto-detection**: Automatically runs the latest day implementation
- 📁 **Automatic Input Loading**: Input files are loaded in the base class constructor
- ⚡ **Performance Benchmarking**: Uses accurate timing (10 runs per part)
- 🎨 **Color-coded Results**: Blue (fast) to red (slow) gradient based on execution time
- 📊 **Table Output**: Clean, formatted results display
- 🚀 **Easy Day Creation**: PowerShell script to scaffold new day classes

## Project Structure

```
AdventOfCode/
├── Days/
│   ├── DayBase.cs       # Abstract base class with input loading
│   ├── Day01.cs         # Day 1 implementation
│   └── ...
├── Inputs/
│   ├── day01.txt        # Input for Day 1
│   └── ...
├── Program.cs           # Entry point
├── DayRunner.cs         # Runner with benchmarking
└── AddDay.ps1           # Script to create new day
```

## Usage

### Running Solutions

Run the latest implemented day:

```bash
dotnet run
```

Run a specific day:

```bash
dotnet run 1
dotnet run 5
```

### Downloading Input Files Automatically

First, set up your Advent of Code session cookie (one-time setup):

1. Log in to https://adventofcode.com in your browser
2. Open Developer Tools (F12)
3. Go to Application/Storage → Cookies → https://adventofcode.com
4. Copy the value of the `session` cookie
5. Run:

```powershell
.\SetSession.ps1 -SessionCookie 'your_session_value'
```

Then download inputs:

```powershell
.\GetInput.ps1 -Day 1      # Download input for Day 1
.\GetInput.ps1             # Auto-download for today (if in December)
```

### Creating a New Day

Use the PowerShell script to scaffold a new day:

```powershell
.\AddDay.ps1 -Day 2
```

This creates:

- `Days/Day02.cs` - The day implementation class
- `Inputs/day02.txt` - The input file (placeholder)

### Implementing a Solution

1. Create a new day using the script above
2. Add your Advent of Code input to `Inputs/dayXX.txt`
3. Implement `SolvePart1()` and `SolvePart2()` in `Days/DayXX.cs`

Example:

```csharp
namespace AdventOfCode.Days;

public class Day01 : DayBase
{
    public Day01() : base(1) { }

    public override object SolvePart1()
    {
        // Access input via InputText or InputLines
        return InputLines.Length;
    }

    public override object SolvePart2()
    {
        return InputText.Length;
    }
}
```

## Performance Color Guide

- 🔵 **Blue** (< 1ms): Excellent
- 🟢 **Green** (1-10ms): Very Good
- 🟡 **Yellow** (10-100ms): Good
- 🟠 **Orange** (100-1000ms): Acceptable
- 🔴 **Red** (> 1000ms): Needs Optimization

## Base Class Features

The `DayBase` class automatically provides:

- `InputText`: Full input as a single string
- `InputLines`: Input split by lines
- `DayNumber`: The day number

## Automatic Input Downloads

The project includes scripts to automatically download puzzle inputs from Advent of Code.

### One-Time Setup

1. Log in to https://adventofcode.com
2. Get your session cookie:
   - Press F12 (Developer Tools)
   - Go to: Application → Cookies → https://adventofcode.com
   - Copy the value of the `session` cookie
3. Save it: `.\SetSession.ps1 -SessionCookie 'your_value'`

### Download Inputs

```powershell
.\GetInput.ps1 -Day 1    # Download Day 1 input
.\GetInput.ps1           # Auto-download for today
```

### All-in-One Workflow

Use `NewDay.ps1` to download input + create day class in one command:

```powershell
.\NewDay.ps1 -Day 1      # Sets up everything for Day 1
```

**Important:** Keep your `.session` file private! It's automatically ignored by git.

## Requirements

- .NET 9.0
- BenchmarkDotNet (automatically installed)

## Building

```bash
dotnet build
```

## Example Output

```
╔═══════════════════════════════════════╗
║     Advent of Code - Day 01        ║
╚═══════════════════════════════════════╝

┌────────┬─────────────────────────┬────────────────────┐
│  Part  │         Result          │    Avg Time (ms)   │
├────────┼─────────────────────────┼────────────────────┤
│   1    │ 12345                   │           0.0234 │
│   2    │ 67890                   │           0.1456 │
└────────┴─────────────────────────┴────────────────────┘

Benchmarked with 10 runs per part
```
