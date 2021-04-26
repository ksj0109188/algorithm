package April_2021.Week4;

import java.util.Scanner;

public class B11727 {
    static int[] dp;

    //    Top Down
//    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        int n = scanner.nextInt();
//        dp = new int[n + 1];
//        dp[0] = dp[1] = 1;
//        if (n >= 2) {
//            dp[2] = 3;
//        }
//        System.out.println(go(n));
//        scanner.close();
//    }
//
//    private static int go(int index) {
//        if (index < 3) {
//            return dp[index];
//        }
//        if (dp[index] != 0) {
//            return dp[index];
//        }
//        return dp[index] = ((go(index - 2) * 2) + go(index - 1)) % 10007;
//    }

//        bottom Up
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        dp = new int[n + 1];
       dp[0] = dp[1] = 1;
        if (n >= 2) {
            dp[2] = 3;
        }
        for (int i = 3; i <= n; i++) {
            dp[i] = ((dp[i - 2] * 2) + dp[i - 1]) % 10007;
        }
        System.out.println(dp[n]);
        scanner.close();
    }
}
