package January_2021.FourthWeek;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B9465 {
    static int[][] sticker_board;
    static int[][] dp;
    static int N=0;
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(bufferedReader.readLine());
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < T; i++) {
            N = Integer.parseInt(bufferedReader.readLine());
            String[] row1 = bufferedReader.readLine().split(" ");
            String[] row2 = bufferedReader.readLine().split(" ");
            sticker_board = new int[2][N];
            dp = new int[2][N + 1];
            for (int j = 0; j < N; j++) {
                sticker_board[0][j] = Integer.parseInt(row1[j]);
                sticker_board[1][j] = Integer.parseInt(row2[j]);
            }

            dp[0][1] = sticker_board[0][0];
            dp[1][1] = sticker_board[1][0];

            for (int j = 2; j <= N; j++) {
                dp[0][j] = Math.max(dp[1][j - 1], dp[1][j - 2]) + sticker_board[0][j - 1];
                dp[1][j] = Math.max(dp[0][j - 1], dp[0][j - 2]) + sticker_board[1][j - 1];
            }
            System.out.println(Math.max(dp[0][N], dp[1][N]));
            bufferedReader.close();
        }
    }
}
