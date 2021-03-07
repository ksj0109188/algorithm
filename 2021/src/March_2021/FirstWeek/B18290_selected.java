package March_2021.FirstWeek;

import java.io.IOException;
import java.util.Scanner;

//row major order 방식으로 풀이
public class B18290_selected {
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
        go(-1, 0, 0);
        System.out.println(ans);
        scanner.close();
    }

    private static void go(int previous, int cnt, int sum) {
        if (cnt == K) {
            if (sum > ans) ans = sum;
            return;
        }
        for (int i = previous + 1; i < N * M; i++) {
            int x = i / M;
            int y = i % M;
            if (checked[x][y]) continue;
            boolean ok = true;
            for (int j = 0; j < 4; j++) {
                int nx = x + dx[j];
                int ny = y + dy[j];
                if (nx >= 0 && ny >= 0 && nx < N && ny < M) {
                    if (checked[nx][ny]) ok = false;
                }
            }
            if (ok) {
                checked[x][y] = true;
                go(x * M + y, cnt + 1, sum + matrix[x][y]);
                checked[x][y] = false;
            }
        }
    }
}

