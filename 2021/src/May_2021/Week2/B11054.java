package May_2021.Week2;

import java.util.Scanner;

public class B11054 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] a = new int[n];
        int[] dp = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = scanner.nextInt();
        }

        for (int i = 0; i < n; i++) {
            dp[i] = 1;
            for (int j = 0; j < i; j++) {
                if (a[j] < a[i] && dp[i] < dp[j] + 1) {
                    dp[i] = dp[j] + 1;
                }
            }
        }
        int[] dp2 = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            dp2[i] = 1;
            for (int j = i + 1; j < n; j++) {
                if (a[i] > a[j] && dp2[i] < dp2[j] + 1) {
                    dp2[i] = dp2[j] + 1;
                }
            }
        }
        int result = 0;
        for (int i = 0; i < n; i++) {
            result = Math.max(result, dp[i] + dp2[i] - 1);
        }
        System.out.println(result);
    }
}
