package May_2021.Week3;

import java.util.Scanner;

public class B14890 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int l = scanner.nextInt();
        int a[][] = new int[n][n];
        int d[] = new int[n];
        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                a[i][j] = scanner.nextInt();
            }
        }
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                d[j] = a[i][j];
            }
            if (go(d, n, l)) ans += 1;
        }

        for (int j = 0; j < n; j++) {
            for (int i = 0; i < n; i++) {
                d[i] = a[i][j];
            }
            if (go(d, n, l)) ans += 1;
        }
        System.out.println(ans);
    }

    private static boolean go(int[] d, int n, int l) {
        boolean[] c = new boolean[n];

        for (int i = 1; i < n; i++) {
            //인접한 칸이 다른 높이일 경우
            if (d[i] != d[i - 1]) {
                int diff = d[i] - d[i - 1];
                //차이가 1이 아닌경우
                if (Math.abs(diff) != 1) return false;

                //오른쪽 경사로가 높은 경우
                if (d[i - 1] < d[i]) {
                    for (int j = 1; j <= l; j++) {
                        //경사로를 놓다가 범위를 벗어난 경우
                        if (i - j < 0) {
                            return false;
                        }
                        //낮은 지점의 칸의 높이가 모두 같지 않거나, L개가 연속되지 않는 경우
                        if (d[i - 1] != d[i - j]) {
                            return false;
                        }
                        //경사로를 놓은 곳에 또 경사로를 놓는 경우
                        if (c[i - j]) {
                            return false;
                        }
                        c[i - j] = true;
                    }
                }else{
                    //d[i-1]>d[i]
                    for(int j=0 ; j<l ; j++){
                        if(i+j>=n){
                            return false;
                        }
                        if(d[i]!=d[i+j]){
                            return false;
                        }

                        if(c[i+j]){
                            return false;
                        }
                        c[i+j] = true;
                    }
                }
            }
        }
        return true;
    }
}
