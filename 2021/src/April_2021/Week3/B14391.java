package April_2021.Week3;

import java.util.Scanner;

//https://www.acmicpc.net/problem/14391
//종이조각
public class B14391 {
    public static void main(String[] args) {
        System.out.println(1<<2);
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt(); // 세로크기 (행)
        int M = scanner.nextInt(); //가로크기 (열)
        int[][] s = new int[N][M];
        int ans = 0;
        for (int i = 0; i < N; i++) {
            String data = scanner.next();
            for (int j = 0; j < M; j++) {
                s[i][j] = data.charAt(j) - '0';
            }
        }


        for (int bit = 0; bit < (1 << (N*M)); bit++) {
            int sum = 0;

            for (int i = 0; i < N; i++) {
                int cur = 0;
                for (int j = 0; j < M; j++) {
                    int BitMaskIndex = i * M + j;
                    //BitMask의 bit 1은 세로, 0은 가로
                    if ((bit & (1 << BitMaskIndex)) == 0) {
                        cur = cur * 10 + s[i][j];
                    } else {
                        sum += cur;
                        cur = 0;
                    }
                }
                sum += cur;
            }

            for (int j = 0; j < M; j++) {
                int cur = 0;
                for (int i = 0; i < N; i++) {
                    int BitMaskIndex = i * M + j;
                    if ((bit & (1 << BitMaskIndex)) != 0) {
                        cur = cur * 10 + s[i][j];
                    }else{
                        sum += cur;
                        cur = 0;
                    }
                }
                sum += cur;
            }
            ans = Math.max(ans,sum);
        }
        System.out.println(ans);
        scanner.close();
    }
}
