package dd.learn.java.fundamental.concurrent;

/**
 * Created by junqiao.wjq on 2018/5/25.
 */
class AAA {
	synchronized void wait100_1() { // 对象锁
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	synchronized void wait100_2() { // 对象锁
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	void wait100_3() {
		synchronized (this) { // 对象锁，锁住整个对象的，而不是锁方法。  同步块比同步方法稍微高效一点
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	static synchronized void ClassLock_1() { // 类锁，锁的是
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}

class Runner extends Thread {
	AAA aaa;
	int w;
	public Runner(AAA aaa, int w) {
		this.aaa = aaa;
		this.w = w;
	}

	@Override
	public void run() {
		if (w == 1) {
			aaa.wait100_1();
		} else if (w == 2){
			aaa.wait100_2();
		} else if (w == 3) {
			aaa.wait100_3();
		}
	}
}

public class SyncronizedTest {
	public static void main(String[] args) throws Exception {
		AAA aaa = new AAA();
		Runner r1 = new Runner(aaa, 1);
		Runner r2 = new Runner(aaa, 2);
		Runner r3 = new Runner(aaa, 3);

		long start = System.currentTimeMillis();
		r1.start();
		r2.start();
		r3.start();
		r1.join();
		r2.join();
		r3.join();
		System.out.println(System.currentTimeMillis() - start);
	}
}
