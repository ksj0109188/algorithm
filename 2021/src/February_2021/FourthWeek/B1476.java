package February_2021.FourthWeek;

import java.util.Scanner;

//날짜 계산
//https://www.acmicpc.net/problem/1476
public class B1476 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int E = scanner.nextInt();
        int S = scanner.nextInt();
        int M = scanner.nextInt();
        E-=1; S-=1; M-=1;
        for (int i = 0; ; i++) {
            if (i % 15 == E && i % 28 == S && i % 19 == M) {
                System.out.println(i+1);
                break;
            }
        }
        scanner.close();
    }
}

//    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        int E = scanner.nextInt();
//        int S = scanner.nextInt();
//        int M = scanner.nextInt();
//        int e=1; int s=1; int m=1;
//        for(int i=1 ;; i++){
//            if(E==e && S==s && M==m){
//                System.out.println(i);
//                break;
//            }
//            e+=1;
//            s+=1;
//            m+=1;
//            if(e==16) e=1;
//            if(s==29) s=1;
//            if(m==20) m=1;
//        }
//        scanner.close();
//    }
//}
