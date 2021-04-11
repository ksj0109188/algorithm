package April_2021.ThirdWeek;

import java.util.Arrays;
import java.util.Scanner;

//https://www.acmicpc.net/problem/10819
//차이를 최대로
public class B10819 {
    static int[] items;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        items = new int[N];
        for (int i = 0; i < N; i++) {
            items[i] = scanner.nextInt();
        }
        Arrays.sort(items);

        int sum = 0;
        do {
            int currentValue = calculate(items);
            sum = Math.max(sum, currentValue);
        } while (next_permutation());

        System.out.println(sum);
        scanner.close();
    }

    private static boolean next_permutation() {
        int i = items.length - 1;
        while (i >= 1 && items[i - 1] >= items[i]) i -= 1;
        if (i == 0) {
            return false;
        }
        int j = items.length - 1;
        while (items[i - 1] >= items[j]) j -= 1;

        int temp = items[i - 1];
        items[i - 1] = items[j];
        items[j] = temp;

        j = items.length - 1;
        while (i < j) {
            temp = items[i];
            items[i] = items[j];
            items[j] = temp;
            i += 1;
            j -= 1;
        }
        return true;
    }

    private static int calculate(int[] items) {
        int sum = 0;
        int len = items.length;
        for (int i = 1; i < len; i++) {
            sum += Math.abs(items[i - 1] - items[i]);
        }
        return sum;
    }
}
