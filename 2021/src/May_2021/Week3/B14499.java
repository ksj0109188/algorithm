package May_2021.Week3;

import java.util.Scanner;

public class B14499 {
    static int[] dx = {0, 0, -1, 1};
    static int[] dy = {1, -1, 0, 0};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        int x = scanner.nextInt();
        int y = scanner.nextInt();
        int k = scanner.nextInt();
        int a[][] = new int[n][m];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                a[i][j] = scanner.nextInt();
            }
        }
        // index가  0 ->주사위 1번(윗면), 5 -> 주사위 6번(아랫면 - 수가 복사되는 면) 
        int[] dice = new int[6];

        while (k-- > 0) {
            int command = scanner.nextInt();
            command -= 1;
            int nx = dx[command] + x;
            int ny = dy[command] + y;
            if (nx < 0 || ny < 0 || nx >= n || ny >= m) {
                continue;
            }

            if (command == 0) dice = moveToEast(dice);
            else if (command == 1) dice = moveToWest(dice);
            else if (command == 2) dice = moveToNorth(dice);
            else if (command == 3) dice = movetoSouth(dice);

            if (a[nx][ny] == 0) {
                a[nx][ny] = dice[5];
            } else if (a[nx][ny] != 0) {
                dice[5] = a[nx][ny];
                a[nx][ny] = 0;
            }
            x = nx;
            y = ny;
            System.out.println(dice[0]);
        }
    }


    private static int[] moveToEast(int[] dice) {
        int temp;
        temp = dice[0];
        dice[0] = dice[3];
        dice[3] = dice[5];
        dice[5] = dice[2];
        dice[2] = temp;
        return dice;
    }

    private static int[] moveToWest(int[] dice) {
        int temp;
        temp = dice[0];
        dice[0] = dice[2];
        dice[2] = dice[5];
        dice[5] = dice[3];
        dice[3] = temp;
        return dice;
    }

    private static int[] moveToNorth(int[] dice) {
        int temp;
        temp = dice[0];
        dice[0] = dice[4];
        dice[4] = dice[5];
        dice[5] = dice[1];
        dice[1] = temp;
        return dice;
    }

    private static int[] movetoSouth(int[] dice) {
        int temp;
        temp = dice[0];
        dice[0] = dice[1];
        dice[1] = dice[5];
        dice[5] = dice[4];
        dice[4] = temp;
        return dice;
    }


}
