package ThirdWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B9095 {
    static int[] dp;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        StringBuilder builder = new StringBuilder();
        dp = new int[11];
        dp[0] = dp[1] = 1;
        dp[2] = 2;
        for (int i = 0; i < T; i++) {
            int N = Integer.parseInt(br.readLine());
//            int result=TopDown(N);
            int result = BottonUp(N);
            builder.append(result);
            builder.append("\n");
        }
        System.out.println(builder.toString());
        br.close();
    }

    private static int BottonUp(int Num) {
            for (int i = 3; i <= Num; i++) {
                if (dp[i] > 0) {
                    continue;
                }
                dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3];
            }
        return dp[Num];
    }
//    static public int TopDown(int Num){
//        if(dp[Num]>0){
//            return dp[Num];
//        }else if(Num ==2){
//            return dp[Num]=2; //dp배열의 2번째 요소에 값을 할당하고, 그에 해당하는 주소를 리턴했으니 T=1, N=2 일때, 결과값이 2가 출력.
//        } else{
//            dp[Num] = TopDown(Num-1)+TopDown(Num-2)+TopDown(Num-3);
//        }
//        return dp[Num];
//    }
}
