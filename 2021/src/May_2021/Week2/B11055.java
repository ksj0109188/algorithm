package May_2021.Week2;

import java.util.Scanner;

public class B11055 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] a = new int[n];
        int[] dp = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = scanner.nextInt();
        }
        for (int i = 0; i < n; i++) {
            dp[i] = a[i];
            for (int j = 0; j < i; j++) {
                if (a[j] < a[i] && dp[i] < dp[j]+a[i]) {
                    dp[i] = dp[j] + a[i];
                }
            }
        }

        int result = 0;
        for (int i = 0; i < n; i++) {
            result = Math.max(dp[i], result);
        }
        System.out.println(result);
        scanner.close();

    }
}
