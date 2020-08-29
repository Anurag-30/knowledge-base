package com.java.learning;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import com.java.learning.Checks;

public class AmountLimit {

    Checks amount = new Checks();

    @Test
    public void CheckAmountLimit(){
        assertEquals("Please enter a valid amount in between 1000 and 1000000000", amount.limit(100));

    }

    @Test
    public void CheckForValidAmount(){
        assertEquals("ok",amount.limit(5000));
    }
}
