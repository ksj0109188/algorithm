package June_2021.Week2;

import java.util.Scanner;

public class B14225 {
    static boolean[] ans = new boolean[20 * 100000];

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] s = new int[n];
        for (int i = 0; i < n; i++) {
            s[i] = scanner.nextInt();
        }

        solve(s, 0, 0, n);

        for (int i = 0; i < ans.length; i++) {
            if (!ans[i]) {
                System.out.println(i);
                break;
            }

        }

    }

    private static void solve(int[] s, int index, int sum, int n) {
        if (index == n) {
            ans[sum] = true;
            return;
        }
        solve(s, index + 1, sum + s[index], n);
        solve(s, index + 1, sum, n);
    }
}
