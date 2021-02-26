package February_2021.FourthWeek;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

//카잉당력
//https://www.acmicpc.net/problem/6064

public class B6064 {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(bufferedReader.readLine());

        while (T-- > 0) {
            String[] inputLine = bufferedReader.readLine().split(" ");
            int M = Integer.parseInt(inputLine[0]);
            int N = Integer.parseInt(inputLine[1]);
            int x = Integer.parseInt(inputLine[2]);
            int y = Integer.parseInt(inputLine[3]);
            x -= 1;
            y -= 1;
            boolean notFound = false;
            for (int k = x; k < (M * N); k += M) {
                if (k % N == y) {
                    System.out.println(k + 1);
                    notFound = true;
                    break;
                }
            }
            if (!notFound) {
                System.out.println("-1");
            }
        }
    }
}
