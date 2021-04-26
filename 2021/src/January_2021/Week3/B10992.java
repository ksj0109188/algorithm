package January_2021.Week3;

import java.io.*;

public class B10992 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();

        int N = Integer.parseInt(br.readLine());

        for(int i=0; i<N-1; i++ ){
            for(int j=i; j<N-1; j++)sb.append(" ");
            for(int j=0; j<(i*2)+1;j++){
                if(j==0 || j==i*2)sb.append("*");
                else sb.append(" ");
            }
            sb.append("\n");
        }
        for(int i=0; i<(N*2)-1;i++)sb.append("*");

        bw.write(sb.toString());
        br.close();
        bw.flush();
        bw.close();
    }
}
