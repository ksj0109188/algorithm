package February_2021.FourthWeek;

import java.util.Scanner;

public class B14500 {

    static int[][][] block = {
            {{0, 1}, {0, 2}, {0, 3}},
            {{1, 0}, {2, 0}, {3, 0}},
            {{1, 0}, {1, 1}, {1, 2}},
            {{0, 1}, {1, 0}, {2, 0}},
            {{0, 1}, {0, 2}, {1, 2}},
            {{1, 0}, {2, 0}, {2, -1}},
            {{1,0},{1,-1},{1,-2}},
            {{1, 0}, {2, 0}, {2, 1}},
            {{0, 1}, {0, 2}, {1, 0}},
            {{0, 1}, {1, 1}, {2, 1}},
            {{0, 1}, {1, 0}, {1, 1}},
            {{0, 1}, {-1, 1}, {-1, 2}},
            {{1, 0}, {1, 1}, {2, 1}},
            {{0, 1}, {1, 1}, {1, 2}},
            {{1, 0}, {1, -1}, {2, -1}},
            {{0, 1}, {0, 2}, {-1, 1}},
            {{0, 1}, {0, 2}, {1, 1}},
            {{1, 0}, {2, 0}, {1, 1}},
            {{1, 0}, {2, 0}, {1, -1}},
    };

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        int[][] a = new int[N][M];
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                a[i][j] = scanner.nextInt();
            }
        }
        int ans = 0;
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                boolean ok = true;
                for (int k = 0; k < 19; k++) {
                    int sum = a[i][j];
                    for (int l = 0; l < 3; l++) {
                        int X = i + block[k][l][0];
                        int Y = j + block[k][l][1];
                        if (0 <= X && X < N && 0 <= Y && Y < M) {
                            sum+=a[X][Y];
                            ok = true;
                        }else{
                            ok = false;
                            break;
                        }
                    }
                    if(ok && ans<sum){
                        ans = sum;
                    }
                }
            }
        }
        System.out.println(ans);
    }
}


