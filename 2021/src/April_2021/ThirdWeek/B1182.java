package April_2021.ThirdWeek;

import java.util.Scanner;

public class B1182 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int S = scanner.nextInt();
        int[] bitMask = new int[N];
        int result = 0;
        for (int i = 0; i < N; i++) {
            bitMask[i] = scanner.nextInt();
        }

        for (int i = 1; i < (1 << N); i++) {
            int sum = 0;
            for (int j = 0; j < N; j++) {
                if ((i & (1 << j)) ==(1<<j)) {
                    sum += bitMask[j];
                }
            }
            if(sum==S){
                result += 1;
            }
        }
        scanner.close();
        System.out.println(result);
    }

}
