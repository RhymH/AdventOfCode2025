namespace AdventOfCode.Days;

public class Day01 : DayBase
{
    public Day01() : base(1) { }

    public override object SolvePart1()
    {
        int currentValue = 50;

        int count = 0;

        for (int i = 0; i < InputLines.Length; i++)
        {
            var l = InputLines[i];

            var num = int.Parse(l.Substring(1));

            if (l.StartsWith('L'))
            {
                currentValue -= num;
            }
            else
            {
                currentValue += num;
            }

            currentValue = currentValue % 100;

            if (currentValue == 0)
            {
                count++;
            }
        }


        return count;
    }

    public override object SolvePart2()
    {
        int currentValue = 50;

        int count = 0;

        for (int i = 0; i < InputLines.Length; i++)
        {
            var l = InputLines[i];

            var num = int.Parse(l.Substring(1));

            for (int n = 0; n < num; n++)
            {
                if (l.StartsWith('L'))
                {
                    currentValue --;
                }
                else
                {
                    currentValue ++;
                }

                currentValue = (currentValue + 100) % 100;

                if (currentValue == 0)
                {
                    count++;
                }
            }
        }


        return count;
    }
}
