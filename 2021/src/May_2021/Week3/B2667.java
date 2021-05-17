package May_2021.Week3;


import java.util.*;

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

public class B2667 {

    //{상,하,좌,우}
    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[][] a = new int[n][n];
        int[][] c = new int[n][n];
        for (int i = 0; i < n; i++) {
            String Line = scanner.next();
            for (int j = 0; j < n; j++) {
                a[i][j] = Line.charAt(j) - '0';
            }
        }

        int cnt = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (a[i][j] != 0 && c[i][j] == 0) {
                    bfs(a, i, j, c, ++cnt, n);
                }
            }
        }

        int[] ans = new int[cnt];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (c[i][j] != 0) {
                    ans[c[i][j] - 1] += 1;
                }
            }
        }
        System.out.println(cnt);
        Arrays.sort(ans);
        for (int i = 0; i < cnt; i++) {
            System.out.println(ans[i]);
        }
    }

    private static void bfs(int[][] a, int i, int j, int[][] c, int cnt, int n) {
        Queue<Pair> queue = new LinkedList<>();
        queue.add(new Pair(i, j));
        c[i][j] = cnt;
        while (!queue.isEmpty()) {
            Pair pair = queue.remove();
            int x = pair.getX();
            int y = pair.getY();

            for (int k = 0; k < dx.length; k++) {
                int nx = dx[k] + x;
                int ny = dy[k] + y;

                if (nx >= 0 && ny >= 0 && nx < n && ny < n) {
                    if (a[nx][ny] == 1 && c[nx][ny] == 0) {
                        c[nx][ny] = cnt;
                        queue.add(new Pair(nx, ny));
                    }
                }
            }
        }

    }
}
