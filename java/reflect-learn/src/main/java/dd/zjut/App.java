package dd.zjut;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Hello world!
 */
public class App {

    public static Object copyBean(Object obj) throws Exception {
        Class<?> c = obj.getClass();
        Object ret = c.newInstance();

        Field[] fields = c.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
            f.set(ret, f.get(obj));
        }
        return ret;
    }

    public static void main(String[] args) throws Exception {
        App a = new App();

        //下面是三种获得Class的方法
        System.out.println(a.getClass().getName());
        System.out.println(App.class.getName());
        Class c = Class.forName("dd.zjut.Person");


        Method[] methods = c.getDeclaredMethods(); //返回所有在类里面声明了的函数，不包含构造函数
        for (Method m : methods) {
            System.out.println(m);
        }
        println(2);

        methods = c.getMethods();                  //返回所有类的公共函数，包含从父类继承来的
        for (Method m : methods) {
            System.out.println(m);
        }
        println(2);


        Field[] fields = c.getFields();           //返回所有类的公共成员，包含从父类继承来的
        for (Field f : fields) {
            System.out.println(f);
        }
        println(2);

        fields = c.getDeclaredFields();           //返回所有在类里面声明了的成员
        for (Field f : fields) {
            System.out.println(f);
        }
        println(2);


        Method printInfo = c.getDeclaredMethod("printInfo");
        Object obj = c.newInstance();             //调用默认构造函数
        printInfo.invoke(obj);                    //调用方法

        Field nameField = c.getDeclaredField("name");
        nameField.setAccessible(true); //name 是private的，因此必须现获得访问权限
        nameField.set(obj, "xixi");
        printInfo.invoke(obj);


        Object copied = copyBean(obj);
        printInfo.invoke(copied);


        Constructor constructor = c.getConstructor(String.class, int.class, Person.Sex.class); //获得参数列表为这个的构造函数
        Object ooo = constructor.newInstance("haha", 15, Person.Sex.FEMALE);
        printInfo.invoke(ooo);

        System.out.println(c.getSuperclass()); //获得父类，便于递归处理
    }

    public static void println(int n) {
        for (int i = 0; i < n; i ++) {
            System.out.println();
        }
    }
}

/*
output:

dd.zjut.App
dd.zjut.App
public void dd.zjut.Person.printInfo()
private void dd.zjut.Person.updateCount()
public static void dd.zjut.Person.printAgePersonCount()
public void dd.zjut.Person.agePlus()


public void dd.zjut.Person.printInfo()
public static void dd.zjut.Person.printAgePersonCount()
public void dd.zjut.Person.agePlus()
public void dd.zjut.Animal.setType(dd.zjut.Animal$Type)
public dd.zjut.Animal$Type dd.zjut.Animal.getType()
public final void java.lang.Object.wait(long,int) throws java.lang.InterruptedException
public final native void java.lang.Object.wait(long) throws java.lang.InterruptedException
public final void java.lang.Object.wait() throws java.lang.InterruptedException
public boolean java.lang.Object.equals(java.lang.Object)
public java.lang.String java.lang.Object.toString()
public native int java.lang.Object.hashCode()
public final native java.lang.Class java.lang.Object.getClass()
public final native void java.lang.Object.notify()
public final native void java.lang.Object.notifyAll()


public static java.util.Map dd.zjut.Person.agePersonCount


private java.lang.String dd.zjut.Person.name
private int dd.zjut.Person.age
private dd.zjut.Person$Sex dd.zjut.Person.sex
public static java.util.Map dd.zjut.Person.agePersonCount


name: daodao, age: 26, sex: MALE
name: xixi, age: 26, sex: MALE
name: xixi, age: 26, sex: MALE
name: haha, age: 15, sex: FEMALE
class dd.zjut.Animal
*/