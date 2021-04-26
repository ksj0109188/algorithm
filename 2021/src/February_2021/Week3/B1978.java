package February_2021.Week3;

import java.io.IOException;
import java.util.Scanner;

public class B1978 {
    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int result = 0;
        for (int i = 0; i < N; i++) {
            int num = scanner.nextInt();
            if (check_primeNumber(num)) {
                result += 1;
            }
        }
        System.out.println(result);
        scanner.close();
    }

    private static boolean check_primeNumber(int num) {
        if (num < 2) {
            return false;
        } else if (num == 2) {
            return true;
        }
        for (int j = 2; j * j <= num; j++) {
            if (num % j == 0) {
                return false;
            }
        }
        return true;
    }
}
