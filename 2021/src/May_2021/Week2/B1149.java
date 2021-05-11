package May_2021.Week2;

import java.util.Scanner;

public class B1149 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] a = new int[3];
        int[][] DP = new int[n+1][3];
        for(int i=1; i<=n ; i++){
            a[0] = scanner.nextInt();
            a[1] = scanner.nextInt();
            a[2] = scanner.nextInt();
            DP[i][0] = Math.min(DP[i-1][1],DP[i-1][2])+a[0];
            DP[i][1] = Math.min(DP[i-1][0],DP[i-1][2])+a[1];
            DP[i][2] = Math.min(DP[i-1][0],DP[i-1][1])+a[2];
        }
        int result = Integer.MAX_VALUE;
        for(int i=0; i<3; i++){
            if(DP[n][i]<result){
                result =  DP[n][i];
            }
        }
        System.out.println(result);
        scanner.close();
    }
}
