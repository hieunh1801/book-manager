package com.example.dashboard.controller;

import com.example.dashboard.bean.DashboardStatisticBean;
import com.example.dashboard.form.CharStatisticalForm;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.common.Response;
import com.example.dashboard.services.DashboardServices;

import java.time.LocalDate;
import java.util.*;

@RestController
@RequestMapping("/dashboard")
public class DashboardController {
    @Autowired
    private DashboardServices dashboardServices;

    @GetMapping(path = "")
    public @ResponseBody
    String testApi() {
        dashboardServices.getDashboardStatistic();
        return "This is test API";
    }

    @GetMapping(path = "/statistical")
    public @ResponseBody
    Response apiGetDashboardStatistical() {
        DashboardStatisticBean dashboardStatisticBean = new DashboardStatisticBean();
        dashboardStatisticBean.setTotalBorrowBookCurrentMonth(dashboardServices.getBorrowCurrentMonth());
        dashboardStatisticBean.setTotalGiveBackBookCurrentMonth(dashboardServices.getGiveBackCurrentMonth());
        dashboardStatisticBean.setTotalMember(dashboardServices.getTotalMember());
        dashboardStatisticBean.setTotalBorrowBook(dashboardServices.getTotalBorrowBook());
        dashboardStatisticBean.setTotalAvailableBook(dashboardServices.getTotalAvailableBook());
        return Response.success("Get success").withData(dashboardStatisticBean);
    }

    @GetMapping(path = "/char-data")
    public @ResponseBody
    Response Response (CharStatisticalForm searchForm) {
        LocalDate fromDate = searchForm.getFromDate();
        LocalDate toDate = searchForm.getToDate();
        String frequency = searchForm.getFrequency();
        if (frequency.equals("day")) {
            return Response.success("get by day success").withData(dashboardServices.getCharDataByDay(fromDate, toDate));
        } else if (frequency.equals("month")) {
            return Response.success("get by month success").withData(dashboardServices.getCharDataByMonth(fromDate, toDate));
        } else if (frequency.equals("year")) {
            return Response.success("get by year success").withData(dashboardServices.getCharDataByYear(fromDate, toDate));
        }
        return Response.success("apiGetCharData running");
    }

    @GetMapping(path = "/char-frequency")
    public @ResponseBody
    Response apiGetCharFrequency() {
        List<String> frequencies = new ArrayList<String>();
        frequencies.add("day");
        frequencies.add("month");
        frequencies.add("year");
        return Response.success("apiGetCharData running").withData(frequencies);
    }
}
