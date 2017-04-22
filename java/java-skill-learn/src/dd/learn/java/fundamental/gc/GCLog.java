package dd.learn.java.fundamental.gc;

// -XX:+PrintGC -XX:+PrintGCDetails -XX:+UseConcMarkSweepGC/-XX:+UseG1GC
public class GCLog {
    public static void main(String[] args) throws Throwable {
        int cnt = 0;
        for (int i = 0; i < 100000000; i ++) {
            String s1 = "" + i;
            String s2 = " " + (i + 1);
            String s3 = s1 + s2;
            if (s3.length() > 3) {
                cnt ++;
            }
            if (i % 10000000 == 0) {
                Thread.sleep(500);
            }
        }
        System.out.println(cnt);
    }
}
