package May_2021.Week1;

import java.util.Scanner;

public class B14002 {
    static int[] items;
    static int[] A;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();

        A = new int[N];
        int[] DP = new int[N];
        items = new int[N];
        for (int i = 0; i < N; i++) {
            A[i] = scanner.nextInt();
        }

        for (int i = 0; i < N; i++) {
            DP[i] = 1;
            items[i] = -1;
            for (int j = 0; j < i; j++) {
                if (A[j] < A[i] && DP[i] < DP[j] + 1) {
                    DP[i] = DP[j] + 1;
                    items[i] = j;
                }
            }
        }

        int maxValue = 0;
        int resultLisIndex = 0;
        for (int i = 0; i < N; i++) {
            if (maxValue < DP[i]) {
                maxValue = DP[i];
                resultLisIndex = i;
            }
        }

        System.out.println(maxValue);
        go(resultLisIndex);
    }

    private static void go(int i) {
        if (i == -1) {
            return;
        }
        go(items[i]);
        System.out.print(A[i] + " ");
    }
}
