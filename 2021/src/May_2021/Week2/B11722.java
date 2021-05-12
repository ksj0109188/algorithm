package May_2021.Week2;

import java.util.Scanner;

public class B11722 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] a = new int[n];
        int[] dp = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = scanner.nextInt();
        }

        for(int i=n-1 ; i>=0; i--){
            dp[i]= 1;
            for(int j=i+1 ; j<n; j++){
                if(a[i]>a[j] && dp[i]<dp[j]+1){
                    dp[i] = dp[j]+1;
                }
            }
        }
//        점화식을 어떤 기준을 정했다면 그 앞의 점화식을 이용한 방법
//        for (int i = 0; i < n; i++) {
//            dp[i] = 1;
//            for (int j = 0; j < i; j++) {
//                if (a[i] < a[j] && dp[i]<dp[j]+1) {
//                    dp[i] = dp[j]+1;
//                }
//            }
//        }
        int result = 0;
        for(int i=0; i<n ; i++){
            result = Math.max(result,dp[i]);
        }
        System.out.println(result);
        scanner.close();
    }
}
