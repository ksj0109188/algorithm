package January_2021.FourthWeek;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B10844 {
    static long[][] dp = null;
    static int mod = 1000000000;
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        long result = 0;

        dp = new long[N + 1][10];
        for (int i = 1; i < 10; i++) {
            dp[1][i] = 1L;
        }
        for (int digit = 2; digit <= N; digit++) {
            for (int val = 0; val < 10; val++) {
                Botton_Up(digit, val);
            }
        }
        for (int i = 0; i < 10; i++) {
            result += dp[N][i];
        }
        System.out.println(result % mod);
    }

    private static long Botton_Up(int digit, int val) {
        if (val == 0) {
            dp[digit][val] = dp[digit - 1][1]%mod;
        } else if (val == 9) {
            dp[digit][val] = dp[digit - 1][8]%mod;
        } else {
            dp[digit][val] = (dp[digit - 1][val - 1] + dp[digit - 1][val + 1])%mod;
        }
        return dp[digit][val];
    }
}




