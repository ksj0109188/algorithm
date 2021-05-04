package May_2021.Week1;

import java.util.Scanner;

//이친수
//https://www.acmicpc.net/problem/2193
public class B2193 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
//        2차원을 사용한 DP
//        long[][] DP = new long[N + 1][2];
//        DP[1][0] = 0;
//        DP[1][1] = 1;
//
//        for (int i = 2; i <= N; i++) {
//            for(int j=0; j<=1 ; j++){
//                if(j==0) DP[i][0] = DP[i-1][1]+DP[i-1][0];
//                if(j==1) DP[i][1] = DP[i-1][0];
//            }
//        }
//        System.out.println(DP[N][0]+DP[N][1]);

//        1차원을 사용한 DP
        long[] DP = new long[N+1];
        DP[1] = 1;
        if(N>=2){
            DP[2] = 1;
        }
        for(int i=3; i<=N ; i++){
            DP[i] = DP[i-1]+DP[i-2];
        }
        System.out.println(DP[N]);
        scanner.close();
    }
}
