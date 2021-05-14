package May_2021.Week2;

import java.util.ArrayList;
import java.util.Scanner;

class Edge {
    int from, to;

    Edge(int from, int to) {
        this.from = from;
        this.to = to;
    }
}

public class B13023 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        boolean[][] a = new boolean[n][n];
        ArrayList<Edge> edges = new ArrayList<Edge>();
        ArrayList<Integer>[] g = new ArrayList[n];
        for (int i = 0; i < n; i++) {
            g[i] = new ArrayList<Integer>();
        }
        for (int i = 0; i < m; i++) {
            int from = scanner.nextInt();
            int to = scanner.nextInt();
            //무방향 간선으로
            edges.add(new Edge(from, to));
            edges.add(new Edge(to, from));
            //각 Vertax가 가지는 간선을 저장.
            g[from].add(to);
            g[to].add(from);
            //인접행렬
            a[from][to] = a[to][from] = true;
        }
        m *= 2;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < m; j++) {
                int A = edges.get(i).from;
                int B = edges.get(i).to;
                int C = edges.get(j).from;
                int D = edges.get(j).to;
                if (A == B || A == C || A == D || B == C || B == D || C == D){
                    continue;
                }
                if(!a[B][C]){
                    continue;
                }
                for(int E : g[D]){
                    if(A==E || B==E || C==E || D==E){
                        continue;
                    }
                    System.out.println(1);
                    System.exit(0);
                }
            }
        }
        System.out.println(0);
    }
}
