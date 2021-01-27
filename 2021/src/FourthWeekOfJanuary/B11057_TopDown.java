package FourthWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
//https://www.acmicpc.net/problem/11057
//TopDown 방식적용.
public class B11057_TopDown {
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
        for (int i = 0; i < 10; i++) {
            result += recursive(N, i);
        }
        System.out.println(result%mod);
    }

    private static long recursive(int digit, int val) {
        if (dp[digit][val] != 0) {
            return dp[digit][val];
        }else{
            for (int i = 0; i <= val; i++) {
                dp[digit][val] += recursive(digit - 1, i) % mod;
            }
            return dp[digit][val];
        }
    }
}