package secondweek;

import java.io.*;
import java.nio.Buffer;

public class B2445 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        int N = Integer.parseInt(br.readLine());

        for(int i=1; i<=N ;i++) {
            for (int j = 0; j<i; j++){
                sb.append("*");
            }
            for (int k =0 ; k<(N-i); k++){
                sb.append("  "); //공백이 두개입니다.
            }
            for (int l = 0; l<i ; l++){
                sb.append("*");
            }
            sb.append("\n");
        }
        for(int i=1; i<N; i++) {
            for (int j = 0; j<N-i; j++){
                sb.append("*");
            }
            for (int k =0 ; k<i; k++){
                sb.append("  ");
            }
            for (int j = 0; j<N-i; j++){
                sb.append("*");
            }
            sb.append("\n");
        }
        br.close();
        bw.flush();
        bw.close();
        System.out.println(sb);
    }
}

