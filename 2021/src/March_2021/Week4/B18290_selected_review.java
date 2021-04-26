package March_2021.Week4;

import java.io.IOException;
import java.util.Scanner;

//https://www.acmicpc.net/problem/18290
//row major order 방식으로 풀이
public class B18290_selected_review {
    static int[] dx = {0, 0, 1, -1};
    static int[] dy = {-1, +1, 0, 0};
    static boolean[][] checked = new boolean[10][10];
    static int[][] matrix;
    static int N, M, K;
    static int result = -40001;

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
        go(0, 0, 0);
        System.out.println(result);
        scanner.close();
    }

    private static void go(int start, int selectCount, int sum) {
        if (selectCount == K) {
            if (result < sum) result = sum;
            return;
        }
        for (int i = start; i < N * M; i++) {
            boolean ok = true;
            int rx = i / M;
            int ry = i % M;
            if (checked[rx][ry]) continue;
            for (int j = 0; j < 4; j++) {
                int nx = rx + dx[j];
                int ny = ry + dy[j];
                if (nx >= 0 && ny >= 0 && nx < N && ny < M) {
                    if (checked[nx][ny]) ok = false;
                }
            }
            if (ok) {
                checked[rx][ry] = true;
                go(i + 1, selectCount + 1, sum + matrix[rx][ry]);
                checked[rx][ry] = false;
            }
        }
    }
}

