package com.android.automatedpayroll;

public class Task_Acceptance_Items {

    public String AssignID,EID,Job,JLocation,JLocation_lat,JLocation_longi,Instructions,Special,Contact,Roster_Cycle,StartTime,EndTime,JobID,Status;

    public Task_Acceptance_Items(String assignID, String EID, String job, String JLocation, String JLocation_lat, String JLocation_longi, String instructions, String special, String contact, String roster_Cycle, String startTime, String endTime, String jobID, String status) {
        AssignID = assignID;
        this.EID = EID;
        Job = job;
        this.JLocation = JLocation;
        this.JLocation_lat = JLocation_lat;
        this.JLocation_longi = JLocation_longi;
        Instructions = instructions;
        Special = special;
        Contact = contact;
        Roster_Cycle = roster_Cycle;
        StartTime = startTime;
        EndTime = endTime;
        JobID = jobID;
        Status = status;
    }

    public String getAssignID() {
        return AssignID;
    }

    public String getEID() {
        return EID;
    }

    public String getJob() {
        return Job;
    }

    public String getJLocation() {
        return JLocation;
    }

    public String getJLocation_lat() {
        return JLocation_lat;
    }

    public String getJLocation_longi() {
        return JLocation_longi;
    }

    public String getInstructions() {
        return Instructions;
    }

    public String getSpecial() {
        return Special;
    }

    public String getContact() {
        return Contact;
    }

    public String getRoster_Cycle() {
        return Roster_Cycle;
    }

    public String getStartTime() {
        return StartTime;
    }

    public String getEndTime() {
        return EndTime;
    }

    public String getJobID() {
        return JobID;
    }

    public String getStatus() {
        return Status;
    }
}
