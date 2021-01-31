package January_2021.FourthWeek;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

//https://www.acmicpc.net/problem/11057
//BottonUP(점화식) 방식적용.
public class B11057_BottonUp {
    static long dp[][];
    static int mod = 10007;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        long result = 0;

        dp = new long[N + 1][10];
        for (int i = 0; i < 10; i++) {
            dp[1][i] = 1;
        }
        for (int i = 2; i <= N; i++) {
            for (int j = 0; j < 10; j++) {
                for (int k = 0; k <= j; k++) {
                    dp[i][j]+=dp[i-1][k]%mod;
                }
            }
        }

        for(int i=0;i<10;i++){
            result += dp[N][i];
        }

        System.out.println(result % mod);
        br.close();
    }
}
