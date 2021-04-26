package April_2021.Week4;

import java.util.Scanner;
//https://www.acmicpc.net/problem/11726
//타일문제1(1월달 복습문제)
public class B11726 {
    static int[] dp;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        dp = new int[n + 1];
        dp[0] = dp[1] = 1;
        System.out.println(go(n));
    }

    private static int go(int index) {
        if (index <= 1) {
            return 1;
        }
        if (dp[index] != 0) {
            return dp[index];
        }
        dp[index] = (go(index - 1) + go(index - 2))%10007;
        return dp[index];
    }


////    Botton-up
//    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        int n = scanner.nextInt();
//        int[] dp = new int[n + 1];
//        dp[0] = dp[1] = 1;
//        for (int i = 2; i <= n; i++) {
//            dp[i] = (dp[i-1]+dp[i-2])%10007;
//        }
//        System.out.println(dp[n]);
//    }
}
