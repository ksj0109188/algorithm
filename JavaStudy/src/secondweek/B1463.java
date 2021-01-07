package secondweek;

import java.io.*;
import java.util.Scanner;

public class B1463 {

    public static void main(String[] args) throws IOException {
//        buffer를 이용한 방법.
//        버퍼를 이용하는 것이 입 출력 면에서 효율성이 좋다. 왜냐고? -> 문자를 입력, 출력 할때마다 문자 하나씩 전송하게 된다면 CPU가 많은 연산을 행한다.
//        따라서 버퍼를 두어 문자들을 저장해 필요할때마다 사용한다면 효율적이다.
        BufferedReader buf = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder builder = new StringBuilder();
        int N = Integer.parseInt(buf.readLine());
        for (int i = 0; i < N  ; i++) {
            builder.append("*");
            wr.write(builder.toString());
            wr.newLine();
        }
        buf.close();
        wr.flush();
        wr.close();

//        scanner를 이용한 방법
//        Scanner scanner = new Scanner(System.in);
//        int N = scanner.nextInt();
//        for(int i=0; i<N; i++){
//            for(int j=0; j<i+1; j++){
//                System.out.print("*");
//            }
//            System.out.println();
//        }

    }
}

