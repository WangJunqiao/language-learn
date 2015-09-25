package dd.zjut;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by junqiao.wang on 8/19/15.
 */
public class LambdaSample {
    public static void main(String[] args) throws Exception {
        String[] strs = new String[]{"aaa", "bbbb", "ccc"};
        List<String> list = new ArrayList<>();
        for (String s : strs) {
            list.add(s);
        }
        //加不加return都可以
        list.stream().filter(s -> {return s.length() == 3;}).forEach((String s) -> System.out.println(s));
        list.stream().filter(s -> s.length() == 3).forEach((String s) -> System.out.println(s));

        new Thread(() -> {
            for (int i = 0; i < 10; i ++) {
                System.out.println("this is " + i);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();

        AAA.func("234", s -> System.out.println(s + " $$$")); //自定义的也可以
        AAA.func2("Hello", "SB", (s1, s2) -> {  //带返回值的
            return s1 + ", " + s2;
        });
    }

}

interface DoWithString {
    void doit(String s);
}

class AAA {
    public static void func(String s, DoWithString doWithString) {
        doWithString.doit(s);
    }

    public static void func2(String s1, String s2, DoubleString doubleString) {
        System.out.println(doubleString.fetch(s1, s2));
    }
}

interface DoubleString {
    String fetch(String s1, String s2);
}
