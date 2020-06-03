package com.example.dashboard.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import com.example.dashboard.bean.DashboardCharDataBean;
import com.example.dashboard.bean.DashboardCharItemDataBean;
import com.example.member.bean.MemberBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.borrow.bean.BorrowBean;
import com.example.common.CommonUtil;
import com.example.common.DataTableResults;
import com.example.common.UttData;
import com.example.dashboard.bean.DashboardStatisticBean;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;


@Transactional
@Repository
public class DashboardDAO {
    @Autowired
    UttData uttData;

    public void getDashboardStatistic() {
        DashboardStatisticBean dashboardStatisticBean = new DashboardStatisticBean();
        dashboardStatisticBean.setTotalMember(this.getTotalMember());
    }

    public BigInteger getTotalMember() {
        Session session = uttData.getSession();
        String queryString = "select count(*) as totalMember from member";
        SQLQuery query = session.createSQLQuery(queryString);
        BigInteger totalMember = (BigInteger) query.uniqueResult();
        return totalMember;
    }

    public BigInteger getBorrowFromDateToDate(LocalDate fromDate, LocalDate toDate) {
        Session session = uttData.getSession();
        String fromDateString = fromDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String toDateString = toDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String queryString = "select count(*) " +
                "from borrow b " +
                "where b.from_date >= " + "'" + fromDateString + "'" +
                "and b.from_date <= " + "'" + toDateString + "'";
        SQLQuery query = session.createSQLQuery(queryString);
        BigInteger totalBorrowRequest = (BigInteger) query.uniqueResult();
        return totalBorrowRequest;
    }

    public BigInteger getGiveBackFromDateToDate(LocalDate fromDate, LocalDate toDate) {
        Session session = uttData.getSession();
        String fromDateString = fromDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String toDateString = toDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String queryString = "select count(*) " +
                "from borrow b " +
                "where b.to_date >= " + "'" + fromDateString + "'" +
                "and b.to_date <= " + "'" + toDateString + "'" +
                "and status = 3;";
        SQLQuery query = session.createSQLQuery(queryString);
        BigInteger totalBorrowRequest = (BigInteger) query.uniqueResult();
        return totalBorrowRequest;
    }

    public BigInteger getTotalBorrowBook() {
        Session session = uttData.getSession();
        String queryString = "select sum(amount_borrow) from book;";
        SQLQuery query = session.createSQLQuery(queryString);
        BigInteger totalBorrowBook = ((BigDecimal) query.uniqueResult()).toBigInteger();
        return totalBorrowBook;
    }

    public BigInteger getTotalAvailableBook() {
        Session session = uttData.getSession();
        String queryString = "select sum(amount - amount_borrow) from book;";
        SQLQuery query = session.createSQLQuery(queryString);
        BigInteger totalBorrowBook = ((BigDecimal) query.uniqueResult()).toBigInteger();
        return totalBorrowBook;
    }

    public List<DashboardCharItemDataBean> getCharDataByDay(LocalDate fromDate, LocalDate toDate) {
        List<Object> paramList = new ArrayList<>();
        String fromDateString = fromDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String toDateString = toDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String queryString = "with recursive d as ( " +
                "   select '" + fromDateString + "' as date " +
                "       union all " +
                "       select date + interval 1 day " +
                "       from d " +
                "       where date < '" + toDateString + "'), " +
                "   tmp1 as (select count(id) as totalGiveback, to_date from borrow where to_date and status = 3 group by to_date), " +
                "   tmp2 as (select from_date, count(id) as totalBorror from borrow group by from_date) " +
                "   select DATE_FORMAT(d.date, \"%d/%m/%Y\") as label,  " +
                "       if(tmp1.totalGiveback, tmp1.totalGiveback, 0 ) as giveback,       " +
                "       if(tmp2.totalBorror, totalBorror, 0 ) as borrow " +
                "    from d left join tmp1 on d.date = tmp1.to_date " +
                "       left join tmp2 on d.date = tmp2.from_date;";
        return uttData.list(queryString, paramList, DashboardCharItemDataBean.class);
    }

    public List<DashboardCharItemDataBean> getCharDataByMonth(LocalDate fromDate, LocalDate toDate) {
        List<Object> paramList = new ArrayList<>();
        String fromDateString = fromDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String toDateString = toDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String queryString = "with char_month_data as(with recursive d as ( " +
                "    select '" + fromDateString + "' as date " +
                "   union all " +
                "   select date + interval 1 day " +
                "   from d " +
                "   where date < '" + toDateString + "'), " +
                "tmp1 as (select count(id) as totalGiveback, to_date from borrow where to_date and status = 3 group by to_date), " +
                "tmp2 as (select from_date, count(id) as totalBorror from borrow group by from_date) " +
                "select DATE_FORMAT(d.date, \"%m/%Y\") as label, " +
                " if(tmp1.totalGiveback, tmp1.totalGiveback, 0 ) as giveback, " +
                " if(tmp2.totalBorror, totalBorror, 0 ) as borrow " +
                "from d left join tmp1 on d.date = tmp1.to_date " +
                " left join tmp2 on d.date = tmp2.from_date) " +
                "select cmd.label, sum(cmd.giveback) as giveback, sum(cmd.borrow) as borrow " +
                "from char_month_data cmd " +
                "group by cmd.label; ";
        return uttData.list(queryString, paramList, DashboardCharItemDataBean.class);

    }
    public List<DashboardCharItemDataBean> getCharDataByYear(LocalDate fromDate, LocalDate toDate) {
        List<Object> paramList = new ArrayList<>();
        String fromDateString = fromDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String toDateString = toDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String queryString = "with char_year_data as(with recursive d as ( " +
                "    select '" + fromDateString + "' as date " +
                "   union all " +
                "   select date + interval 1 day " +
                "   from d " +
                "   where date < '" + toDateString + "'), " +
                "tmp1 as (select count(id) as totalGiveback, to_date from borrow where to_date and status = 3 group by to_date), " +
                "tmp2 as (select from_date, count(id) as totalBorror from borrow group by from_date) " +
                "select DATE_FORMAT(d.date, \"%Y\") as label,  " +
                "   if(tmp1.totalGiveback, tmp1.totalGiveback, 0 ) as giveback, " +
                "   if(tmp2.totalBorror, totalBorror, 0 ) as borrow " +
                "from d left join tmp1 on d.date = tmp1.to_date " +
                "   left join tmp2 on d.date = tmp2.from_date) " +
                "select cyd.label, sum(cyd.giveback) as giveback, sum(cyd.borrow) as borrow " +
                "from char_year_data cyd " +
                "group by cyd.label;";
        return uttData.list(queryString, paramList, DashboardCharItemDataBean.class);
    }
}
