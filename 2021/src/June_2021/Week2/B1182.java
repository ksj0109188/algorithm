package June_2021.Week2;

import java.util.Scanner;

public class B1182 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int s = scanner.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
        }
        int result = solve(arr, 0, 0, n, s);
        if (s == 0) {
            result -= 1;
        }
        System.out.println(result);
    }

    private static int solve(int[] arr, int index, int sum, int n, int s) {
        if (index == n) {
            if (sum == s) {
                return 1;
            }
            return 0;
        }
        return solve(arr, index + 1, sum + arr[index], n, s) + solve(arr, index + 1, sum, n, s);
    }
}
