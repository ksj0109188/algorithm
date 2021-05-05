package May_2021.Week1;

import java.util.Scanner;

public class B1912 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] A = new int[n];
        int[] DP = new int[n];

        for (int i = 0; i < n; i++) {
            A[i] = scanner.nextInt();
        }

        for (int i = 0; i < n; i++) {
            DP[i] = A[i];
            if (i - 1 >= 0 && DP[i]<DP[i-1]+A[i]) {
                DP[i] = DP[i-1]+A[i];
            }
        }
        int result = -1001;
        for(int i=0; i< n ;i++){
            if(result<DP[i]){
                result = DP[i];
            }
        }
        System.out.println(result);
        scanner.close();
    }
}
