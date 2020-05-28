package com.example.dashboard.bean;

import java.util.ArrayList;
import java.util.List;

public class DashboardCharDataBean {
    public List<Integer> borrows;
    public List<Integer> givebacks;
    public List<String> labels;
    public DashboardCharDataBean() {
        this.borrows = new ArrayList<>();
        this.givebacks = new ArrayList<>();
        this.labels = new ArrayList<>();
    }
    public void addToBorrows(Integer borrow) {
        this.borrows.add(borrow);
    }
    public void addToGivebacks(Integer giveback) {
        this.givebacks.add(giveback);
    }
    public void addToLables(String label) {
        this.labels.add(label);
    }
    public List<Integer> getBorrows() {
        return borrows;
    }

    public void setBorrows(List<Integer> borrows) {
        this.borrows = borrows;
    }

    public List<Integer> getGivebacks() {
        return givebacks;
    }

    public void setGivebacks(List<Integer> givebacks) {
        this.givebacks = givebacks;
    }

    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }
}
