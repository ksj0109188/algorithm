package May_2021.Week3;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B13549_Queue {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();

        int MAX = 200000;
        boolean[] check = new boolean[MAX + 1];
        int[] dist = new int[MAX + 1];
        Queue<Integer> queue = new LinkedList<>();
        Queue<Integer> nextQueue = new LinkedList<>();
        queue.add(n);
        check[n] = true;
        while (!queue.isEmpty()) {
            int x = queue.remove();

            int next = x * 2;
            if (next < MAX && !check[next]) {
                dist[next] = dist[x];
                queue.add(next);
                check[next] = true;
            }
            next = x + 1;
            if (next < MAX && !check[next]) {
                check[next] = true;
                dist[next] = dist[x] + 1;
                nextQueue.add(next);
            }
            next = x - 1;
            if (next >= 0 && !check[next]) {
                check[next] = true;
                dist[next] = dist[x] + 1;
                nextQueue.add(next);
            }
            if (queue.isEmpty()) {
                queue = nextQueue;
                nextQueue = new LinkedList<>();
            }
        }
        System.out.println(dist[m]);
    }
}
