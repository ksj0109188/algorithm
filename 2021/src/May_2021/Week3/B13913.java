package May_2021.Week3;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B13913 {
    static int[] from;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int k = scanner.nextInt();
        int MAX = 200000;
        boolean[] check = new boolean[MAX + 1];
        int[] dist = new int[MAX + 1];
        from = new int[MAX + 1];

        Queue<Integer> queue = new LinkedList<>();
        queue.add(n);
        check[n] = true;
        dist[n] = 0;
        int next;
        while (!queue.isEmpty()) {
            int now = queue.remove();
            next = now + 1;
            if (next < MAX) {
                if (!check[next]) {
                    queue.add(next);
                    check[next] = true;
                    dist[next] = dist[now] + 1;
                    from[next] = now;
                }
            }
            next = now - 1;
            if (next >= 0) {
                if (!check[next]) {
                    queue.add(next);
                    check[next] = true;
                    dist[next] = dist[now] + 1;
                    from[next] = now;
                }
            }

            next = now * 2;
            if (next < MAX) {
                if (!check[next]) {
                    queue.add(next);
                    check[next] = true;
                    dist[next] = dist[now] + 1;
                    from[next] = now;
                }
            }
        }
        System.out.println(dist[k]);
        print(n, k);
    }

    //17 <- 6 <- 3
    private static void print(int n, int k) {
        if (n != k) {
            print(n, from[k]);
        }
        System.out.print(k+" ");
    }
}
