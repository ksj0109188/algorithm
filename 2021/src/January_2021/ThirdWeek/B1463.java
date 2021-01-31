package January_2021.ThirdWeek;

import java.io.*;

public class B1463 {
    public static int[] dp;
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        dp = new int[N+1];
        dp[0]= dp[1] = 0;
//        Botton UP방식
        for(int i=2; i<=N;i++){
            dp[i] = dp[i-1]+1;
            if(i%3==0) dp[i] = Math.min(dp[i/3]+1,dp[i]);
            if(i%2==0) dp[i] = Math.min(dp[i/2]+1,dp[i]);
        }
        System.out.println(dp[N]);
        br.close();
    }
// Top_Botton 방식
//    public static int recursive(int Num){
//        if (Num==1)return 0;
//        if (dp[Num]>0) return dp[Num];
//        dp[Num] = recursive(Num-1)+1;
//        if(Num%3==0) {
//            int temp = recursive(Num/3)+1;
//            if (dp[Num]>temp){
//                dp[Num]=temp;
//            }
//        }
//        if(Num%2==0){
//            int temp = recursive(Num/2)+1;
//            if (dp[Num]>temp){
//                dp[Num]=temp;
//            }
//        }
//        return dp[Num];
//    }
}
