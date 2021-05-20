package May_2021.Week3;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class B16926 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        int R = scanner.nextInt();
        int[][] a = {{5, 4, 3, 2, 1}, {6, 1, 9, 8, 7}
                , {7, 2, 7, 6, 6}, {8, 3, 4, 5, 5}, {9, 2, 3, 1, 4}};
//        for (int i = 0; i < n; i++) {
//            for (int j = 0; j < m; j++) {
//                a[i][j] = scanner.nextInt();
//            }
//        }


        int groupCount = Math.min(n, m) / 2;
        List<ArrayList<Integer>> groups = new ArrayList<>();

        for (int k = 0; k < groupCount; k++) {
            ArrayList group = new ArrayList();
            for (int j = k; j < m - k - 1; j++) {
                group.add(a[k][j]);
            }
            for (int i = k; i < n - k - 1; i++) {
                group.add(a[i][m - k - 1]);
            }
            for (int j = k + 1; j < m - k; j++) {
                group.add(a[n - k - 1][j]);

            }
            for(int i=k+1 ; i<n-k; i++){
                group.add(a[i][k]);
            }
            groups.add(group);
        }

        for(int k=0; k<groupCount ; k++){
            ArrayList group = groups.get(k);

            for (int j = k; j < m - k - 1; j++) {
                group.add(a[k][j]);
            }
            for (int i = k; i < n - k - 1; i++) {
                group.add(a[i][m - k - 1]);
            }
            for (int j = k + 1; j < m - k; j++) {
                group.add(a[n - k - 1][j]);

            }
            for(int i=k+1 ; i<n-k; i++){
                group.add(a[i][k]);
            }
            groups.add(group);
        }
    }
}
