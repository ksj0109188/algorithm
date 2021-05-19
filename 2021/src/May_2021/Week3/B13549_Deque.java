package May_2021.Week3;

import java.util.Deque;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B13549_Deque {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();

        int MAX = 200000;
        boolean[] check = new boolean[MAX + 1];
        int[] dist = new int[MAX + 1];
        Deque<Integer> deque = new LinkedList<>();
        deque.add(n);
        check[n] = true;
        while (!deque.isEmpty()) {
            int x = deque.poll();

            int next = x * 2;
            if (next < MAX && !check[next]) {
                dist[next] = dist[x];
                deque.addFirst(next);
                check[next] = true;
            }
            next = x + 1;
            if (next < MAX && !check[next]) {
                check[next] = true;
                dist[next] = dist[x] + 1;
                deque.addLast(next);
            }
            next = x - 1;
            if (next >= 0 && !check[next]) {
                check[next] = true;
                dist[next] = dist[x] + 1;
                deque.addLast(next);
            }
        }
        System.out.println(dist[m]);
    }
}
