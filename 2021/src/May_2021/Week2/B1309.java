package May_2021.Week2;

import java.util.Scanner;

public class B1309 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        //[N][0]~[N][2] -> 0은 배치를 안 한 경우, 1은 가로 기준 왼쪽에 배치한 경우, 2는 오른쪽
        int[][] DP = new int[N+1][3];
        DP[0][0] = 1;
        for (int i = 1; i <= N; i++) {
            DP[i][0] = DP[i-1][0]+DP[i-1][1] + DP[i-1][2];
            DP[i][1] = DP[i-1][0] + DP[i-1][2];
            DP[i][2] = DP[i-1][0] + DP[i-1][1];
            for(int j=0; j<3 ; j++){
                DP[i][j] %= 9901;
            }
        }
        int result = DP[N][0] + DP[N][1] + DP[N][2];
        System.out.println(result%9901);
    }
}
