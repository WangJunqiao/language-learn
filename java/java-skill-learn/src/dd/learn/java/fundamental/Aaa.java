package dd.learn.java.fundamental;

import dd.learn.java.fundamental.classloader.IAaa;

/**
 * Created by junqiao.wjq on 2018/4/21.
 */
public class Aaa implements IAaa{
	@Override
	public void doit() {
		System.out.println("This is doit from Aaa");
	}
}
