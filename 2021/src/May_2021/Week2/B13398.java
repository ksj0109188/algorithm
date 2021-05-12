package May_2021.Week2;

import java.util.Scanner;

public class B13398 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] a = new int[n];
        int[] dp1 = new int[n];
        int[] dp2 = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = scanner.nextInt();
        }
        dp1[0] = a[0];
        for (int i = 1; i < n; i++) {
            dp1[i] = Math.max(dp1[i - 1] + a[i], a[i]);
        }
        dp2[n-1] = a[n-1];
        for (int i = n - 1; i >= 0; i--) {
            if (i + 1 < n) {
                dp2[i] = Math.max(dp2[i + 1] + a[i], a[i]);
            }
        }
        int result = dp1[0];
        for(int i=1; i<n; i++){
            result = Math.max(dp1[i],result);
        }
        for(int i=1; i<n-1; i++){
            result=Math.max(dp1[i-1]+dp2[i+1],result);
        }
        System.out.println(result);
        scanner.close();
    }
}
