package April_2021.FourthWeek;

import java.util.Scanner;

public class B9095 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int t = scanner.nextInt();
        for (int i = 0; i < t; i++) {
            int n = scanner.nextInt();
            int[] dp = new int[n + 1];
            dp[0] = 1;
            dp[1] = 1;
            if (n > 1) {
                dp[2] = 2;
            }
            for (int j = 3; j < n + 1; j++) {
                dp[j] = dp[j - 1] + dp[j - 2] + dp[j - 3];
            }
            System.out.println(dp[n]);
        }
    }
}
