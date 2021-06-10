package June_2021.Week2;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Pair {
    int min;
    int max;

    Pair(int min, int max) {
        this.min = min;
        this.max = max;
    }
}

public class B677 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = scanner.nextInt();
        }
        int plus = scanner.nextInt();
        int minus = scanner.nextInt();
        int multiplication = scanner.nextInt();
        int division = scanner.nextInt();

        Pair ans = solve(a, 1, a[0], plus, minus, multiplication, division);
        System.out.println(ans.max);
        System.out.println(ans.min);
    }

    private static Pair solve(int[] a, int index, int cur, int plus, int minus, int multiplication, int division) {
        if (index == a.length) {
            return new Pair(cur, cur);
        }
        ArrayList<Pair> res = new ArrayList<>();
        if (plus > 0) {
            res.add(solve(a, index + 1, cur + a[index], plus - 1, minus, multiplication, division));
        }
        if (minus > 0) {
            res.add(solve(a, index + 1, cur - a[index], plus, minus - 1, multiplication, division));
        }
        if (multiplication > 0) {
            res.add(solve(a, index + 1, cur * a[index], plus, minus, multiplication - 1, division));
        }
        if (division > 0) {
            res.add(solve(a, index + 1, cur / a[index], plus, minus, multiplication, division - 1));
        }
        Pair ans = res.get(0);
        for (Pair results : res) {
            if (ans.max < results.max) {
                ans.max = results.max;
            }
            if (ans.min > results.min) {
                ans.min = results.min;
            }
        }
        return ans;

    }

}
