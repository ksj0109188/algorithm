package February_2021.Week4;

import java.util.Scanner;

// 수 이어쓰기 1
// https://www.acmicpc.net/problem/1748
public class B1748 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        long ans = 0;
        for(int len=1, start=1; start<=N ; start*=10, len+=1){
            int end = start*10 -1;
            if(end > N){
                end = N;
            }
            ans += (end-start+1)*len;
        }
        System.out.println(ans);
    }
}
