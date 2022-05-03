package com.android.automatedpayroll;

public class PaymentListItems {
    public String GrossPayment,HourRate,InvoiceID,Job,Paycycle,RosterID,Tax,WorkedHours;

    public PaymentListItems(String grossPayment, String hourRate, String invoiceID, String job, String paycycle, String rosterID, String tax, String workedHours) {
        GrossPayment = grossPayment;
        HourRate = hourRate;
        InvoiceID = invoiceID;
        Job = job;
        Paycycle = paycycle;
        RosterID = rosterID;
        Tax = tax;
        WorkedHours = workedHours;
    }

    public String getGrossPayment() {
        return GrossPayment;
    }

    public void setGrossPayment(String grossPayment) {
        GrossPayment = grossPayment;
    }

    public String getHourRate() {
        return HourRate;
    }

    public void setHourRate(String hourRate) {
        HourRate = hourRate;
    }

    public String getInvoiceID() {
        return InvoiceID;
    }

    public void setInvoiceID(String invoiceID) {
        InvoiceID = invoiceID;
    }

    public String getJob() {
        return Job;
    }

    public void setJob(String job) {
        Job = job;
    }

    public String getPaycycle() {
        return Paycycle;
    }

    public void setPaycycle(String paycycle) {
        Paycycle = paycycle;
    }

    public String getRosterID() {
        return RosterID;
    }

    public void setRosterID(String rosterID) {
        RosterID = rosterID;
    }

    public String getTax() {
        return Tax;
    }

    public void setTax(String tax) {
        Tax = tax;
    }

    public String getWorkedHours() {
        return WorkedHours;
    }

    public void setWorkedHours(String workedHours) {
        WorkedHours = workedHours;
    }
}
