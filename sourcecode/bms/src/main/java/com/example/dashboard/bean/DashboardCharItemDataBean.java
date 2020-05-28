package com.example.dashboard.bean;

import java.math.BigInteger;
import java.util.List;

public class DashboardCharItemDataBean {

    private String label;
    private Integer borrow;
    private Integer giveback;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getBorrow() {
        return borrow;
    }

    public void setBorrow(Integer borrow) {
        this.borrow = borrow;
    }

    public Integer getGiveback() {
        return giveback;
    }

    public void setGiveback(Integer giveback) {
        this.giveback = giveback;
    }
}
