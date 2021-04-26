package April_2021.Week1;

import java.util.Arrays;
import java.util.Scanner;
//https://www.acmicpc.net/problem/1759
//암호 만들기
public class B1759 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int l = scanner.nextInt();
        int c = scanner.nextInt();
        String[] alpha = new String[c];
        for (int i = 0; i < c; i++) alpha[i] = scanner.next();
        Arrays.sort(alpha);

        String password = "";
        go(l, alpha, password, 0);

        scanner.close();
    }

    private static void go(int l, String[] alpha, String password, int index) {
        if (password.length() == l) {
            if (check(password)) {
                System.out.println(password);
                return;
            }
        }
        if (index >= alpha.length) return;
        go(l, alpha, password + alpha[index], index+1);
        go(l, alpha, password, index+1);
    }

    private static boolean check(String password) {
        int mx = 0;
        int mv = 0;
        for (char alpha : password.toCharArray()) {
            if (alpha == 'a' || alpha == 'e' || alpha == 'i' || alpha == 'o' || alpha == 'u') {
                mx += 1;
            } else mv += 1;
        }
        return mx>=1 && mv >=2;
    }
}
