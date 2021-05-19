package May_2021.Week3;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B1697 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int k = scanner.nextInt();
        int MAX = 200000;
        boolean[] check = new boolean[MAX+1];
        int[] dist = new int[MAX+1];
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
                }
            }
            next = now - 1;
            if (next>=0) {
                if (!check[next]) {
                    queue.add(next);
                    check[next] = true;
                    dist[next] = dist[now] + 1;
                }
            }

            next = now * 2;
            if (next < MAX) {
                if (!check[next]) {
                    queue.add(next);
                    check[next] = true;
                    dist[next] = dist[now] + 1;
                }
            }
        }
        System.out.println(dist[k]);

    }
}
