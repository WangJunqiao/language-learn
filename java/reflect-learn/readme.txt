generate proj:
mvn archetype:generate -DgroupId=dd.zjut -DartifactId=reflect-learn -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

转变成intelli idea项目：
mvn idea:idea

Java反射机制主要提供下面几种用途：
1,在运行时判断任意一个对象所属的类
2,在运行时构造任意一个类的对象
3,在运行时判断任意一个类所具有的成员变量和方法
4,在运行时调用任意一个对象的方法


使用java的反射机制，一般需要遵循三步：
1,获得你想操作类的Class对象
2,通过第一步获得的Class对象去取得操作类的方法或是属性名
3,操作第二步取得的方法或是属性


Java运行的时候，某个类无论生成多少个对象，他们都会对应同一个Class对象，它表示正在运行程序中的类和接口。如何取得操作类的Class对象，常用的有三种方式：
1,调用Class的静态方法forName；
2,使用类的.class语法，如：Class<?> cls = String.class；
3,调用对象的getClass方法，如：String str = "abc"；Class<?> cls = str .getClass()；


