package May_2021.Week3;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B7576 {
    //상, 하, 좌, 우
    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Queue<Pair> queue = new LinkedList<>();
        int m = scanner.nextInt();
        int n = scanner.nextInt();

        int[][] a = new int[n][m];
        int[][] digit = new int[n][m];
        //digit에 0만 들어있다면 모두 익은 토마토(1)를 입력으로 주어진 것이다.
        //digit에 -1이 들어있다면 모두 익지 못하는 상황이다.
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                a[i][j] = scanner.nextInt();
                digit[i][j] = -1;
                if (a[i][j] == 1) {
                    digit[i][j] = 0;
                    queue.add(new Pair(i, j));
                }
            }
        }

        while (!queue.isEmpty()) {
            Pair pair = queue.remove();
            for (int k = 0; k < 4; k++) {
                int nx = dx[k] + pair.getX();
                int ny = dy[k] + pair.getY();
                if (nx >= 0 && ny >= 0 && nx < n && ny < m) {
                    if (a[nx][ny] == 0 && digit[nx][ny] == -1) {
                        queue.add(new Pair(nx, ny));
                        digit[nx][ny] = digit[pair.getX()][pair.getY()] + 1;
                    }
                }
            }
        }
        int result = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (result < digit[i][j]) {
                    result = digit[i][j];
                }
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (a[i][j]==0 && digit[i][j] == -1) {
                    result = -1;
                }
            }
        }
        System.out.println(result);
    }
}