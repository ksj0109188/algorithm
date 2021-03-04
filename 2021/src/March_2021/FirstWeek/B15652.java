package March_2021.FirstWeek;

import java.util.Scanner;
// https://www.acmicpc.net/status?user_id=ksj0109188&problem_id=15652&from_mine=1
// M과 N 4번째 순서 관점에서 푼 문제.
public class B15652 {
    static StringBuilder stringBuilder = new StringBuilder();
    static int[] s = new int[10];
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();

        System.out.println(go(0, 1,N, M));
    }

    private static StringBuilder go(int index, int starter, int n, int m) {
        if (index == m) {
            for(int i=0; i<m ; i++){
                stringBuilder.append(s[i]);
                if(i!=m){stringBuilder.append(" ");}
            }
            stringBuilder.append("\n");
            return stringBuilder;
        }
        for (int i = starter; i <= n; i++) {
            s[index] = i;
            go(index+1,i,n,m);
        }
        return stringBuilder;
    }
}
