package main;

import wrapper.binding_test_library;

public class Main {
    public static void main(String[] args) {
        System.loadLibrary("binding_test_library_java");

        System.out.println("ABS(0) = " + binding_test_library.abs(0));
        System.out.println("ABS(1) = " + binding_test_library.abs(1));
        System.out.println("ABS(-1) = " + binding_test_library.abs(-1));
    }
}
