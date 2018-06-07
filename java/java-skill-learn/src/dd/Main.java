package dd;

import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
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

        new Main().test();;
    }
    void test() {
        Solution s = new Solution();
        System.out.println(s.largestNumber(new int[]{3,30,34,5,9}));
    }
    class Solution {
        public String largestNumber(int[] nums) {
            List<String> list = new ArrayList<>();
            for (int x : nums) {
                list.add("" + x);
            }
            Collections.sort(list, new Comparator<String>() {
                @Override
                public int compare(String o1, String o2) {
			return (o2 + o1).compareTo(o1 + o2);
                }
            });
            String rtv = "";
            for (String s : list) rtv = rtv + s;
            while (rtv.length() > 0 && rtv.startsWith("0")) rtv = rtv.substring(1);
            return rtv;
        }
    }
}
