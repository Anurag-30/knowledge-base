package com.java.learning;

import com.java.learning.Person;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TestGreeting {
    @Test
    public void TestGreet() {
        Person anurag = new Person();
        assertEquals("Hello World", anurag.Greet());
    }
}
