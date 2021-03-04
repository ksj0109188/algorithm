package March_2021.FirstWeek;

import java.util.Scanner;

//N과 M(2)
//선택 관점에서 푼 N과 M
//https://www.acmicpc.net/problem/15650
public class B15650_1 {
    static int[] s = new int[10];
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();

        go(1,0,N,M);
    }

    private static void go(int index, int selected, int n, int m) {
        if(selected==m){
            for(int i=0;i<m;i++){
                System.out.print(s[i]);
                if(i!=m-1){
                    System.out.print(" ");
                }
            }
            System.out.println();
            return;
        }
            if(index>n) return;
            s[selected]= index;
            go(index+1,selected+1,n,m);
            go(index+1,selected,n,m);
    }
}

