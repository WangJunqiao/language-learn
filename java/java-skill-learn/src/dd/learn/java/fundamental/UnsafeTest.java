package dd.learn.java.fundamental;

import java.lang.reflect.Field;

import sun.misc.Unsafe;
import sun.reflect.Reflection;

/**
 * Created by junqiao.wjq on 2018/6/7.
 */
public class UnsafeTest {

	static class User {
		private String name = "";
		private int age = 0;

		public User() {
			this.name = "test";
			this.age = 22;
		}

		@Override
		public String toString() {
			return name + ": " + age;
		}
	}


	public static void main(String[] args) throws NoSuchFieldException,
			SecurityException, IllegalArgumentException, IllegalAccessException, InstantiationException {
		// 通过反射得到theUnsafe对应的Field对象
		Field field = Unsafe.class.getDeclaredField("theUnsafe");
		// 设置该Field为可访问
		field.setAccessible(true);
		// 通过Field得到该Field对应的具体对象，传入null是因为该Field为static的
		Unsafe unsafe = (Unsafe) field.get(null);

		Field field1 = User.class.getDeclaredField("name");
		field1.setAccessible(true);
		User tmp = (User) field1.get(null);
		int a = 0;
		a ++;


		User user = (User) unsafe.allocateInstance(User.class);
		System.out.println(user); //dont invoke constructor, print null: 0

		User userFromNormal = new User();
		System.out.println(userFromNormal); //print test: 22

	}

}
