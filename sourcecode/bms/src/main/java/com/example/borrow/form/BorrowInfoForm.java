package com.example.borrow.form;

import java.util.List;

import com.example.systemParam.form.SystemParamForm;

public class BorrowInfoForm {
    private Long memberId;
    private List<BorrowForm> lstBorrow;
    private List<SystemParamForm>  lstParam;  
    
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

    
    public List<SystemParamForm> getLstParam() {
        return lstParam;
    }

    
    public void setLstParam(List<SystemParamForm> lstParam) {
        this.lstParam = lstParam;
    }
    
    
}
