package March_2021.FirstWeek;

import java.util.Arrays;
import java.util.Scanner;
//https://www.acmicpc.net/problem/15656
//N과 M7
public class B15656 {
    static int[] num;
    static int[] s = new int[10];
    static StringBuilder stringBuilder = new StringBuilder();
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        num = new int[N];
        for (int i = 0; i < N; i++) {
            num[i] = scanner.nextInt();
        }
        Arrays.sort(num);
        go(0,N,M);
        System.out.println(stringBuilder);
        scanner.close();
    }

    private static void go(int index, int n, int m) {
        if(index==m){
            for(int i=0; i<m ; i++){
                int key = s[i];
                stringBuilder.append(num[key-1]);
                stringBuilder.append(" ");
            }
            stringBuilder.append("\n");
            return;
        }
        for(int i=1; i<=n ; i++){
            s[index]=i;
            go(index+1,n,m);
        }
    }
}
