package March_2021.Week1;

import java.util.Arrays;
import java.util.Scanner;

//
public class B15657_selected {
    static StringBuilder stringBuilder = new StringBuilder();
    static int[] num;
    static int[] a = new int[10];

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        num = new int[N];
        for (int i = 0; i < N; i++) {
            num[i] = scanner.nextInt();
        }
        Arrays.sort(num);
        go(0, 0, N, M);
        System.out.println(stringBuilder);
        scanner.close();
    }

    private static void go(int index, int selected, int n, int m) {
        if(selected>=m){
            for(int i=0; i<n ; i++){
                for(int j=0; j<a[i];j++){
                    stringBuilder.append(num[i]);
                    stringBuilder.append(" ");
                }
            }
            stringBuilder.append("\n");
            return;
        }
        if(index>=n) return;
        for (int i = m - selected; i > 0; i--) {
            a[index] = i;
            go(index+1,i+selected,n,m);
        }
        a[index] = 0;
        go(index+1,selected,n,m);
    }
}

