package May_2021.Week1;

import java.util.Scanner;
//https://www.acmicpc.net/problem/10844
//쉬운 계단 수
public class B10844 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        long[][] DP = new long[N + 1][10];
        for (int i = 1; i < 10; i++) {
            DP[1][i] = 1;
        }
        for (int i = 2; i <= N; i++) {
            for (int j = 0; j <= 9; j++) {
                if (j - 1 >= 0) {
                    DP[i][j] += DP[i - 1][j - 1];
                }
                if (j + 1 <= 9) {
                    DP[i][j] += DP[i - 1][j + 1];
                }
                DP[i][j] %= 1000000000L;
            }
        }
        long result = 0;
        for (int i = 0; i < 10; i++) {
            result += DP[N][i];
        }
        result%=1000000000L;
        System.out.println(result);
        scanner.close();
    }
}
