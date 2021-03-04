package March_2021.FirstWeek;

import java.util.Scanner;

// https://www.acmicpc.net/status?user_id=ksj0109188&problem_id=15652&from_mine=1
// M과 N 4번째 순서 관점에서 푼 문제.
public class B15652_1 {
    static StringBuilder stringBuilder = new StringBuilder();
    static int[] cnt = new int[10];
    static int[] s = new int[10];

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();

        System.out.println(go(0, 0, N, M));
    }

    private static StringBuilder go(int index, int count, int n, int m) {
        if (count == m) {
            for (int i = 1; i <= n; i++) {
                for (int j = 0; j < cnt[i]; j++) {
                    stringBuilder.append(i);
                    stringBuilder.append(" ");
                }
            }
            stringBuilder.append("\n");
            return stringBuilder;
        }
        if (index > n) return stringBuilder;
        for (int i = m - count; i >= 1; i--) {  //사전순 출력을 위한 반복문. -> 1111 -> 1112 -> 1122 처럼 오름차순.
            cnt[index] = i;
            go(index + 1, i - 1, n, m);
        }
        return stringBuilder;
    }
}
