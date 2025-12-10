using AdventOfCode;

// Parse command line arguments
int? dayToRun = null;

if (args.Length > 0 && int.TryParse(args[0], out int day))
{
    dayToRun = day;
}

// Run the specified day or the latest available day
DayRunner.Run(dayToRun);
