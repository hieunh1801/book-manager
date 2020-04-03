package com.example.borrow.bo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "borrow")

public class BorrowBO {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @Id
    private Long id;

    @Column(name = "code")
    private String code;
    
    @Column(name = "from_date")
    private Date fromDate;
    
    @Column(name = "to_date")
    private Date toDate;
    
    @Column(name = "status")
    private Long status;
    
    @Column(name = "book_id")
    private Long bookId;
    
    @Column(name = "member_id")
    private Long memberId;

    
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
    
    
    
}
