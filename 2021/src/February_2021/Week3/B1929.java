package February_2021.Week3;

import java.util.Scanner;
// https://www.acmicpc.net/problem/1929
// 1929
public class B1929 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int M = scanner.nextInt();
        int N = scanner.nextInt();
        boolean[] result = (check_prime(M, N));
        for (int i = M; i <= N; i++) {
            if (result[i] == false) {
                System.out.println(i);
            }
        }
        scanner.close();
    }

    private static boolean[] check_prime(int m, int n) {
        boolean[] primeNumbers = new boolean[n + 1];
        primeNumbers[0] = primeNumbers[1] = true; // 지워짐
        for (int i = 2; i * i <= n; i++) {
            if (primeNumbers[i] == true) {
                continue;
            }
            for (int j = i + i; j <= n; j += i) {
                primeNumbers[j] = true;
            }
        }
        return primeNumbers;
    }
}
