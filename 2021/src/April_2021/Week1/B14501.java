package April_2021.Week1;

import java.util.Scanner;
//https://www.acmicpc.net/problem/14501
//퇴사
public class B14501 {
    static int[] T;
    static int[] P;
    static int N;
    static int result = -1;
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        T = new int[N];
        P = new int[N];
        for (int i = 0; i < N; i++) {
            T[i] = scanner.nextInt();
            P[i] = scanner.nextInt();
        }
        go(0,0);
        System.out.println(result);
        scanner.close();
    }

    private static void go(int day, int sum) {
        if(day==N){
            if(sum>result) result = sum;
            return ;
        }if(day>N){
            return ;
        }
        go(day+T[day],sum+P[day]);
        go(day+1,sum);
    }
}
