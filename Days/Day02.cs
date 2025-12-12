namespace AdventOfCode.Days;

public class Day02 : DayBase
{
    public Day02() : base(2) { }

    public override object SolvePart1()
    {
        long result = 0;

        var tRanges = InputText.Split(",");

        var ranges = tRanges.Select(x => x.Split("-").Select(long.Parse).ToArray()).ToArray();

        for (int i = 0; i < ranges.Count(); i++)
        {
            var range = ranges[i];


            if (range[0].ToString().Length % 2 == 1 && range[1].ToString().Length % 2 == 1) //skip impossible
            {
                continue;
            }


            for (long j = range[0]; j <= range[1]; j++)
            {
                var s = j.ToString();

                if (s.Length % 2 == 1)  //skip impossible
                {
                    continue;
                }

                if (s.Substring(0, s.Length / 2) == s.Substring(s.Length / 2))
                {
                    result += j;
                }

            }
        }

        return result;
    }

    public override object SolvePart2()
    {
        long result = 0;

        var tRanges = InputText.Split(",");

        var ranges = tRanges.Select(x => x.Split("-").Select(long.Parse).ToArray()).ToArray();

        for (int i = 0; i < ranges.Count(); i++)
        {
            var range = ranges[i];

            for (long j = range[0]; j <= range[1]; j++)
            {
                var s = j.ToString();

                for (int k = 1; k <= s.Length / 2; k++)
                {
                    if (s.Length % k != 0) //skip impossible
                    {
                        continue;
                    }

                    var p = s.Substring(0, k);

                    var invalidId = true;

                    for (int x = 1; x < s.Length / k; x++)
                    {

                        if (p != s.Substring(k * x, k))
                        {
                            invalidId = false;
                            break;
                        }
                    }

                    if (invalidId)
                    {
                        result += j;
                        break;
                    }

                }
            }
        }

        return result;
    }
}
