package com.example.borrow.bean;

import java.util.Date;

public class BorrowBean {
    private Long id;
    private String code;
    private Date fromDate;
    private Date toDate;
    private Long status;
    private Long bookId;
    private Long memberId;
    private String bookName;
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getCode() {
        return code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    
    public Date getFromDate() {
        return fromDate;
    }
    
    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }
    
    
    
    public Date getToDate() {
        return toDate;
    }

    
    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public Long getStatus() {
        return status;
    }
    
    public void setStatus(Long status) {
        this.status = status;
    }
    
    public Long getBookId() {
        return bookId;
    }
    
    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }
    
    public Long getMemberId() {
        return memberId;
    }
    
    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    
    public String getBookName() {
        return bookName;
    }

    
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
    
    
}
