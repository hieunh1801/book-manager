package com.example.dashboard.bean;

import java.math.BigInteger;

public class DashboardStatisticBean {
    private BigInteger totalBorrowBookCurrentMonth; // tổng số sách trả lại
    private BigInteger totalGiveBackBookCurrentMonth; // tổng số sách trả lại tháng này

    private BigInteger totalBorrowBook; // tổng số sách đã mượn
    private BigInteger totalAvailableBook; // tổng số sách có sẵn

    private BigInteger totalMember; // tổng số bạn đọc

    public BigInteger getTotalBorrowBookCurrentMonth() {
        return totalBorrowBookCurrentMonth;
    }

    public void setTotalBorrowBookCurrentMonth(BigInteger totalBorrowBookCurrentMonth) {
        this.totalBorrowBookCurrentMonth = totalBorrowBookCurrentMonth;
    }

    public BigInteger getTotalGiveBackBookCurrentMonth() {
        return totalGiveBackBookCurrentMonth;
    }

    public void setTotalGiveBackBookCurrentMonth(BigInteger totalGiveBackBookCurrentMonth) {
        this.totalGiveBackBookCurrentMonth = totalGiveBackBookCurrentMonth;
    }

    public BigInteger getTotalBorrowBook() {
        return totalBorrowBook;
    }

    public void setTotalBorrowBook(BigInteger totalBorrowBook) {
        this.totalBorrowBook = totalBorrowBook;
    }

    public BigInteger getTotalAvailableBook() {
        return totalAvailableBook;
    }

    public void setTotalAvailableBook(BigInteger totalAvailableBook) {
        this.totalAvailableBook = totalAvailableBook;
    }

    public BigInteger getTotalMember() {
        return totalMember;
    }

    public void setTotalMember(BigInteger totalMember) {
        this.totalMember = totalMember;
    }
}
