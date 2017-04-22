package dd.learn.java.fundamental;

/**
 * Created by Junqiao Wang on 2017/4/23.
 */
public class RefEscapeTest {
    static class A {
        final int X;

        A(int x) {
            X = x;
            B b = new B(this); // ref escape, very dangerous!!!
        }
    }

    static class B {
        int xCopy;
        B(A a) {
            xCopy = a.X;
            System.out.println(a.X);
        }
    }


    public static void main(String[] args) {
        for (int i = 0; i < 100; i ++) {
            A a = new A(3);
        }
    }
}
