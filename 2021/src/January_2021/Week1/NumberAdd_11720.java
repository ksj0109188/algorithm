package January_2021.Week1;

import java.io.IOException;
import java.util.Scanner;

public class NumberAdd_11720  {
    public  static  void main(String[] args)throws IOException {

        int sum=0;
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        String str = scanner.next();
        for(int i=0; i<n; i++){
            sum+=str.charAt(i)-48;
        }
        System.out.println(sum);
    }
}
