package June_2021.Week2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class B6603 {
    static ArrayList<Integer> lotto = new ArrayList<>();
    static int n;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            n = scanner.nextInt();
            if (n == 0) {
                break;
            }
            int[] arr = new int[n];
            for (int i = 0; i < n; i++) {
                arr[i] = scanner.nextInt();
            }
            Arrays.sort(arr);
            go(arr, 0, 0);
            System.out.println();
        }
    }

    private static void go(int[] arr, int index, int cnt) {
        if (cnt == 6) {
            for (int result : lotto) {
                System.out.print(result + " ");
            }
            System.out.println();
            return;
        } else if (index == n)
            return;
        lotto.add(arr[index]);
        go(arr, index + 1, cnt + 1);
        lotto.remove(lotto.size() - 1);
        go(arr, index + 1, cnt);
    }
}
