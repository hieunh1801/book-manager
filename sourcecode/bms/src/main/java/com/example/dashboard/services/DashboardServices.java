package com.example.dashboard.services;

import com.example.dashboard.bean.DashboardCharDataBean;
import com.example.dashboard.bean.DashboardCharItemDataBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.common.DataTableResults;
import com.example.common.UttData;
import com.example.dashboard.bean.DashboardStatisticBean;
import com.example.dashboard.dao.DashboardDAO;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;

@Service
public class DashboardServices {
    @Autowired
    private UttData uttData;

    @Autowired
    private DashboardDAO dashboardDAO;

    public void getDashboardStatistic() {
        dashboardDAO.getDashboardStatistic();
    }

    public BigInteger getTotalMember() {
        return dashboardDAO.getTotalMember();
    }

    public BigInteger getBorrowCurrentMonth() {
        LocalDate today = LocalDate.now();
        LocalDate beginDateOfCurrentMonth = today.withDayOfMonth(1);
        LocalDate endDateOfCurrentMonth = today.withDayOfMonth(today.lengthOfMonth());
        return dashboardDAO.getBorrowFromDateToDate(beginDateOfCurrentMonth, endDateOfCurrentMonth);
    }

    public BigInteger getGiveBackCurrentMonth() {
        LocalDate today = LocalDate.now();
        LocalDate beginDateOfCurrentMonth = today.withDayOfMonth(1);
        LocalDate endDateOfCurrentMonth = today.withDayOfMonth(today.lengthOfMonth());
        return dashboardDAO.getGiveBackFromDateToDate(beginDateOfCurrentMonth, endDateOfCurrentMonth);
    }

    public BigInteger getTotalBorrowBook() {
        return dashboardDAO.getTotalBorrowBook();
    }

    public BigInteger getTotalAvailableBook() {
        return dashboardDAO.getTotalAvailableBook();
    }

    public List<DashboardCharItemDataBean> getCharDataByDay(LocalDate fromDate, LocalDate toDate) {
        return dashboardDAO.getCharDataByDay(fromDate, toDate);
    }

    public List<DashboardCharItemDataBean> getCharDataByMonth(LocalDate fromDate, LocalDate toDate) {
        return dashboardDAO.getCharDataByMonth(fromDate, toDate);
    }
    public List<DashboardCharItemDataBean> getCharDataByYear(LocalDate fromDate, LocalDate toDate) {
        return dashboardDAO.getCharDataByYear(fromDate, toDate);
    }
}
