package February_2021.Week3;

import java.util.Scanner;

public class B4375 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNextInt()) {
            int N = scanner.nextInt();
            int Num = 0;
            for (int i = 1; ; i++) {
                Num = Num * 10 + 1;
                Num %= N;
                if(Num==0){
                    System.out.println(i);
                    break;
                }
            }
        }
        scanner.close();
    }
}
