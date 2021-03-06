package March_2021.FirstWeek;

import java.util.Scanner;

public class B15651 {
    //    https://www.acmicpc.net/problem/15651
//    N과 M 3
    static int[] s = new int[10];
    static StringBuilder stringBuilder = new StringBuilder();
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        System.out.println(go(0, N, M));
        scanner.close();
    }

    private static StringBuilder go(int index, int n, int m) {
        if (index == m) {
            for (int i = 0; i < m; i++) {
                stringBuilder.append(s[i]);
                if (i != n) stringBuilder.append(" ");
            }
            stringBuilder.append("\n");
            return stringBuilder;
        }
        for (int i = 1; i <= n; i++) {
            s[index] = i;
            go(index + 1, n, m);
        }
        return stringBuilder;
    }
}
