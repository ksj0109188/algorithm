package April_2021.FirstWeek;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

//https://www.acmicpc.net/problem/15661
//링크와 스타트
public class B15661 {
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

        List<Integer> team_start = new ArrayList<Integer>();
        List<Integer> team_link = new ArrayList<Integer>();
        System.out.println(go(0, team_start, team_link));
        scanner.close();
    }

    private static int go(int index, List<Integer> team_start, List<Integer> team_link) {
        if (index == N) {
            if (team_start.size() < 1) return -1;
            if (team_link.size() < 1) return -1;
            int first = 0;
            int second = 0;
            for (int i = 0; i < team_start.size(); i++) {
                for (int j = 0; j < team_start.size(); j++) {
                    first += s[team_start.get(i)][team_start.get(j)];
                }
            }
            for (int i = 0; i < team_link.size(); i++) {
                for (int j = 0; j < team_link.size(); j++) {
                    second += s[team_link.get(i)][team_link.get(j)];
                }
            }
            return Math.abs(first - second);
        }
        int ans = -1;
        team_start.add(index);
        int t1 = go(index + 1, team_start, team_link);
        team_start.remove(team_start.size() - 1);
        if (ans == -1 || (t1!=-1 && ans > t1)) {
            ans = t1;
        }
        team_link.add(index);
        int t2 = go(index + 1, team_start, team_link);
        if (ans == -1 || (t2!=-1 && ans > t2)) {
            ans = t2;
        }
        team_link.remove(team_link.size() - 1);
        return ans;
    }
}
