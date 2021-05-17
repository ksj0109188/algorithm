package May_2021.Week3;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

//class Pair {
//    int x;
//    int y;
//
//    Pair(int x, int y) {
//        this.x = x;
//        this.y = y;
//    }
//
//    public int getX() {
//        return x;
//    }
//
//    public int getY() {
//        return y;
//    }
//}

public class B2178 {
    //상, 하, 좌, 우
    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();

        int[][] a = new int[n][m];
        int[][] digit = new int[n][m];

        for (int i = 0; i < n; i++) {
            String s = scanner.next();
            for (int j = 0; j < m; j++) {
                a[i][j] = s.charAt(j) - '0';
                digit[i][j] = -1;
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (a[i][j] == 1 && digit[i][j] == -1) {
                    bfs(a, digit, i, j, 1, n, m);
                }
            }
        }

        System.out.println(digit[n - 1][m - 1]);
    }

    private static void bfs(int[][] a, int[][] digit, int x, int y, int cnt, int n, int m) {
        Queue<Pair> queue = new LinkedList<>();
        queue.add(new Pair(x, y));
        digit[x][y] = cnt;

        while (!queue.isEmpty()) {
            Pair pair = queue.remove();
            for (int k = 0; k < 4; k++) {
                int nx = dx[k] + pair.getX();
                int ny = dy[k] + pair.getY();
                if (nx >= 0 && ny >= 0 && nx < n && ny < m) {
                    if (a[nx][ny] == 1 && digit[nx][ny] == -1) {
                        queue.add(new Pair(nx, ny));
                        digit[nx][ny] = digit[pair.getX()][pair.getY()] + 1;
                    }
                }
            }
        }
    }
}
