package January_2021.ThirdWeek;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B10844 {
    static long[][] dp = null;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        long result = 0;
        dp = new long[N + 1][10];
        for (int i=0; i<10;i++){
            dp[1][i]=1L;
        }
        for(int i=1; i<10;i++){
            result += Top_Down(N,i);
        }
        System.out.println(result%1000000000);
    }
    private static long Top_Down(int digit, int val) {
        if (digit == 1) {
            return dp[digit][val];
        }if(dp[digit][val]==0){
            if(val==0){
                dp[digit][val]=Top_Down(digit-1,1);
            }else if(val==9){
                dp[digit][val]=Top_Down(digit-1,8);
            }else{
            dp[digit][val] = Top_Down(digit - 1, val - 1) + Top_Down(digit - 1, val + 1);
            }
        }
        return dp[digit][val]%1000000000;
    }
}



