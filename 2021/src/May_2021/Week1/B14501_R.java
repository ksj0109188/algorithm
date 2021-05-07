package May_2021.Week1;

import java.util.Scanner;
//    https://www.acmicpc.net/problem/14501
//    퇴사 (DP를 이용한 풀이)
public class B14501_R {
    static int[] T;
    static int[] P;
    static int[] DP;
    static int N;
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        T = new int[N+1];
        P = new int[N+1];
        DP = new int[N+1];
        for(int i=1 ; i<=N; i++){
            T[i] = scanner.nextInt();
            P[i] = scanner.nextInt();
            DP[i] = -1;
        }
        int result = go(1);
        System.out.println(result);
    }

    private static int go(int day) {
        if(day == N+1){
            return 0;
        }if(day >= N+1){
            return -1001;
        }if(DP[day]!=-1){
            return DP[day];
        }
        int t2 = go(day+T[day])+P[day];
        int t1 = go(day+1);
        DP[day] =  Math.max(t1,t2);
        return DP[day];
    }
}
