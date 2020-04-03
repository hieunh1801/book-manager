package com.example.borrow.form;

import java.util.List;

public class BorrowInfoForm {
    private Long memberId;
    private List<BorrowForm> lstBorrow;
    
    public Long getMemberId() {
        return memberId;
    }
    
    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }
    
    public List<BorrowForm> getLstBorrow() {
        return lstBorrow;
    }
    
    public void setLstBorrow(List<BorrowForm> lstBorrow) {
        this.lstBorrow = lstBorrow;
    }
    
    
}
