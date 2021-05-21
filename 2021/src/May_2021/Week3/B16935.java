package May_2021.Week3;

import java.util.Scanner;

public class B16935 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        int r = scanner.nextInt();
        int[][] arr = new int[n][m];
        int[][] result = new int[n][m];
        arr = new int[][]{
                {3, 2, 6, 3, 1, 2, 9, 7},
                {9, 7, 8, 2, 1, 4, 5, 3},
                {5, 9, 2, 1, 9, 6, 1, 8},
                {2, 1, 3, 8, 6, 3, 9, 2},
                {1, 3, 2, 8, 7, 9, 2, 1},
                {4, 5, 1, 9, 8, 2, 1, 3}};
//        for (int i = 0; i < n; i++) {
//            for (int j = 0; j < m; j++) {
//                arr[i][j] = scanner.nextInt();
//            }
//        }
        while (r-- > 0) {
            int op = scanner.nextInt();
            if (op == 1) arr = operator1(arr);
            else if (op == 2) arr = operator2(arr);
            else if (op == 3) arr = operator3(arr);
            else if (op == 4) arr = operator4(arr);
            else if (op == 5) arr = operator5(arr);
            else if (op == 6) arr = operator6(arr);
        }

        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                System.out.print(arr[i][j] + " ");
            }
            System.out.println();
        }
    }

    private static int[][] operator6(int[][] arr) {
        int n = arr.length;
        int m = arr[0].length;
        int[][] result = new int[n][m];
        for (int i = 0; i < n / 2; i++) {
            for (int j = 0; j < m / 2; j++) {
                //1->4
                result[i + n / 2][j] = arr[i][j];
                //4->3
                result[i + n / 2][j + m / 2] = arr[i + n / 2][j];
                //3->2
                result[i][j + m / 2] = arr[i + n / 2][j + m / 2];
                //2->1
                result[i][j] = arr[i][j + m / 2];
            }
        }
        return result;
    }

    private static int[][] operator5(int[][] arr) {
        int n = arr.length;
        int m = arr[0].length;
        int[][] result = new int[n][m];
        for (int i = 0; i < n / 2; i++) {
            for (int j = 0; j < m / 2; j++) {
                //1->2
                result[i][j + m / 2] = arr[i][j];
                //2->3
                result[i + n / 2][j + m / 2] = arr[i][j + m / 2];
                //3->4
                result[i + n / 2][j] = arr[i + n / 2][j + m / 2];
                //4->1
                result[i][j] = arr[i + n / 2][j];
            }
        }
        return result;
    }


    private static int[][] operator4(int[][] arr) {
        int n = arr.length;
        int m = arr[0].length;
        int[][] result = new int[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                result[i][j] = arr[j][m - i - 1];
            }
        }
        return result;
    }

        private static int[][] operator3 ( int[][] arr){
            int n = arr.length;
            int m = arr[0].length;
            int[][] result = new int[m][n];
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < n; j++) {
                    result[i][j] = arr[n - j - 1][i];
                }
            }
            return result;
        }

        private static int[][] operator2 ( int[][] arr){
            int n = arr.length;
            int m = arr[0].length;
            int[][] result = new int[n][m];
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    result[i][j] = arr[i][m - j - 1];
                }
            }
            return result;
        }

        private static int[][] operator1 ( int[][] arr){
            int n = arr.length;
            int m = arr[0].length;
            int[][] result = new int[n][m];
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    result[i][j] = arr[n - i - 1][j];
                }
            }
            return result;
        }
}
