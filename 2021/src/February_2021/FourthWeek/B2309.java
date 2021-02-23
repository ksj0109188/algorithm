package February_2021.FourthWeek;

import java.util.*;
// 일곱 난쟁이.
//https://www.acmicpc.net/problem/2309
public class B2309 {

    static int sum = 0;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Integer> dwarfs = new ArrayList<Integer>();
        for (int i = 0; i < 9; i++) {
            int tall = scanner.nextInt();
            dwarfs.add(tall);
            sum += tall;
        }

        dwarfs = findDwarfs(dwarfs);
        Collections.sort(dwarfs);

        for (Integer result : dwarfs) {
            System.out.println(result);
        }
    }

    private static List<Integer> findDwarfs(List<Integer> dwarfs) {
        int length = dwarfs.size();
        for (int i = 0; i < length; i++) {
            for (int j = i+1; j < length ; j++) {
                if (sum - dwarfs.get(i) - dwarfs.get(j) == 100) {
                    dwarfs.remove(i);
                    dwarfs.remove(j-1);
                    return dwarfs;
                }
            }
        }
        return dwarfs;
    }
}
