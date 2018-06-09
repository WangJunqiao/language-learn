package dd.learn.java.fundamental.concurrent;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Created by junqiao.wjq on 2018/5/27.
 * 几百个线程同时需要增加atomic时，用这个方法，散列他们，最后我们要get的时候加起来
 */

class MyAtom {
	int num;
	AtomicLong[] als;
	public MyAtom(int num) {
		this.als = new AtomicLong[num + 1];
		for (int i = 0; i < num + 1; i ++) {
			als[i] = new AtomicLong(0L);
		}
		this.num = num;
	}

	public void add1() {
		int id = (int) (Thread.currentThread().getId() & (long) num);
		als[id].addAndGet(1);
	}

	public long get() {
		long rtv = 0;
		for (AtomicLong al : als) rtv += al.get();
		return rtv;
	}
}

public class AtomicTest {
	class AddThread extends Thread {
		MyAtom al;

		public AddThread(MyAtom al) {
			this.al = al;
		}

		@Override
		public void run() {
			for (int i = 0; i < Round; i ++) {
				al.add1();
			}
		}
	}

	Long Round;

	void test() throws Exception {
		List<AddThread> list = new ArrayList<>();
		MyAtom al = new MyAtom(3);
		final int NUM = 50;
		System.out.println("NUM = " + NUM);
		Round = 1000000000L / NUM;
		for (int i = 0; i < NUM; i ++) {
			AddThread add = new AddThread(al);
			list.add(add);
		}
		for (int i = 0; i < NUM; i ++) {
			list.get(i).start();
		}
		System.out.println("dddd");
		long start = System.currentTimeMillis();
		for (int i = 0; i < NUM; i ++) {
			list.get(i).join();
		}
		System.out.println(System.currentTimeMillis() - start);
		System.out.println(al.get());
	}

	public static void main(String[] args) throws Exception {
		new AtomicTest().test();
	}
}
