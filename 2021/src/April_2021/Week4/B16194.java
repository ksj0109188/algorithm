package April_2021.Week4;

import java.util.Scanner;

public class B16194 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int[] DP = new int[N + 1];
        int[] P = new int[N + 1];
        for (int i = 1; i < N + 1; i++) {
            P[i] = scanner.nextInt();

        }
        for (int i = 1; i < N + 1; i++) {
            for (int j = 1; j <= i; j++) {
                if (DP[i] == 0 || DP[i] > DP[i - j] + P[j]) {
                    DP[i] = DP[i - j] + P[j];
                }
            }
        }
        System.out.println(DP[N]);
        scanner.close();
    }
}
