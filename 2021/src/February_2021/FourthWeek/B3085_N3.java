package February_2021.FourthWeek;

import java.util.Scanner;

//사탕 게임 (n^3복잡도)
//https://www.acmicpc.net/problem/3085
public class B3085_N3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        char[][] CandyTable = new char[n][n];

        for (int i = 0; i < n; i++) {
            CandyTable[i] = scanner.next().toCharArray();
        }
        int result = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                char t;
                if (j + 1 < n) {
                    t = CandyTable[i][j + 1];CandyTable[i][j + 1] = CandyTable[i][j];CandyTable[i][j] = t;
                    int temp = checkMax(CandyTable,i,j,i,j+1);
                    t = CandyTable[i][j + 1];CandyTable[i][j + 1] = CandyTable[i][j];CandyTable[i][j] = t;
                    if (result < temp) result = temp;
                }
                if (i + 1 < n) {
                    t = CandyTable[i + 1][j];CandyTable[i + 1][j] = CandyTable[i][j];CandyTable[i][j] = t;
                    int temp = checkMax(CandyTable,i,j,i+1,j);
                    t = CandyTable[i + 1][j];CandyTable[i + 1][j] = CandyTable[i][j];CandyTable[i][j] = t;
                    if (result < temp) result = temp;
                }
            }
        }
        System.out.println(result);
        scanner.close();
    }

    private static int checkMax(char[][] candyTable,int start_row, int start_col, int end_row, int end_col) {
        int n = candyTable.length;
        int maxValue = 1;
        int cnt;
        for (int i = start_row; i <= end_row; i++) {
            cnt = 1;
            for (int j = 1; j < n; j++) {
                if (candyTable[i][j] == candyTable[i][j - 1]) {
                    cnt += 1;
                } else {
                    cnt = 1;
                }
                if (maxValue < cnt) maxValue = cnt;
            }
        }
        for(int i=start_col; i<=end_col;i++) {
            cnt=1;
            for (int j = 1; j < n; j++) {
                if (candyTable[j][i] == candyTable[j - 1][i]) {
                    cnt += 1;
                } else {
                    cnt = 1;
                }
                if (maxValue < cnt) maxValue = cnt;
            }
        }
        return maxValue;
    }
}
