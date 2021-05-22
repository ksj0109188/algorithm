package May_2021.Week3;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;


public class B15685 {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean[][] a = new boolean[101][101];
        //>, ^, < ,v
        int[] dy = {1, 0, -1, 0};
        int[] dx = {0, -1, 0, 1};
        int n = scanner.nextInt();

        while (n-- > 0) {
            int y = scanner.nextInt();
            int x = scanner.nextInt();
            int direct = scanner.nextInt();
            int g = scanner.nextInt();
            ArrayList<Integer> lines = curve(y, x, direct, g);
            a[x][y] = true;
            for (int line : lines) {
                y += dy[line];
                x += dx[line];
                a[x][y] = true;
            }
        }
        int ans = 0;
        for (int i = 0; i <= 99; i++) {
            for (int j = 0; j <= 99; j++) {
                if (a[i][j] && a[i + 1][j] && a[i + 1][j + 1] && a[i][j + 1]) ans += 1;
            }
        }
        System.out.println(ans);
    }

    private static ArrayList<Integer> curve(int y, int x, int direct, int g) {
        ArrayList<Integer> arrayList = new ArrayList<>();
        arrayList.add(direct);
        for (int i = 1; i <= g; i++) {
            ArrayList<Integer> temp = new ArrayList<>(arrayList);
            Collections.reverse(temp);
            for (int j = 0; j < temp.size(); j++) {
                temp.set(j, (temp.get(j) + 1) % 4);
            }
            arrayList.addAll(temp);
        }
        return arrayList;
    }

}
