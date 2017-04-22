package dd.learn.java.fundamental.jit;

/**
 * -XX:+PrintCompilation
 * -Xint     => disable jit, use pure interpreter
 *
 * result is amazing!!!
 * disable jit: finished!, cnt = -49995000, time used = 14431
 * enable jit:  finished!, cnt = -49995000, time used = 373
 * 14431 / 373 = 38 !!!
 */
public class JITTest {

    private static int get(int seed) {
        int tmp = 1;
        for (int i = 0; i < 100000; i ++) {
            tmp = tmp * 2 + seed;
        }
        return tmp;
    }
    public static void main(String[] args) {
        long t = System.currentTimeMillis();
        int cnt = 0;
        for (int i = 0; i < 10000;i ++) {
            if (i % 1000 == 0) System.out.println(i);
            cnt += get(i);
        }
        System.out.println("finished!, cnt = " + cnt + ", time used = " + (System.currentTimeMillis() -t ));
    }
}
