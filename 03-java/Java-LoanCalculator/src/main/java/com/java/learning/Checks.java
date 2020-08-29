package com.java.learning;

public class Checks {

    public String limit(float amount){

        if (amount < 1000 | amount > 1000000000){

        }
        else{
            return "ok";
        }

        return "Please enter a valid amount in between 1000 and 1000000000";
    }


}
