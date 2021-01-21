package SecondWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class B10818 {
    public static void main(String[] args) throws IOException {
// BufferedReader  89584KB	596ms
        BufferedReader buf = new BufferedReader(new InputStreamReader(System.in));
        Integer.parseInt(buf.readLine());
        StringTokenizer Token = new StringTokenizer(buf.readLine()," ");
        int Num = 0;
        int Min= 1000001,Max = -1000001;
        while(Token.hasMoreTokens()){
            Num = Integer.parseInt(Token.nextToken());
            if (Max < Num) {
                Max = Num;
            }if (Min > Num) { //els if 일 경우, 테스트케이스가 1일 때 제대로 비교를 못해준다. 따라서 if문을 써서 계속 비교해주거나 초기화값을 입력숫자중 첫 번째 숫자로 초기화 해주어야 한다.
                Min = Num;
            }
        }
        System.out.println(Min + " " + Max);
        buf.close();
    }

    //scanner 141156KB	1132ms
//        Scanner scanner = new Scanner(System.in);
//        int N = Integer.parseInt(scanner.nextLine());
//        String M = scanner.nextLine();
//        StringTokenizer st = new StringTokenizer(M, " ");
//        int initial_value = Integer.parseInt(st.nextToken());
//        int Max = initial_value, Min = initial_value;
//        int Num;
//        for (int i = 1; i < N; i++) {
//            Num = Integer.parseInt(st.nextToken());
//            if (Max < Num) {
//                Max = Num;
//            }else if (Min > Num) {
//                Min = Num;
////            }
//          System.out.println(Min + " " + Max);
//          scanner.close();
//        }
}