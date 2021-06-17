package June_2021.Week3;

import java.util.ArrayList;
import java.util.Scanner;

public class B16198 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        ArrayList<Integer> arr = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            arr.add(scanner.nextInt());
        }

        System.out.println(solve(arr));
    }

    private static int solve(ArrayList<Integer> arr) {
        int arr_size = arr.size();
        if (arr_size == 2) {
            return 0;
        }
        int ans = -1;
        for (int x = 1; x < arr_size - 1; x++) {
            ArrayList<Integer> temp_arr = new ArrayList<>(arr);
            temp_arr.remove(x);
            int temp_ans = solve(temp_arr);
            temp_ans += arr.get(x - 1) * arr.get(x + 1);
            if (ans == -1 || ans < temp_ans) ans = temp_ans;
        }
        return ans;
    }
}
