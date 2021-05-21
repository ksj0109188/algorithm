package May_2021.Week3;

import java.util.Scanner;

public class B15662 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int T = scanner.nextInt();
        int[][] a = new int[T][8];
        for (int i = 0; i < T; i++) {
            String s = scanner.next();
            for (int j = 0; j < 8; j++) {
                a[i][j] = s.charAt(j) - '0';
            }
        }


        int K = scanner.nextInt();
        while (K-- > 0) {
            int[] d = new int[T];
            int num = scanner.nextInt() - 1;
            int direction = scanner.nextInt();
            d[num] = direction;
            for (int i = num-1; i >= 0; i--) {
                if (a[i][2] != a[i+1][6]) {
                    d[i] = -d[i + 1];
                } else {
                    break;
                }
            }
            for (int i = num+1; i < T; i++) {
                    if (a[i][6] != a[i - 1][2]) {
                        d[i] = -d[i - 1];
                    } else {
                        break;
                }
            }

            for (int i = 0; i < T; i++) {
                if(d[i]==0) continue;
                if (d[i] == 1) {
                    //Right Shift
                    int temp = a[i][7];
                    for (int j = 7; j >= 1; j--) a[i][j] = a[i][j-1];
                    a[i][0] = temp;
                } else if (d[i] == -1) {
                    //Left Shift
                    int temp = a[i][0];
                    for (int j = 0; j < 7; j++) a[i][j] = a[i][j+1];
                    a[i][7] = temp;
                }
            }
        }
        int result = 0;
        for (int i = 0; i < T; i++) {
            if (a[i][0] == 1) {
                result += 1;
            }
        }
        System.out.println(result);
    }
}
