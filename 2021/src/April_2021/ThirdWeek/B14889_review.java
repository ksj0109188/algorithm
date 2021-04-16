package April_2021.ThirdWeek;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

//https://www.acmicpc.net/problem/14889
// 스타트와 링크 (바트마스크로)
public class B14889_review {
    static int s[][];
    static int N;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        s = new int[N][N];
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                s[i][j] = scanner.nextInt();
            }
        }
        int result = Integer.MAX_VALUE;

        for (int i = 0; i < (1 << N); i++) {
            List<Integer> team_start = new ArrayList<Integer>();
            List<Integer> team_link = new ArrayList<Integer>();
            for (int j = 0; j < N; j++) {
                if ((i & (1 << j)) == 0) {
                    team_start.add(j);
                } else {
                    team_link.add(j);
                }
            }
            if (team_start.size() != N / 2) continue;

            int t1 = 0;
            int t2 = 0;
            for (int k = 0; k < N / 2; k++) {
                for (int l = 0; l < N / 2; l++) {
                    if (k == l) continue;
                    t1 += s[team_start.get(k)][team_start.get(l)];
                    t2 += s[team_link.get(k)][team_link.get(l)];
                }
            }
            int gap = Math.abs(t1-t2);
            if(gap<result){
                result = gap;
            }
        }
        System.out.println(result);
        scanner.close();
    }
}
