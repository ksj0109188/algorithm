package secondweek;

import java.io.*;

public class B2522 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        int N = Integer.parseInt(br.readLine());

        for(int i=1; i<N; i++){
            for(int j=i; j<N ; j++)sb.append(" ");
            for(int j=0; j<i ; j++)sb.append("*");
            sb.append("\n");
        }

        for(int i=0; i<N ; i++){
            sb.append("*");
        }
        sb.append("\n");
        for(int i=N-1; i>0; i--){
            for (int j=N; j>i ; j--)sb.append(" ");
            for (int j=i; j>0; j--)sb.append("*");
            sb.append("\n");
        }
        bw.write(String.valueOf(sb));
        br.close();
        bw.flush();
        bw.close();
    }
}
