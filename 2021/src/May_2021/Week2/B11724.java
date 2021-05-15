package May_2021.Week2;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B11724 {
    static boolean[] c;
    static ArrayList<Integer>[] g;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
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

        int result = 1;
        bfs(1);
        for(int i=1; i<=n; i++){
            if(!c[i]){
                result+=1;
                bfs(i);
            }
        }
        System.out.println(result);
    }

    private static void bfs(int currentVertex) {
        Queue<Integer> queue = new LinkedList<Integer>();
        queue.add(currentVertex);
        c[currentVertex] = true;
        while (!queue.isEmpty()) {
            int x= queue.remove();
            System.out.print(x+" ");
            for (int Edge : g[x]) {
                if (!c[Edge]) {
                    c[Edge] = true;
                    queue.add(Edge);
                }
            }
        }
    }
}