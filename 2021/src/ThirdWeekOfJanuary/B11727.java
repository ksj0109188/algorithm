package ThirdWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B11727 {
    private static int[] dp;
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        dp = new int[N+1];
        dp[0] = dp[1] = 1;
        System.out.println(BottonUp(N));
        br.close();
    }
//BottonUp 방식
    private static int BottonUp(int Num) {
        for(int i=2; i<=Num ; i++){
            dp[i] = (dp[i-1]+(dp[i-2]*2))%10007;
        }
        return dp[Num];
    }
// Top-down 방식
//    private static int TopDown(int Num) {
//        if(dp[Num]>0)return dp[Num];
//        else dp[Num] = (TopDown(Num-1)+(TopDown(Num-2)*2))%10007;
//        return dp[Num];
//    }
}
