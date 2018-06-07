package dd.learn.java.fundamental.concurrent;

/**
 * Created by Junqiao Wang on 2017/4/22.
 *
 * volatile only ensure atomic, which means thread get the newest value
 * but when you write new value back it may have already been changed by other thread
 * 并发程序要正确执行必须保证
 * 1，原子性            =>  通过syncronized来保证，也可以用Lock，也可以用AtomicInteger
 * 2，可见行            =>  通过volatile来保证
 * 3，有序性            =>  也可以通过volatile来保证
 *
 * JVM在进行指令重排序优化时，不能将在对volatile变量访问的语句放在其后面执行，也不能把volatile变量后面的语句放到其前面执行。
 *
 * 4.volatile的原理和实现机制

 　　下面这段话摘自《深入理解Java虚拟机》：

 　　“观察加入volatile关键字和没有加入volatile关键字时所生成的汇编代码发现，加入volatile关键字时，会多出一个lock前缀指令”

 　　lock前缀指令实际上相当于一个内存屏障（也成内存栅栏），内存屏障会提供3个功能：

 　　1）它确保指令重排序时不会把其后面的指令排到内存屏障之前的位置，也不会把前面的指令排到内存屏障的后面；即在执行到内存屏障这句指令时，在它前面的操作已经全部完成；

 　　2）它会强制将对缓存的修改操作立即写入主存；

 　　3）如果是写操作，它会导致其他CPU中对应的缓存行无效。
 */
public class VolatileTest {
    static volatile int cnt = 0;
    private static void increase() {
        cnt ++;
    }

    public static void main(String[] args) {
        final int THREADS_COUNT = 10;
        Thread[]threads=new Thread[THREADS_COUNT];
        for (int i = 0; i < THREADS_COUNT; i++ ) {
            threads[i]=new Thread(new Runnable() {
                @Override
                public void run() {
                    for (int i = 0; i < 1000; i++) {
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
