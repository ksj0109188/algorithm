package April_2021.ThirdWeek;

import java.util.*;

//https://www.acmicpc.net/problem/6603
//로또 (순열 방식)
public class B6603_2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            int N = scanner.nextInt();
            if (N == 0) {
                break;
            }
            int[] S = new int[N];
            int[] d = new int[N];
            for (int i = 0; i < N; i++) {
                S[i] = scanner.nextInt();
            }

            for (int i = 0; i < N; i++) {
                if (i < N - 6) d[i] = 0;
                else d[i] = 1;
            }

            ArrayList<ArrayList<Integer>> ans = new ArrayList<>();
            do {
                ArrayList<Integer> cur = new ArrayList<>();
                for (int i = 0; i < N; i++) {
                    if (d[i] == 1) {
                        cur.add(S[i]);
                    }
                }
                ans.add(cur);
            } while (next_permutation(d));
            Collections.sort(ans, new Comparator<ArrayList<Integer>>() {
                @Override
                public int compare(ArrayList<Integer> o1, ArrayList<Integer> o2) {
                    int s1 = o1.size();
                    int s2 = o2.size();
                    int i = 0;
                    while (i < s1 && i < s2) {
                        int t1 = o1.get(i);
                        int t2 = o2.get(i);
                        if (t1 < t2) return -1;
                        else if (t1 > t2) return 1;
                        i += 1;
                    }
                    if (i == s1 && i != s2) return -1;
                    else if (i != s1 && i == s2) return 1;
                    return 0;
                }
            });
            for (ArrayList<Integer> v : ans) {
                for (int x : v) {
                    System.out.print(x + " ");
                }
                System.out.println();
            }
        }
        scanner.close();
    }

    private static boolean next_permutation(int[] d) {
        int i = d.length - 1;
        while (i > 0 && d[i - 1] >= d[i]) i -= 1;

        if (i <= 0) {
            return false;
        }
        int j = d.length - 1;
        while (d[i - 1] >= d[j]) j -= 1;


        int temp = d[i - 1];
        d[i - 1] = d[j];
        d[j] = temp;

        j = d.length - 1;
        while (i < j) {
            temp = d[i];
            d[i] = d[j];
            d[j] = temp;
            i += 1;
            j -= 1;
        }
        return true;
    }
}
