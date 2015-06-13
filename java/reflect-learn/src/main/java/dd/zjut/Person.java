package dd.zjut;

import java.util.HashMap;
import java.util.Map;

/**
 * Person class, used for reflection testing.
 * Created by dd on 15-6-13.
 */
public class Person extends Animal implements IGrowOlder{
    private String name;
    private int age;
    private Sex sex;

    static public Map<Integer, Integer> agePersonCount = new HashMap<Integer, Integer>();

    public void agePlus() {
        age ++;
    }

    enum Sex {
        MALE,FEMALE
    }

    public Person() {
        this("daodao", 26, Sex.MALE);
    }

    public Person(String name, int age, Sex sex) {
        this.name = name;
        this.age = age;
        this.sex = sex;
        updateCount();;
    }

    private void updateCount() {
        if (agePersonCount.containsKey(age)) {
            agePersonCount.put(age, agePersonCount.get(age) + 1);
        } else {
            agePersonCount.put(age, 1);
        }
    }

    public static void printAgePersonCount() {
        System.out.println(agePersonCount.size());
    }

    public void printInfo() {
        System.out.println("name: " + name + ", age: " + age + ", sex: " + sex.name());
    }
}
