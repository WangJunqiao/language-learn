package dd.learn.java.fundamental.concurrent;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by junqiao.wjq on 2018/5/28.
 */
public class ExecutorTest {
	public static void main(String[] args) {
		ExecutorService executorService = Executors.newFixedThreadPool(10);
	}
}
