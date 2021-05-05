package May_2021.Week1;

import java.util.Scanner;

public class B11053 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int[] A = new int[N];
        int[] DP = new int[N];

        for (int i = 0; i < N; i++) {
            A[i] = scanner.nextInt();
        }


        for (int i = 0; i < N; i++) {
            DP[i] = 1;
            for (int j = 0; j < i; j++) {
                if (A[j] < A[i] && DP[i]<DP[j]+1) {
                    DP[i]=DP[j]+1;
                }
            }
        }
        int result = 0;
        for (int i = 0; i < N; i++) {
            result = Math.max(DP[i], result);
        }
        System.out.println(result);
        scanner.close();
    }
}
