package FourthWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B2193_TopDown {
    static long [] dp = null;
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(bufferedReader.readLine());
        dp = new long[N+1];
        System.out.println(TopDown(N));
        bufferedReader.close();
    }

    public static long TopDown(int dp_index){
        if(dp_index==1 || dp_index==2 ){
            return 1;
        }if(dp[dp_index]>0){
            return dp[dp_index];
        } else{
            return dp[dp_index] = TopDown(dp_index-1)+TopDown(dp_index-2);
        }
    }
}
