using System.Diagnostics;
using System.Reflection;
using System.Text;

namespace AdventOfCode;

public class DayRunner
{
    private const int MaxRuns = 10;

    public static void Run(int? specificDay = null)
    {
        var days = GetAvailableDays();

        if (days.Count == 0)
        {
            Console.WriteLine("No day implementations found. Create a new day using AddDay.ps1");
            return;
        }

        var dayToRun = specificDay ?? days.Max();

        if (!days.Contains(dayToRun))
        {
            Console.WriteLine($"Day {dayToRun} not found. Available days: {string.Join(", ", days)}");
            return;
        }

        RunDay(dayToRun);
    }

    private static List<int> GetAvailableDays()
    {
        var dayType = typeof(Days.DayBase);
        var assembly = Assembly.GetExecutingAssembly();

        return assembly.GetTypes()
            .Where(t => t.IsClass && !t.IsAbstract && t.IsSubclassOf(dayType))
            .Select(t =>
            {
                var match = System.Text.RegularExpressions.Regex.Match(t.Name, @"Day(\d+)");
                return match.Success ? int.Parse(match.Groups[1].Value) : 0;
            })
            .Where(n => n > 0)
            .OrderBy(n => n)
            .ToList();
    }

    private static void RunDay(int dayNumber)
    {
        var dayType = Assembly.GetExecutingAssembly()
            .GetTypes()
            .FirstOrDefault(t => t.Name == $"Day{dayNumber:D2}" && t.IsSubclassOf(typeof(Days.DayBase)));

        if (dayType == null)
        {
            Console.WriteLine($"Day {dayNumber} implementation not found.");
            return;
        }

        var day = (Days.DayBase)Activator.CreateInstance(dayType)!;

        Console.WriteLine($"\n╔═══════════════════════════════════════╗");
        Console.WriteLine($"║     Advent of Code - Day {dayNumber:D2}           ║");
        Console.WriteLine($"╚═══════════════════════════════════════╝\n");

        // Benchmark Part 1
        var (result1, time1) = BenchmarkPart(() => day.SolvePart1());

        // Benchmark Part 2
        var (result2, time2) = BenchmarkPart(() => day.SolvePart2());

        // Display results in a table
        DisplayResults(result1, time1, result2, time2);
    }

    private static (object result, double avgTimeMs) BenchmarkPart(Func<object> solve)
    {
        // Warm-up run
        var result = solve();

        // Benchmark runs
        var times = new List<double>();
        var sw = Stopwatch.StartNew();

        for (int i = 0; i < MaxRuns; i++)
        {
            sw.Restart();
            result = solve();
            sw.Stop();
            times.Add(sw.Elapsed.TotalMilliseconds);
        }

        var avgTime = times.Average();
        return (result, avgTime);
    }

    private static void DisplayResults(object result1, double time1, object result2, double time2)
    {
        Console.WriteLine("┌────────┬─────────────────────────┬────────────────────┐");
        Console.WriteLine("│  Part  │         Result          │    Avg Time (ms)   │");
        Console.WriteLine("├────────┼─────────────────────────┼────────────────────┤");

        // Part 1
        Console.Write("│   1    │ ");
        Console.Write($"{result1,-23}".Substring(0, Math.Min(23, result1.ToString()!.Length)).PadRight(23));
        Console.Write(" │ ");
        WriteColoredTime(time1);
        Console.WriteLine("   │");

        // Part 2
        Console.Write("│   2    │ ");
        Console.Write($"{result2,-23}".Substring(0, Math.Min(23, result2.ToString()!.Length)).PadRight(23));
        Console.Write(" │ ");
        WriteColoredTime(time2);
        Console.WriteLine("   │");

        Console.WriteLine("└────────┴─────────────────────────┴────────────────────┘");
        Console.WriteLine($"\nBenchmarked with {MaxRuns} runs per part\n");
    }

    private static void WriteColoredTime(double timeMs)
    {
        // Color gradient from blue (fast) to red (slow)
        // < 1ms = blue
        // 1-10ms = green
        // 10-100ms = yellow
        // 100-1000ms = orange
        // > 1000ms = red

        ConsoleColor color;
        if (timeMs < 1)
            color = ConsoleColor.Blue;
        else if (timeMs < 10)
            color = ConsoleColor.Green;
        else if (timeMs < 100)
            color = ConsoleColor.Yellow;
        else if (timeMs < 1000)
            color = ConsoleColor.DarkYellow;
        else
            color = ConsoleColor.Red;

        var oldColor = Console.ForegroundColor;
        Console.ForegroundColor = color;
        Console.Write($"{timeMs,16:F4}");
        Console.ForegroundColor = oldColor;
    }
}
