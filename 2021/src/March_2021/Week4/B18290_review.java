package March_2021.Week4;

import java.util.Scanner;

public class B18290_review {
    static int[][] adjacentMatrix = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    static boolean[][] check = new boolean[10][10];
    static int[][] matrix;
    static int N, M, K;
    static int result = -40001;

    public static void main(String[] args) {
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
        go(0, 0, 0, 0);
        System.out.println(result);
        scanner.close();
    }

    private static void go(int startX, int startY, int selectCount, int sum) {
        if (selectCount == K) {
            if (result < sum) result = sum;
            return;
        }

        for (int i = startX; i < N; i++) {
            for (int j = (startX==i?startY:0); j < M; j++) {
                boolean ok = true;
                if (check[i][j]) continue;
                for (int m = 0; m < adjacentMatrix.length; m++) {
                    int dx = i + adjacentMatrix[m][0];
                    int dy = j + adjacentMatrix[m][1];
                    if (dx >= 0 && dy >= 0 && dx < N && dy < M) {
                        if (check[dx][dy]) ok = false;
                    }
                }
                if (ok) {
                    check[i][j] = true;
                    go(i,j,selectCount + 1, sum + matrix[i][j]);
                    check[i][j] = false;
                }
            }
        }
    }
}
