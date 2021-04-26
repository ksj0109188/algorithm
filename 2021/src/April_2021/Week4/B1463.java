package April_2021.Week4;

import java.util.Scanner;

//1월 2주차 복습문제
//1로 만들기(DP기초)
public class B1463 {
    static int[] dp;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int X = scanner.nextInt();
        dp = new int[1000001];
        dp[0] = 0;
        dp[1] = 0;
        for (int i = 2; i <= X; i++) {
            dp[i] = dp[i - 1] + 1;
            if (i % 3 == 0 && dp[i / 3] + 1 < dp[i]) {
                dp[i] = dp[i / 3] + 1;
            }
            if (i % 2 == 0 && dp[i / 2] + 1 < dp[i]) {
                dp[i] = dp[i / 2] + 1;
            }
        }
        System.out.println(dp[X]);
    }
}

////    Top_Down방식
//    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        int X = scanner.nextInt();
//        dp = new int[1000000];
//        dp[1] = 0;
//        System.out.println(go(X));
//
//    }
//    private static int go(int N) {
//        if (N == 1) {
//            return 0;
//        } else if (dp[N] != 0) {
//            return dp[N];
//        }
//
//        dp[N] = go(N - 1) + 1;
//        if (N % 3 == 0) {
//            int temp = go(N / 3) + 1;
//            if (temp < dp[N]) {
//                dp[N] = temp;
//            }
//        }
//        if (N % 2 == 0) {
//            int temp = go(N / 2) + 1;
//            if (temp < dp[N]) {
//                dp[N] = temp;
//            }
//        }
//        return dp[N];
//    }
//}
