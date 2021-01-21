package ThirdWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B11726 {

    private static int[] dp;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        dp = new int[N+1];
        dp[0] = 1; dp[1] = 1;

        System.out.println(BottonUp(N));
        br.close();
    }
    //        Botton Up 방식
    public static int BottonUp(int N){
        if(N>=2) {
            for (int i = 2; i <= N; i++) {
                dp[i] = dp[i - 1] + dp[i - 2];
                dp[i] %= 10007; //표현 가능한 숫자를 초과했을 때
            }
        }
        return dp[N];
    }
//    Top-down
    public  static int TopDown(int N){
        if (dp[N]>0){
            return dp[N];
        }
        if(N>=2){
            dp[N] = TopDown(N-1)+TopDown(N-2);
            dp[N] %= 10007;
        }
        return dp[N];
    }
}