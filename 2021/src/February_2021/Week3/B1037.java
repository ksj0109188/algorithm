package February_2021.Week3;

import java.util.Scanner;
//약수
//https://www.acmicpc.net/problem/1037
public class B1037 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int [] A = new int[N];
        int min = 1000001;
        int max = 0;
        for (int i=0; i < N; i++) {
            A[i] = scanner.nextInt();
        }
        for(int i=0; i<N; i++){
            if(A[i]<min){
                min = A[i];
            }if(A[i]>max){
                max = A[i];
            }
        }
        System.out.println(min*max);
    }
}
