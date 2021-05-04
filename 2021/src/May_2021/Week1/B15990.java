package May_2021.Week1;

import java.util.Scanner;
//https://www.acmicpc.net/problem/15990
//1,2,3 더하기 5
public class B15990 {
    static long[][] DP = new long[100001][4];
    static long mod = 1000000009L;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        for (int i = 1; i < DP.length; i++) {
            if (i - 1 >= 0) {
                DP[i][1] = DP[i - 1][2] + DP[i - 1][3];
                if (i == 1) {
                    DP[i][1] = 1;
                }
            }
            if (i - 2 >= 0) {
                DP[i][2] = DP[i - 2][1] + DP[i - 2][3];
                if (i == 2) {
                    DP[2][2] = 1;
                }
            }
            if (i - 3 >= 0) {
                DP[i][3] = DP[i - 3][1] + DP[i - 3][2];
                if (i == 3) {
                    DP[3][3] = 1;
                }
            }
            DP[i][1] %= mod;
            DP[i][2] %= mod;
            DP[i][3] %= mod;
        }
        int T = scanner.nextInt();
        for (int i = 0; i < T; i++) {
            int n = scanner.nextInt();
            System.out.println((DP[n][1] + DP[n][2] + DP[n][3])%mod);
        }
    }
}
