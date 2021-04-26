package April_2021.FourthWeek;

import java.util.Scanner;

public class B11052 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int[] D = new int[N + 1];
        int[] P = new int[N + 1];
        D[0] = P[0] = 0;
        for (int i = 1; i < N + 1; i++) {
            P[i] = scanner.nextInt();
        }

        for (int i = 1; i < N + 1; i++) {
            for (int j = 1; j <= i; j++) {
                if (D[i] < D[i - j] + P[j]) {
                    D[i] = D[i - j] + P[j];
                }
            }
        }
        System.out.println(D[N]);
    }
}