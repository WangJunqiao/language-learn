package dd.learn.java.fundamental.concurrent;

/**
 * Created by Junqiao Wang on 2017/4/22.
 *
 * volatile only ensure atomic, which means thread get the newest value
 * but when you write new value back it may have already been changed by other thread
 */
public class VolatileTest {
    static volatile int cnt = 0;
    private static void increase() {
        cnt ++;
    }

    public static void main(String[] args) {
        final int THREADS_COUNT = 20;
        Thread[]threads=new Thread[THREADS_COUNT];
        for (int i = 0; i < THREADS_COUNT; i++ ) {
            threads[i]=new Thread(new Runnable() {
                @Override
                public void run() {
                    for (int i = 0; i < 10000; i++) {
                        increase();
                    }
                }
            });
            threads[i].start();
        }
        while (true) {
            int liveT = 0;
            for (Thread thread : threads) {
                if (thread.isAlive()) liveT ++;
            }
            System.out.println(liveT);
            if (liveT == 0) break;
        }
        System.out.println(cnt);
    }
}
