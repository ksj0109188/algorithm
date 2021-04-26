package April_2021.Week3;

import java.util.Scanner;

//https://www.acmicpc.net/problem/6603
//로또 (재귀 방식으로 풀이)
public class B6603_1 {
    static int[] S;
    static boolean[] check;
    static int[] result = new int[6];

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int K = 1;
        while (K!=0) {
            K = scanner.nextInt();
            S = new int[K];
            check = new boolean[K];
            for (int i = 0; i < K; i++) {
                S[i] = scanner.nextInt();
            }
            go(0, 0, K);
            System.out.println();
        }
        scanner.close();
    }

    private static void go(int start, int index, int k) {
        if (index == 6) {
            for (int i = 0; i < 6; i++) {
                System.out.print(S[result[i]] + " ");
            }
            System.out.println();
            return;
        }
        for (int i = start; i < k; i++) {
            if (check[i]) continue;
            result[index] = i;
            check[i] = true;
            go(i + 1, index + 1, k);
            check[i] = false;
        }

    }
}
