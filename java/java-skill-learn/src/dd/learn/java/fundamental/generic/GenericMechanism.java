package dd.learn.java.fundamental.generic;

import java.util.List;

/**
 * Created by Junqiao Wang on 2017/4/22.
 */
public class GenericMechanism {

    public static int method() {
        int a;
        if (true) {
            a = 4;
        } else {
            a = 5;
        }
        return a;
    }
    public static void main(String[] args) {
        System.out.println(method());
    }
}
