namespace AdventOfCode.Days;

public abstract class DayBase
{
    protected string InputText { get; }
    protected string[] InputLines { get; }
    public int DayNumber { get; }

    protected DayBase(int dayNumber)
    {
        DayNumber = dayNumber;
        var inputPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Inputs", $"day{dayNumber:D2}.txt");

        if (File.Exists(inputPath))
        {
            InputText = File.ReadAllText(inputPath);
            InputLines = File.ReadAllLines(inputPath);
        }
        else
        {
            InputText = string.Empty;
            InputLines = Array.Empty<string>();
            Console.WriteLine($"Warning: Input file not found at {inputPath}");
        }
    }

    public abstract object SolvePart1();
    public abstract object SolvePart2();
}
