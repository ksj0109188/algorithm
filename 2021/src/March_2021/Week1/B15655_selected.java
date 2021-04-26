package March_2021.Week1;

import java.util.Arrays;
import java.util.Scanner;

//https://www.acmicpc.net/problem/15655
//N과 M(6)
//선택관점에서 푼 문제.
public class B15655_selected {
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
        go(1, 0, N, M);
        System.out.println(stringBuilder);
        scanner.close();
    }

    private static void go(int index, int selected, int n, int m) {
        if(selected>=m){
            for(int i=0; i<m ; i++){
                stringBuilder.append(num[a[i]-1]);
                stringBuilder.append(" ");
            }
            stringBuilder.append("\n");
            return;
        }
        if(index > n ) return;
        a[selected] = index;
        go(index+1,selected+1,n,m);
        a[selected] = 0;
        go(index+1,selected,n,m);
    }
}
