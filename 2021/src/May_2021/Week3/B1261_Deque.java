package May_2021.Week3;

import java.util.*;

public class B1261_Deque {

    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        int[][] a = new int[m][n];
        int[][] cnt = new int[m][n];

        for (int i = 0; i < m; i++) {
            String s = scanner.next();
            Arrays.fill(cnt[i], -1);
            for (int j = 0; j < n; j++) {
                a[i][j] = s.charAt(j) - '0';
            }
        }
        Deque<Pair> deque = new LinkedList<>();

        deque.add(new Pair(0,0));
        cnt[0][0] = 0;
        while (!deque.isEmpty()) {
            Pair pair = deque.poll();
            int x = pair.x;
            int y = pair.y;
            for (int k = 0; k < 4; k++) {
                int nx = dx[k] + x;
                int ny = dy[k] + y;
                if (nx >= 0 && ny >= 0 && nx < m && ny < n) {
                    if (a[nx][ny] == 0 && cnt[nx][ny] == -1) {
                        deque.addFirst(new Pair(nx,ny));
                        cnt[nx][ny] = cnt[x][y];
                    }
                    if (a[nx][ny] == 1 && cnt[nx][ny] == -1) {
                        deque.addLast(new Pair(nx,ny));
                        cnt[nx][ny] = cnt[x][y] + 1;
                    }
                }
            }
        }
        System.out.println(cnt[m-1][n-1]);
    }
}
