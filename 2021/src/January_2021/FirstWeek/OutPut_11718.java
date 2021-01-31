package January_2021.FirstWeek;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class OutPut_11718 {
    public static void main(String[] args) throws IOException {
        BufferedReader buf = new BufferedReader(new InputStreamReader(System.in));
        String str;
        while((str=buf.readLine())!=null){
            System.out.println(str);
        }
        buf.close();
    }
}
