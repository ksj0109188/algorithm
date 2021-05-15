package May_2021.Week2;

import java.util.*;

public class B1260 {
    static ArrayList<Integer>[] g;
    static boolean[] c;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        int firstStart = scanner.nextInt();
        c = new boolean[n + 1];
        g = new ArrayList[n + 1];

        for (int i = 1; i <= n; i++) {
            g[i] = new ArrayList<Integer>();
        }

        for (int i = 0; i < m; i++) {
            int u = scanner.nextInt();
            int v = scanner.nextInt();

            g[u].add(v);
            g[v].add(u);
        }

        for (int i = 1; i <= n; i++) {
            Collections.sort(g[i]);
        }
        dfs(firstStart);
        System.out.println();
        c = new boolean[n+1];
        bfs(firstStart);
    }

    private static void bfs(int currentVertex) {
        Queue<Integer> queue = new LinkedList<Integer>();
        queue.add(currentVertex);
        c[currentVertex] = true;
        while (!queue.isEmpty()) {
            int x = queue.remove();
            System.out.print(x + " ");
            for (int Edge : g[x]) {
                if (!c[Edge]) {
                    c[Edge] = true;
                    queue.add(Edge);
                }
            }
        }
    }

    private static void dfs(int currentVertex) {
        if (c[currentVertex]) {
            return;
        }
        c[currentVertex] = true;
        System.out.print(currentVertex + " ");

        for (int Edge : g[currentVertex]) {
            if (!c[Edge]) {
                dfs(Edge);
            }
        }
    }
}


