package com.java.learning;

import java.util.Scanner;

public class EmiCalculator {

    public String EmiAmount(){

        Checks check = new Checks();

        float Amount=2000;
        Scanner UserInputs = new Scanner(System.in);

        System.out.printf("Enter your principal amount");

        Amount = Float.parseFloat(UserInputs.nextLine());

        String result = check.limit(Amount);

        if (result != "ok"){


        }

        return "Enter a valid amount";
    }
}
