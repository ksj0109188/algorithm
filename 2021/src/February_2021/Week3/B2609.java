package February_2021.Week3;

import java.io.*;
import java.util.StringTokenizer;

public class B2609 {
//    최대공약수와 최소공배수
//    https://www.acmicpc.net/problem/2609

    static int gcd(int x, int y) {
        if (y == 0) {
            return x;
        } else {
            return gcd(y, x % y);
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(System.out));
        StringTokenizer stringTokenizer = new StringTokenizer(bufferedReader.readLine(), " ");
        int x = Integer.parseInt(stringTokenizer.nextToken());
        int y = Integer.parseInt(stringTokenizer.nextToken());

        int g = gcd(x, y);
        int l = (x * y) / g;
        bufferedWriter.write(g + "\n");
        bufferedWriter.write(l + "");

        bufferedReader.close();
        bufferedWriter.close();
    }
}
