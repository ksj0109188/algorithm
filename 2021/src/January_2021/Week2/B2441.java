package January_2021.Week2;

import java.io.*;

public class B2441 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder st = new StringBuilder();
        int N = Integer.parseInt(br.readLine());
        for (int i=0; i<N ; i++){
            for(int j=0; j<i ; j++){
                st.append(" ");
            }
            for (int k=i; k<N ; k++){
                st.append("*");
            }
            st.append("\n");
        }
        bw.write(st.toString());
        br.close();
        bw.flush();
        bw.close();
    }
}
