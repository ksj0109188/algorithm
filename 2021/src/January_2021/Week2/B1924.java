package January_2021.Week2;

import java.util.Scanner;

public class B1924 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int x = scanner.nextInt();
        int y = scanner.nextInt();
        int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        String[] dayoftheweek = {"SUN","MON","TUE","WED","THU","FRI","SAT"};
        for (int i = 0; i < x-1; i++) {
            y += months[i];
        }
        System.out.println(dayoftheweek[y%7]);
        scanner.close();
    }
}

