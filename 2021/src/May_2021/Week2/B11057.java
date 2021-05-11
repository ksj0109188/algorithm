package May_2021.Week2;

import java.util.Scanner;

public class B11057 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int mod = 10007;
        long[][] DP = new long[n + 1][10];

        for (int i = 0; i < 10; i++) {
            DP[1][i] = 1;
        }

        for (int i = 2; i <= n; i++) {
            for (int j = 0; j < 10; j++) {
                for (int k = 0; k <= j; k++) {
                    DP[i][j] += DP[i-1][k];
                    DP[i][j] %= mod;
                }
            }
        }

        long result = 0;
        for (int i = 0; i < 10; i++) {
            result += DP[n][i];
        }
        System.out.println(result%mod);
    }
}
