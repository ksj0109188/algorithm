package SecondWeekOfJanuary;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B11721 {
    public static void main(String[] args) throws IOException {
        BufferedReader buf = new BufferedReader(new InputStreamReader(System.in));
        String at = buf.readLine();
        buf.close();
        int lastIndex = at.length() / 2;
        for (int i = 0; i < at.length(); i++) {
            System.out.print(at.charAt(i));
            if ((i + 1) % 10 == 0) {
                System.out.println("");
            }
        }
    }
}

