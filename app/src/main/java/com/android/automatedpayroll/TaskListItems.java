package com.android.automatedpayroll;

public class TaskListItems {

    public String job,jlocation,date,description,RosterID,roster_cycle;

    public TaskListItems(String job, String jlocation, String date, String description,String RosterID) {
        this.job = job;
        this.jlocation = jlocation;
        this.date = date;
        this.description = description;
        this.RosterID = RosterID;

    }

    public String getJob() {
        return job;
    }

    public String getJlocation() {
        return jlocation;
    }

    public String getDate() {
        return date;
    }

    public String getDescription() {
        return description;
    }

    public String getRosterID() {
        return RosterID;
    }



}
