package March_2021.Week1;

import java.util.Arrays;
import java.util.Scanner;

public class B15657 {
    static StringBuilder stringBuilder = new StringBuilder();
    static int[] num;
    static int[] s = new int[10];
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        num = new int[N];
        for (int i = 0; i < N; i++) {
            num[i] = scanner.nextInt();
        }
        Arrays.sort(num);
        go(0, 1, N, M);
        System.out.println(stringBuilder);
        scanner.close();
    }

    private static void go(int index, int start, int n, int m) {
        if(index==m){
            for(int i=0;i<m;i++){
                int key = s[i];
                stringBuilder.append(num[key-1]);
                stringBuilder.append(" ");
            }
            stringBuilder.append("\n");
            return;
        }
        for(int i = start ; i<=n ; i++){
            s[index] = i;
            go(index+1,i,n,m);
        }
    }
}
