package January_2021.Week3;

import java.io.*;

public class B2446 {
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder builder = new StringBuilder();

        int N = Integer.parseInt(reader.readLine());

        for(int i=0; i<N ; i++){
            for(int j=0;j<i;j++) builder.append(" ");
            for(int j=i*2;j<(N*2)-1;j++) builder.append("*");
            builder.append("\n");
        }
        for(int i=1; i<N; i++){
            for(int j=i;j<N-1;j++) builder.append(" ");
            for(int j=0;j<(i*2)+1;j++) builder.append("*");
            builder.append("\n");
        }
        writer.write(builder.toString());
        writer.flush();
        writer.close();
        reader.close();
    }
}
