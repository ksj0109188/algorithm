package March_2021.Week1;

import java.io.IOException;
import java.util.Scanner;

public class B18290 {
    static int[] dx = {0, 0, 1, -1};
    static int[] dy = {-1, +1, 0, 0};
    static boolean[][] checked = new boolean[10][10];
    static int[][] matrix;
    static int N, M, K;
    static int ans = -40001;

    public static void main(String[] args) throws IOException {
        
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        M = scanner.nextInt();
        K = scanner.nextInt();
        matrix = new int[N][M];
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                matrix[i][j] = scanner.nextInt();
            }
        }
        go(0,0,0,0);
        System.out.println(ans);
        scanner.close();
    }

    private static void go(int px,int py, int cnt, int sum) {
        if (cnt == K) {
            if (sum > ans) ans = sum;
            return;
        }
        for (int x = px; x < N; x++) {
            for (int y = (x==px ? py : 0); y < M; y++) {
                if (checked[x][y]) continue;
                boolean ok = true;
                for (int i = 0; i < 4; i++) {
                    int nx = x + dx[i];
                    int ny = y + dy[i];
                    if (nx >= 0 && ny >= 0 && nx < N && ny < M) {
                        if (checked[nx][ny]) ok = false;
                    }
                }
                if (ok) {
                    checked[x][y] = true;
                    go(px,py ,cnt + 1, sum + matrix[x][y]);
                    checked[x][y] = false;
                }
            }
        }
    }
}
