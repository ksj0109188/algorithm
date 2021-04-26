package January_2021.Week4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B2193_BottonUp {

    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(bufferedReader.readLine());
        long[] dp = new long[N];
        long result = 0L;
        dp[0] = 1;
        if (N >= 2) {
            dp[1] = 1;
            for (int i = 2; i < N; i++) {
                dp[i] = dp[i - 1] + dp[i - 2];
            }
        }
        System.out.println(dp[N - 1]);
        bufferedReader.close();
    }
}

