package May_2021.Week2;

import java.util.Scanner;

public class B2156 {
    //    1차원 배열을 이용한 풀이
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] a = new int[n + 1];
        int[] dp = new int[n + 1];
        for (int i = 1; i <= n; i++) {
            a[i] = scanner.nextInt();
        }
        dp[1] = a[1];
        if (n >= 2) {
            dp[2] = a[1] + a[2];
        }
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1];
            dp[i] = Math.max(dp[i], dp[i - 2] + a[i]);
            dp[i] = Math.max(dp[i], dp[i - 3] + a[i - 1] + a[i]);
        }
        int result = a[1];
        for (int i = 2; i <= n; i++) {
            if (result < dp[i]) {
                result = dp[i];
            }
        }
        System.out.println(result);
        scanner.close();
    }
//    2차원 배열을 이용한 풀이.
//    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        int n = scanner.nextInt();
//        int[] a = new int[n];
//        int[][] dp = new int[n][3];
//
//        for(int i=0; i<n ; i++){
//            a[i] = scanner.nextInt();
//        }
//        dp[0][1] = dp[0][2] = a[0];
//        for(int i=1; i<n; i++){
//            dp[i][0] = Math.max(Math.max(dp[i-1][0],dp[i-1][1]),dp[i-1][2]);
//            dp[i][1] = dp[i-1][0]+a[i];
//            dp[i][2] = dp[i-1][1]+a[i];
//        }
//
//        int result =0;
//        for(int i=0; i<3 ; i++){
//            if(result<dp[n-1][i]){
//                result = dp[n-1][i];
//            }
//        }
//        System.out.println(result);
//        scanner.close();
//    }
}
