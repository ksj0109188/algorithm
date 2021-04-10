package April_2021.SecondWeek;

import java.util.Scanner;

//https://www.acmicpc.net/problem/10974
//모든 순열
public class B10974 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int[] a = new int[N];
        for(int i=0; i<N ; i++){
            a[i] = i+1;
        }
        do {
            for (int  i=0; i<a.length;i++){
                System.out.print(a[i]+" ");
            }
            System.out.println();
        }while(nextPermutation(a));
        scanner.close();
    }

    private static boolean nextPermutation(int[] a) {
        int i=a.length-1;
        while(i>0&&a[i-1]>=a[i]) i-=1;

        if(i<=0) return false;

        int j = a.length-1;
        while(a[i-1]>=a[j]) j-=1;

        int temp =  a[i-1];
        a[i-1] = a[j];
        a[j] = temp;
        j=a.length-1;
        while(i<j){
            temp= a[i];
            a[i]=a[j];
            a[j]=temp;
            i+=1;
            j-=1;
        }
        return true;
    }
}
