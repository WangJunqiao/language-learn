package dd.learn.java.fundamental.classloader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;

/**
 * Created by junqiao.wjq on 2018/4/21.
 * 1, javac dd/learn/java/fundamental/Aaa.java
 * 2, 给定class文件路径名，还有类名（包含package的）就可以用自定义的classLoader来高事情了
 *
 * 用法应该是一些热切换的场景下，用一个类去代替另外一个类。   还有就是对class文件的加密。
 */
public class ClassLoaderTest extends ClassLoader {
	private byte[] getClassDataFromFile(String filename) {
		try {
			FileInputStream fis = new FileInputStream(filename);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int bufferSize = 4096;
			byte[] buffer = new byte[bufferSize];
			int bytesNumRead = 0;
			// 读取类文件的字节
			while ((bytesNumRead = fis.read(buffer)) != -1) {
				baos.write(buffer, 0, bytesNumRead);
			}
			//这里省略解密的过程.......
			return baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private Class<?> test() throws ClassNotFoundException {
		// 路径名随意, 只要能定位就可以了
		byte[] classData = getClassDataFromFile("src/dd/learn/java/fundamental/Aaa.class");
		if (classData == null) {
			throw new ClassNotFoundException();
		} else {
			// 这个是ClassLoader里面的函数
			return defineClass("dd.learn.java.fundamental.Aaa", classData, 0, classData.length);
		}
	}

	public static void main(String[] args) throws Exception {
		ClassLoaderTest tt = new ClassLoaderTest();
		IAaa aaa = (IAaa) tt.test().newInstance();
		aaa.doit();
	}
}
