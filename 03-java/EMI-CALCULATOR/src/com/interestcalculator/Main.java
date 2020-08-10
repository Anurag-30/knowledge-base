// This is a sample program to calculate EMI

package com.interestcalculator;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.print("enter principal amount: ");
        int principal = scanner.nextInt();
        System.out.print("enter Interest per Annum: ");
        float interest_annum = scanner.nextFloat();
        System.out.print("enter Tenure in years: ");
        final int MONTHS = 12;
        final int PERCENTAGE = 100;
        int tenure_years = scanner.nextInt();
        int tenure_months = tenure_years * MONTHS;
        float interest_month = (interest_annum / PERCENTAGE) / MONTHS;
        float amount = (float) (principal * (interest_month * Math.pow(1+interest_month , tenure_months)) / (Math.pow(1+interest_month,tenure_months) -1));
        System.out.println("Your Monthly Payment is :"+ amount);


    }
}
