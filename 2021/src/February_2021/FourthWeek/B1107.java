package February_2021.FourthWeek;

import java.util.Scanner;

//    리모콘 문제
//    https://www.acmicpc.net/problem/1107
public class B1107 {
    static boolean[] Broken = new boolean[10]; //true는 해당 번호가 지워짐

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt(); //목표채널
        int M = scanner.nextInt(); //고장난 수

        int ans = N - 100;
        if (ans < 0) {
            ans = -ans;
        }

        for (int j = 0; j < M; j++) {
            Broken[scanner.nextInt()] = true;
        }

        for (int i = 0; i <= 1000000; i++) {
            int len = possible(i);
            if(len>0){
                int press = i-N;
                if(press<0){
                    press = -press;
                }
                if(ans>len+press){
                    ans = len+press;
                }
            }
        }
        System.out.println(ans);
    }

    private static int possible(int c) {
        int len = 0;
        if (c==0){
            if(Broken[0]) return 0;
            else return 1;
        }
        while (c > 0) {
            if (Broken[c % 10]) {
                return 0;
            }
            c /= 10;
            len += 1;
        }
        return len;
    }
}
