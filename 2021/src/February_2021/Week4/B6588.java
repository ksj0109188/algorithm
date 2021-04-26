package February_2021.Week4;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

//    골드바흐의 추측
//    https://www.acmicpc.net/problem/6588
public class B6588 {
    static final int MAX = 1000000;

    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Integer> prime = new ArrayList<Integer>();
        int pn = 0;
        boolean[] checked = new boolean[MAX + 1];

        checked[0] = checked[1] = true; //true는 지워짐.
        for (int i = 2; i<= MAX; i++) {
            if (checked[i] == true) {
                continue;
            }
            prime.add(i);
            for (int j = i + i; j <= MAX; j += i) {
                checked[j] = true;
            }
        }
        pn = prime.size();
        while (true) {
            int n = scanner.nextInt();
            if (n == 0) {
                break;
            }
            for (int i = 1; i < pn; i++) {
                int primeNumber = prime.get(i);
                if (!checked[n - primeNumber]) {
                    System.out.println(n + " = " + primeNumber + " + " + (n - primeNumber));
                    break;
                }
            }
        }
    }
}
