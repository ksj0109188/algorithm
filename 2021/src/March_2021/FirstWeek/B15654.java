package March_2021.FirstWeek;

import java.util.Arrays;
import java.util.Scanner;
//https://www.acmicpc.net/status?user_id=ksj0109188&problem_id=15654&from_mine=1
//M과 N 5
public class B15654 {
    static boolean[] c = new boolean[10];
    static int[] s = new int[10];
    static int[] data;
    static StringBuilder stringBuilder = new StringBuilder();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        data = new int[N+1];
        for (int i = 1; i <= N; i++) {
            data[i] = scanner.nextInt();
        }
        Arrays.sort(data);
        go(1, N, M);
        System.out.println(stringBuilder);
    }

    private static void go(int index, int n, int m) {
        if (index == m+1 ) {
            for (int i = 1; i <= m; i++) {
                int key = s[i];
                stringBuilder.append(data[key]);
                if(i!=m)stringBuilder.append(" ");
            }
            stringBuilder.append("\n");
            return;
        }
        // s는 수를 저장, index는 자릿수
        for (int i = 1; i <= n; i++) {
            if (c[i]) continue;
            c[i] = true;
            s[index] = i;
            go(index + 1, n, m);
            c[i] = false;
        }
    }
}
