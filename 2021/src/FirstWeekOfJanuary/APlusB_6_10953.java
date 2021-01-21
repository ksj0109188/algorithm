package FirstWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

//Scanner보다 BufferedReader가 버퍼의 크기가 크기 때문에 더 빠르다.
//String객체는 문자열을 생성하고, 고정되어 있기때문에 문자를 추가 할때 객체 생성과 소멸 과정이 거쳐지므로 문자열을 조작할 땐 StringBuilder가 좋다.
public class APlusB_6_10953 {
    public static void main(String[] args) throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        int T =Integer.parseInt(bf.readLine());
        for(int i=0; i<T ;i++){
            String str = bf.readLine();
            st = new StringTokenizer(str,",");
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());
            System.out.println(a+b);
        }
        bf.close();
    }
}