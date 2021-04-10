package April_2021.SecondWeek;

import java.util.Scanner;
//https://www.acmicpc.net/problem/10973
//이전 순열
public class B10973 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int[] a = new int[N];
        for (int i = 0; i < N; i++) {
            a[i] = scanner.nextInt();
        }
        if (prevPermutation(a)) {
            for (int j = 0; j < N; j++) {
                System.out.print(a[j] + " ");
            }
            System.out.println();
        }else{
            System.out.println("-1");
        }
        scanner.close();

    }

    private static boolean prevPermutation(int[] a) {
        int i = a.length-1;
        while(i>0 && a[i-1]<a[i]) i-=1;

        if(i<=0) return false;

        int j = a.length-1;
        while(a[i-1] < a[j]) j-=1;

        int temp = a[i-1];
        a[i-1] = a[j];
        a[j] = temp;

        j = a.length-1;
        while(i<j){
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
            i+=1;
            j-=1;
        }
        return true;
    }
}
