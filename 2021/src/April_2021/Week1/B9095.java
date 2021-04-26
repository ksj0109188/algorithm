package April_2021.Week1;

import java.util.Scanner;

//문제 https://www.acmicpc.net/problem/9095
//1,2,3 더하기
public class B9095 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int T = scanner.nextInt();

        for (int i = 0; i < T; i++) {
            int N = scanner.nextInt();
            System.out.println(go(0, 0, N));
        }
        scanner.close();
    }

    private static int go(int count, int sum, int goal) {
        if (sum == goal) return 1;
        if (sum > goal) return 0;
        int result = 0;
        for (int i = 1; i < 4; i++) {
            result += go(count + 1, sum + i, goal);
        }
        return result;
    }
}
