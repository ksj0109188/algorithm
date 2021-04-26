package April_2021.Week3;

import java.util.Scanner;

//https://www.acmicpc.net/problem/10971
//외판원 순회2
//  N*N!에서
//  if order[0]!=1 breeak문 추가로 N*(N!/N) -> N*(N-1)!
public class B10971 {
    static int[][] W;
    static int[] order;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        W = new int[N][N];
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                W[i][j] = scanner.nextInt();
            }
        }
        order = new int[N];
        for (int i = 0; i < N; i++) {
            order[i] = i;
        }
        int result = Integer.MAX_VALUE;
        do {
            if(order[0]!=1) continue;
            boolean OK = true;
            int sum = 0;
            for (int i = 0; i < N - 1; i++) {
                if (W[order[i]][order[i + 1]] == 0) {
                    OK = false;
                } else {
                    sum += W[order[i]][order[i + 1]];
                }
            }
            if (OK && W[order[N - 1]][order[0]] != 0) {
                sum += W[order[N - 1]][order[0]];
                result = Math.min(sum, result);
            }
        } while (next_permutation());
        System.out.println(result);
        scanner.close();
    }

    private static boolean next_permutation() {
        int i = order.length - 1;
        while (i >= 1 && order[i - 1] >= order[i]) i -= 1;
        if (i == 0) {
            return false;
        }

        int j = order.length - 1;
        while (order[i - 1] >= order[j]) j -= 1;

        int temp = order[i - 1];
        order[i - 1] = order[j];
        order[j] = temp;

        j = order.length - 1;
        while (i < j) {
            temp = order[i];
            order[i] = order[j];
            order[j] = temp;
            i += 1;
            j -= 1;
        }
        return true;
    }
}
