package April_2021.SecondWeek;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/1248
//1248 맞춰봐 문제
public class B1248 {
    static List<Integer> result = new ArrayList<>();
    static int N;
    static int[][] sign;
    static int[] ans;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        String s = scanner.next();
        sign = new int[N][N];
        ans = new int[N];
        int cnt = 0;
        for (int i = 0; i < N; i++) {
            for (int j = i; j < N; j++) {
                char c = s.charAt(cnt);
                if (c == '0') {
                    sign[i][j] = 0;
                } else if (c == '+') {
                    sign[i][j] = 1;
                } else {
                    sign[i][j] = -1;
                }
                cnt++;
            }
        }
        go(0);
        for (int i = 0; i < N; i++) {
            System.out.print(ans[i] + " ");
        }
    }

    private static boolean go(int index) {
        if (index == N) {
            return true;
//            return OK();
        }
        if (sign[index][index] == 0) {
            ans[index] = 0;
            return check(index) && go(index + 1);
        }
        for (int i = -10; i <= 10; i++) {
            ans[index] = sign[index][index] * i;
            if (check(index) && go(index + 1)) return true;
        }
        return false;
    }

    private static boolean check(int index) {
        int sum = 0;
        for (int i = index; i >= 0; i--) {
            sum += ans[i];
            if (sign[i][index] == 0 && sum != 0) return false;
            else if (sign[i][index] > 0 && sum <= 0) return false;
            else if (sign[i][index] < 0 && sum >= 0) return false;
        }
        return true;
    }

//    private static boolean OK() {
//        for (int i = 0; i < N; i++) {
//            int sum = 0;
//            for (int j = i; j < N; j++) {
//                sum += ans[j];
//                if (sign[i][j] == 0 && sum != 0) return false;
//                else if (sign[i][j] > 0 && sum <= 0) return false;
//                else if (sign[i][j] < 0 && sum >= 0) return false;
//            }
//        }
//        return true;
//    }
}
