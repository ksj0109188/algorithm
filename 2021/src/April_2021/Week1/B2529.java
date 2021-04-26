package April_2021.Week1;

import java.util.*;

public class B2529 {
    static boolean[] checked = new boolean[10];
    static char[] sign;
    static List<String> result = new ArrayList<String>();
    static int k;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        k = scanner.nextInt();
        sign = new char[k];
        for (int i = 0; i < k; i++) {
            sign[i] = scanner.next().toCharArray()[0];
        }
        go(0, "");
        Collections.sort(result);
        int m = result.size();
        System.out.println(result.get(m - 1));
        System.out.println(result.get(0));
    }

    private static void go(int index, String number) {
        if (index == k + 1) {
            result.add(number);
            return;
        }
        for (int i = 0; i < 10; i++) {
            if (checked[i] == true) continue;
            if (index == 0 || OK(sign[index - 1], number.charAt(index - 1), (char)(i+'0'))) {
                checked[i] = true;
                go(index + 1, number + i);
                checked[i] = false;
            }
        }
    }

    private static boolean OK(char op, char x, char y) {
        if (op == '<') {
            if (x > y) return false;
        }
        if (op == '>') {
            if (x < y) return false;
        }
        return true;
    }


}
