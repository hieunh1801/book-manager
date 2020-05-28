package com.example.dashboard.form;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class CharStatisticalForm {
    private LocalDate fromDate;
    private LocalDate toDate;
    private String frequency;

    public LocalDate getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(fromDate, formatter);
        this.fromDate = localDate;
    }

    public LocalDate getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(toDate, formatter);
        this.toDate = localDate;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
}
