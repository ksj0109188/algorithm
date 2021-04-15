package April_2021.ThirdWeek;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

//https://www.acmicpc.net/problem/11723
//집합
public class B11723 {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int M = Integer.parseInt(bufferedReader.readLine());
        int S = 0;
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < M; i++) {
            String[] line = bufferedReader.readLine().split(" ");
            if (line[0].equals("add")) {
                int index = Integer.parseInt(line[1]) - 1;
                S = S | (1 << index);
            } else if (line[0].equals("remove")) {
                int index = Integer.parseInt(line[1]) - 1;
                S = (S & ~(1 << index));
            } else if (line[0].equals("check")) {
                int index = Integer.parseInt(line[1]) - 1;
                int check  = S & (1 << index);
                if (check == 0) {
                    stringBuilder.append(0);
                    stringBuilder.append("\n");
                } else {
                    stringBuilder.append(1);
                    stringBuilder.append("\n");
                }
            } else if (line[0].equals("toggle")) {
                int index = Integer.parseInt(line[1]) - 1;
                S = S ^ (1 << index);
            } else if (line[0].equals("empty")) {
                S = 0;
            }
            //all
            else {
                S = (1 << 20) - 1;
            }
        }
        System.out.println(stringBuilder);
        bufferedReader.close();
    }
}
