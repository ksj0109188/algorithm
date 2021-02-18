package February_2021.ThirdWeek;

import java.io.*;
//약수의 합
//https://www.acmicpc.net/problem/17425

public class B17425 {
    final static int MAX = 1000000;

    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(System.out));
        long[] Numbers = new long[MAX + 1]; //문제에서 f(y)에 해당
        long[] result = new long[MAX + 1]; //문제에서 g(x)에 해당

        for (int i = 0; i < MAX + 1; i++) {
            Numbers[i] = 1;
        }

        for (int i = 2; i < MAX + 1; i++) {
            for (int j = 1; i * j <= MAX; j++) {
                Numbers[i * j] += i;
            }
        }

        for (int i = 1; i < MAX + 1; i++) {
            result[i] = result[i - 1] + Numbers[i];
        }

        int T = Integer.parseInt(bufferedReader.readLine());
        while(T-- > 0){
            int N = Integer.parseInt(bufferedReader.readLine());
            bufferedWriter.write(result[N]+"\n");
        }
        bufferedReader.close();
        bufferedWriter.close();
    }
}