package May_2021.Week2;

import java.util.Scanner;

public class B1932 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[][] tree = new int[n + 1][n + 1];
        int[][] dp = new int[n + 1][n + 1];

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                tree[i][j] = scanner.nextInt();
            }
        }

        dp[1][1] = tree[1][1];

        for (int i = 2; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                dp[i][j] = Math.max(dp[i - 1][j - 1], dp[i - 1][j]) + tree[i][j];
            }
        }

        int result = 0;
        for (int i = 1; i < dp[n].length; i++) {
            result = Math.max(result, dp[n][i]);
        }

        System.out.println(result);
        scanner.close();
    }
}
