package May_2021.Week3;


import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
//
//class Pair {
//    int x;
//    int y;
//
//    Pair(int x, int y) {
//        this.x = x;
//        this.y = y;
//    }
//
//    public int getX() {
//        return x;
//    }
//
//    public int getY() {
//        return y;
//    }
//}

public class B7562 {

    static int[] dx = {-2, -1, 1, 2, 2, 1, -1, -2};
    static int[] dy = {1, 2, 2, 1, -1, -2, -2, -1};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Queue<Pair> queue = new LinkedList<>();
        int n = scanner.nextInt();
        int chess[][];
        int l;
        int startX;
        int startY;
        int targetX;
        int targetY;

        while (n-- > 0) {
            l = scanner.nextInt();
            chess = new int[l][l];
            startX = scanner.nextInt();
            startY = scanner.nextInt();
            targetX = scanner.nextInt();
            targetY = scanner.nextInt();
            if (startX == targetX && startY == targetY) {
                System.out.println(0);
                continue;
            }

            queue.add(new Pair(startX, startY));
            while (!queue.isEmpty()) {
                Pair pair = queue.remove();
                for (int i = 0; i < dx.length; i++) {
                    int nx = dx[i] + pair.getX();
                    int ny = dy[i] + pair.getY();
                    if (nx >= 0 && ny >= 0 && nx < l && ny < l) {
                        if (chess[nx][ny] == 0) {
                            queue.add(new Pair(nx, ny));
                            chess[nx][ny] = chess[pair.getX()][pair.getY()] + 1;
                        }
                    }
                }
            }
            System.out.println(chess[targetX][targetY]);
        }
    }
}
