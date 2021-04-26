package February_2021.Week3;

import java.util.Scanner;

//약수의 합2
//https://www.acmicpc.net/problem/17427
public class B17427 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        long result = 0;
        for (int i = 1; i <= N; i++) {
            result += i*(N/i);
        }
        System.out.println(result);
        scanner.close();
    }
}
