package dd.learn.java.fundamental;

/**
 * Created by Junqiao Wang on 2017/4/23.
 * 并发编程实践中，this引用逃逸（"this"escape）是指对象还没有构造完成，它的this引用就被发布出去了。
 * 这是危及到线程安全的，因为其他线程有可能通过这个逸出的引用访问到“初始化了一半”的对象(partially-constructed object)。
 * 这样就会出现某些线程中看到该对象的状态是没初始化完的状态，而在另外一些线程看到的却是已经初始化完的状态，这种不一致性是不确定的，程序也会因此而产生一些无法预知的并发错误。
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
