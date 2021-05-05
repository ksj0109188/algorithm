package May_2021.Week1;

import java.util.Scanner;

public class B2225 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int k = scanner.nextInt();
        int mod =  1000000000;
        long[][] DP = new long[n + 1][k + 1];

        for (int i = 1; i <= k; i++) {
            DP[0][0] = 1;
            for (int j = 0; j <= n; j++) {
                for (int l = 0; l <= j; l++) {
                    DP[j][i] += DP[j-l][i-1];
                    DP[j][i] %= mod;
                }
            }
        }
        System.out.println(DP[n][k]);
        scanner.close();
    }
}
