package secondweek;

import java.io.*;

public class B2442 {
    public static void main(String[] args)  throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        int N = Integer.parseInt(br.readLine());
        for(int i=0; i<N; i++) {
            for (int j = i; j < N - 1; j++) {
                sb.append(" ");
            }
            for (int k=0; k<(i*2)+1 ;k++){
                sb.append("*");
            }
            sb.append("\n");
        }
        System.out.println(sb);
        br.close();
        bw.flush();
        bw.close();
    }
}
