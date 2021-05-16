package May_2021.Week2;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B1707 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int k = scanner.nextInt();
        while (k-- > 0) {
            int V = scanner.nextInt();
            int E = scanner.nextInt();
            ArrayList<Integer>[] g = new ArrayList[V + 1];
            int[] color = new int[V + 1];

            for (int i = 1; i <= V; i++) {
                g[i] = new ArrayList<>();
            }

            for (int i = 0; i < E; i++) {
                int from = scanner.nextInt();
                int to = scanner.nextInt();

                g[from].add(to);
                g[to].add(from);
            }

            boolean ok = true;
            for (int i = 1; i <= V; i++) {
                if (color[i] == 0) {
                    if (!bfs(g, color, 1, i)) {
                        ok = false;
                    }
                }
            }
            System.out.println(ok ? "YES" : "NO");
        }
    }

    private static boolean bfs(ArrayList<Integer>[] g, int[] color, int group, int start) {
        Queue<Integer> queue = new LinkedList<>();
        color[start] = group;
        queue.add(start);
        while (!queue.isEmpty()) {
            int x = queue.remove();
            group=color[x];
            for (int Edge : g[x]) {
                if (color[Edge] == 0) {
                    color[Edge] = 3-group;
                    queue.add(Edge);
                }
                if (color[Edge] == color[x]) {
                    return false;
                }
            }
        }
        return true;
    }
}