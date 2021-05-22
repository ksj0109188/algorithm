package May_2021.Week3;

import java.util.Scanner;

public class B14503 {
    static int[] dx = {-1, 0, 1, 0};
    static int[] dy = {0, 1, 0, -1};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        int x = scanner.nextInt();
        int y = scanner.nextInt();
        int direct = scanner.nextInt();

        //청소를 하지 않은경우 0, 벽인경우 1, 이미 청소한 경우는 2
        int[][] arr = new int[n][m];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                arr[i][j] = scanner.nextInt();
            }
        }

        while (true) {
            boolean ok = false;
            if (arr[x][y] == 0) {
                arr[x][y] = 2;
            }
            //2-c, 2-d 바라보는 방향이 벽이나, 이미 청소가 되어 있는경우
            for (int k = 0; k < 4; k++) {
                int nx = dx[k] + x;
                int ny = dy[k] + y;
                if (nx >= 0 && ny >= 0 && nx < n && ny < m) {
                    if (arr[nx][ny] == 0) {
                        ok = true;
                        break;
                    }
                }
            }

            //2-c만약 청소할 곳이 없다면 청소기 방향을 유지한채로 뒤로 후진한다.
            //2-d만약 후진할 곳이 벽인경우 작동을 멈춘다.
            if (!ok) {
                if (arr[x - dx[direct]][y - dy[direct]] == 1) {
                    break;
                } else {
                    x -= dx[direct];
                    y -= dy[direct];
                }
            }
            //2-a 왼쪽 방향에 아직 청소하지 않은 공간이 존재한다면, 그 방향으로 회전한 다음 1 칸 전진하고 1번(청소한다).
            //2-b 왼쪽 방향에 청소할 공간이 없다면, 그 방향으로 회전하고 2번으로 돌아간다.
            else {
                direct = (direct + 3) % 4;
                if (arr[x + dx[direct]][y + dy[direct]] == 0) {
                    x = x + dx[direct];
                    y = y + dy[direct];
                }
            }
        }

        int result = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (arr[i][j] == 2) {
                    result += 1;
                }
            }
        }
        System.out.println(result);
    }
}
