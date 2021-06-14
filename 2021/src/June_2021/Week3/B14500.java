package June_2021.Week3;

import java.util.Scanner;

//재귀함수를 이용한 풀이
public class B14500 {
    static int n;
    static int m;
    static int[][] arr= new int[500][500];
    static boolean[][] check = new boolean[500][500];
    static int ans;
    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        n = scanner.nextInt();
        m = scanner.nextInt();


        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                arr[i][j] = scanner.nextInt();
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                go(i, j, 0, 0);

                if (j + 2 < m) {
                    int temp = arr[i][j] + arr[i][j + 1] + arr[i][j + 2];
                    if (i - 1 >= 0) {
                        int temp2 = temp + arr[i - 1][j + 1];
                        if (ans < temp2) ans = temp2;
                    }
                    if (i + 1 < n) {
                        int temp2 = temp + arr[i + 1][j + 1];
                        if (ans < temp2) ans = temp2;
                    }
                }
                if (i + 2 < n) {
                    int temp = arr[i][j] + arr[i + 1][j] + arr[i + 2][j];
                    if (j + 1 < n) {
                        int temp2 = temp + arr[i + 1][j + 1];
                        if (ans < temp2) ans = temp2;
                    }
                    if (j - 1 >= 0) {
                        int temp2 = temp + arr[i + 1][j - 1];
                        if (ans < temp2) ans = temp2;
                    }
                }
            }
        }
        System.out.println(ans);
    }

    private static void go(int i, int j, int sum, int cnt) {
        if (cnt == 4) {
            if (ans < sum) {
                ans = sum;
            }
            return;
        }
        if (i < 0 || j < 0 || i >= n || j >= m) return;
        if (check[i][j]) return;
        check[i][j] = true;
        for (int k = 0; k < 4; k++) {
            int nx = i + dx[k];
            int ny = j + dy[k];
            go(nx, ny, sum + arr[i][j], cnt + 1);
        }
        check[i][j] = false;
    }
}
