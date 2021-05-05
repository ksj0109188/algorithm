package May_2021.Week1;

import java.util.Scanner;

public class B1699 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] DP = new int[n + 1];

        int min = Integer.MAX_VALUE;
        for (int i = 1; i <= n; i++) {
            DP[i] = i;
            for (int j = 1; j * j <= i; j++) {
                if (DP[i] > DP[i - j * j] + 1) {
                    DP[i] = DP[i - j * j] + 1;
                }
            }
        }
        System.out.println(DP[n]);
    }
}
