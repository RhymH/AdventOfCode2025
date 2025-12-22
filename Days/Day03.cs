namespace AdventOfCode.Days;

public class Day03 : DayBase
{
    public Day03() : base(3) { }

    public override object SolvePart1()
    {
        int result = 0;

        for (int i = 0; i < InputLines.Length; i++)
        {
            var line = InputLines[i];

            var bank = line.Select(x => int.Parse(x.ToString())).ToArray();

            int biggest = 0;
            int biggestIndex = 0;

            for (int j = 0; j < line.Length - 1; j++) // don't take last
            {
                if (bank[j] > biggest)
                {
                    biggest = bank[j];
                    biggestIndex = j;
                }
            }

            int secondBiggest = 0;

            for (int j = biggestIndex + 1; j < line.Length; j++) // skip the previous ones
            {
                if (bank[j] > secondBiggest)
                {
                    secondBiggest = bank[j];
                }
            }

            var r = int.Parse($"{biggest}{secondBiggest}");

            result += r;
        }


        return result;
    }

    public override object SolvePart2()
    {
        long result = 0;

        for (int i = 0; i < InputLines.Length; i++)
        {
            var line = InputLines[i];

            var bank = line.Select(x => int.Parse(x.ToString())).ToArray();


            int biggestIndex = -1;

            var resultS = "";

            for (int x = 0; x < 12; x++)
            {

                int startIndex = biggestIndex >= x ? biggestIndex + 1 : x;

                int biggest = FindBiggest(bank, startIndex, line.Length - (12 - x), out biggestIndex);

                resultS = resultS + biggest;
            }

            var r = long.Parse(resultS);


            result += r;
        }


        return result;
    }

    private static int FindBiggest(int[] bank, int startIndex, int endIndex, out int biggestIndex)
    {
        int biggest = 0;
        biggestIndex = 0;
        for (int j = startIndex; j <= endIndex; j++) // don't take last
        {
            if (bank[j] > biggest)
            {
                biggest = bank[j];
                biggestIndex = j;
            }
        }

        return biggest;
    }
}
