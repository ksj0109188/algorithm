package May_2021.Week3;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class B14226 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int S = scanner.nextInt();
        int[][] time = new int[S + 1][S + 1];
        for (int i = 0; i <= S; i++) {
            Arrays.fill(time[i], -1);
        }

        Queue<Pair> queue = new LinkedList<>();
        queue.add(new Pair(1, 0));
        time[1][0] = 0;
        while (!queue.isEmpty()) {
            Pair pair = queue.remove();
            int s = pair.getX();
            int c = pair.getY();
            //1. 화면에 있는 이모티콘을 모두 복사해서 클립보드에 저장한다.
            if (time[s][s] == -1) {
                time[s][s] = time[s][c] + 1;
                queue.add(new Pair(s, s));
            }
            //2. 클립보드에 있는 모든 이모티콘을 화면에 붙여넣기 한다.
            if (s + c <= S && time[s + c][c] == -1) {
                time[s + c][c] = time[s][c] + 1;
                queue.add(new Pair(s + c, c));
            }
            //3. 삭제시
            if (s - 1 >= 0 && time[s - 1][c] == -1) {
                time[s - 1][c] = time[s][c] + 1;
                queue.add(new Pair(s - 1, c));
            }
        }
        int ans = -1;
        for (int i = 0; i <= S; i++) {
            if (time[S][i] != -1) {
                if (ans == -1 || ans > time[S][i]) {
                    ans = time[S][i];
                }
            }
        }
        System.out.println(ans);
    }
}
