package com.java.learning;

import java.security.Principal;
import java.util.Scanner;

public class EmiCalculator {

    public int EmiAmount(){

        Checks check = new Checks();

        float Amount=2000;
        float RateOfInterest;
        float NumberOfYears;

        Scanner UserInputs = new Scanner(System.in);

        System.out.printf("Enter your principal amount(1000-1000000000): ");

        Amount = Float.parseFloat(UserInputs.nextLine());

        String result = check.limit(Amount);

        if(result != "ok"){
            System.out.println("Enter a valid amount in the given range");
            return 1;
        }


        System.out.printf("Enter Rate of Interest: ");

        RateOfInterest = Float.parseFloat(UserInputs.nextLine());


        System.out.printf("Tenure for the Loan: ");

        NumberOfYears = Float.parseFloat(UserInputs.nextLine());


        float NumberOfMonths = Math.round(NumberOfYears * 12);

        System.out.printf("The EMI is calculated by rounding of the months to "+ NumberOfMonths);



        float MonthlyInterest = (RateOfInterest / 100) / 12;

        // Calculate (1+r)^n as this expression is used multiple times to calculate the EMI

        float Expression = (float) Math.pow((1 + MonthlyInterest), NumberOfMonths);


        float Emi = Amount * ((MonthlyInterest * Expression) / (Expression -1));

        //ouble roundOff = Math.round(a*100)/100D;

        System.out.println("\n The EMI to be paid is: "+ Math.round(Emi*100)/100F + "Rs");


        return 0;


    }
}
