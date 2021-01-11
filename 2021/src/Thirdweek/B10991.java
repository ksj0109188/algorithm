package Thirdweek;

import java.io.*;

public class B10991 {
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder builder = new StringBuilder();

        int N = Integer.parseInt(reader.readLine());

        for (int i=0; i<N; i++){
            for (int j=i; j<N-1; j++)builder.append(" ");
            for (int j=0; j<(i*2)+1;j++){
                if (j%2==0) builder.append("*");
                else builder.append(" ");
            }
            builder.append("\n");
        }
        writer.write(builder.toString());
        writer.flush();
        writer.close();
        reader.close();
    }
}
