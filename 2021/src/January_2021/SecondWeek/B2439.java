package January_2021.SecondWeek;

import java.io.*;

public class B2439 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder builder = new StringBuilder();
        int N = Integer.parseInt(br.readLine());

        for(int i=0; i<N; i++){
            for (int j=1; j<N-i ; j++){
                builder.append(" ");
            }
            for (int k=0; k<= i; k++ ){
                builder.append("*");
            }
            builder.append("\n");
        }
        bw.write(builder.toString());
        br.close();
        bw.flush();
        bw.close();
    }
}
