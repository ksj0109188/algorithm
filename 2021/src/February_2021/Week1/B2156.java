package February_2021.Week1;

import java.util.Scanner;

public class B2156 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int[] dp = new int[N];
        int[] wine = new int[N];
        for (int i = 0; i < N; i++) {
            wine[i] = scanner.nextInt();
        }

        dp[0] = wine[0];
        if (N > 1) {
            dp[1] = wine[1] + wine[0];
        }
        if (N > 2) {
            dp[2] = Math.max(dp[1], Math.max(wine[2] + dp[0], wine[2] + wine[1]));
        }
        if (N > 3) {
            for (int i = 3; i < N; i++) {
                dp[i] = Math.max(wine[i] + dp[i - 2], wine[i] + wine[i - 1] + dp[i - 3]);
                dp[i] = Math.max(dp[i], dp[i - 1]);
            }
        }
        System.out.println(dp[N - 1]);
    }
}
