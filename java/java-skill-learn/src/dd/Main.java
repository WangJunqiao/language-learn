package dd;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {
    public static void main(String[] args) {
        System.out.println("dddddddddddddddddddddddddddddddd");
        ExecutorService service = Executors.newFixedThreadPool(10);
        service.submit(() -> {System.out.println("thread 1");});
        service.submit(() -> {System.out.println("thread 1");});
        service.submit(() -> {System.out.println("thread 1");});
        service.submit(() -> {System.out.println("thread 1");});
        service.submit(() -> {System.out.println("thread 1");});
        service.submit(() -> {System.out.println("thread 1");});
        service.shutdown();
        System.out.println(service.isShutdown());
    }
}
