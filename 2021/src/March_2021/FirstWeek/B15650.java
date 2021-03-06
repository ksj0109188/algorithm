package March_2021.FirstWeek;

import java.util.Scanner;
//N과 M(2)
//순서 관점에서 푼 N과 M
//https://www.acmicpc.net/problem/15650
public class B15650 {
    static boolean[] c = new boolean[10];
    static int[] s = new int[10];
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();

        go(0,1,N,M);
        scanner.close();
    }

    private static void go(int index, int start, int n, int m) {
        if(index==m){
            for(int i=0;i<m;i++){
                System.out.print(s[i]);
                if(i!=m-1){
                    System.out.print(" ");
                }
            }
            System.out.println();
            return;
        }
        for(int i=start;i<=n;i++){
            if(c[i]==true){
                continue;
            }
            c[i]=true; s[index]=i;
            go(index+1, i+1,n,m);
            c[i]=false;
        }
    }
}

