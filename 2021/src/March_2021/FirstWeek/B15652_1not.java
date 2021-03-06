package March_2021.FirstWeek;

import java.util.Scanner;

// https://www.acmicpc.net/status?user_id=ksj0109188&problem_id=15652&from_mine=1
// M과 N 4번째 순서 관점에서 푼 문제.
public class B15652_1not {
    static StringBuilder stringBuilder = new StringBuilder();
    static int[] cnt = new int[10];

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();
        go(1, 0, n, m);
        System.out.println(stringBuilder);
        sc.close();
    }

    private static void go(int index, int selected, int n, int m) {
        if (selected == m) {
            for(int i=1;i<=n;i++){
                for(int j=0; j<cnt[i];j++){
                    stringBuilder.append(i);
                    stringBuilder.append(' ');
                }
            }
            stringBuilder.append("\n");
            return;
        }
        if(index>n) return;
        for (int i = m - selected; i >= 1; i--) {
            cnt[index] = i;
            go(index+1,selected+i,n,m);
        }
        cnt[index]=0;
        go(index+1,selected,n,m);
    }
}