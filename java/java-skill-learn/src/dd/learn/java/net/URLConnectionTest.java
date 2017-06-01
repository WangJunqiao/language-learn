package dd.learn.java.net;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 */
public class URLConnectionTest {
    public static void main(String[] args) throws Throwable {
        HttpURLConnection connection = null;
        InputStream iStream = null;
        //URL url = new URL("http://127.0.0.1:5000/");
        URL url = new URL("?query=star&device_id=1&entity_type=series%2Cmovie%2Cepisode%2Cgenre%2Cepisode%2Cs");
        connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(5);
        connection.setReadTimeout(4000);
        long start = System.nanoTime(), sss = System.currentTimeMillis();
        connection.connect();
        System.out.println(System.nanoTime() - start);
        iStream = connection.getInputStream();
        System.out.println(System.nanoTime() - start);
        BufferedReader br = new BufferedReader(new InputStreamReader(iStream));
        String s = null;
        while ((s = br.readLine()) != null) {
            System.out.println(s);
        }
        System.out.println(System.nanoTime() - start);
        System.out.println(System.currentTimeMillis() - sss);
    }
}
