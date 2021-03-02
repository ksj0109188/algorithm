package March_2021.FirstWeek;

import java.util.Scanner;

public class B15649 {
    static boolean[] c = new boolean[10];
    static int[] a = new int[10];
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        int index = 0;
        go(index, N, M);

    }

    private static void go(int index, int n, int m) {

        if (index == m) {
            for(int i=0; i<index ;i++){
                System.out.print(a[i]+" ");

            }
            System.out.println();
            return ;
        }
        for (int i = 1; i <= n; i++) {
            if (c[i] == true) continue;
            c[i] = true;
            a[index] = i;
            go(index + 1, n, m);
            c[i] = false;
        }
    }
}
