package June_2021.Week3;

import java.util.Scanner;

public class B16197 {
    static int n, m;
    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};
    static char[][] arr;


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        n = scanner.nextInt();
        m = scanner.nextInt();

        int x1 = -1, x2 = -1, y1 = -1, y2 = -1;

        arr = new char[n][m];
        for (int i = 0; i < n; i++) {
            String input = scanner.next();
            for (int j = 0; j < input.length(); j++) {
                char data = input.charAt(j);
                if (data == 'o') {
                    if (x1 == -1) {
                        x1 = i;
                        y1 = j;
                    } else {
                        x2 = i;
                        y2 = j;
                    }
                    arr[i][j] = '.';
                }
                arr[i][j] = data;

            }
        }
        System.out.println(solve(0, x1, y1, x2, y2));
    }

    private static int solve(int cnt, int x1, int y1, int x2, int y2) {
        if (cnt == 11) {
            return -1;
        }
        boolean drop1 = false, drop2 = false;
        if (x1 < 0 || x1 >= n || y1 < 0 || y1 >= m) drop1 = true;
        if (x2 < 0 || x2 >= n || y2 < 0 || y2 >= m) drop2 = true;
        if (drop1 && drop2) return -1;
        if (drop1 || drop2) return cnt;
        int ans = -1;
        for (int k = 0; k < 4; k++) {
            int nx1 = x1 + dx[k];
            int ny1 = y1 + dy[k];
            int nx2 = x2 + dx[k];
            int ny2 = y2 + dy[k];
            if (nx1 >= 0 && nx1 < n && ny1 >= 0 && ny1 < m && arr[nx1][ny1] == '#') {
                nx1 = x1;
                ny1 = y1;
            }
            if (nx2 >= 0 && nx2 < n && ny2 >= 0 && ny2 < m && arr[nx2][ny2] == '#') {
                nx2 = x2;
                ny2 = y2;
            }
            int temp = solve(cnt + 1, nx1, ny1, nx2, ny2);
            if (temp == -1) continue;
            if (ans == -1 || ans > temp) ans = temp;
        }
        return ans;
    }
}

