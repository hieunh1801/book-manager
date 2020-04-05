package com.example.borrow.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.example.book.entity.BookForm;
import com.example.borrow.bean.BorrowBean;
import com.example.borrow.bo.BorrowBO;
import com.example.borrow.dao.BorrowDAO;
import com.example.borrow.form.BorrowForm;
import com.example.common.DataTableResults;
import com.example.common.UttData;
import com.example.member.bean.MemberBean;

@Service
public class BorrowService {

    @Autowired
    private BorrowDAO borrowDAO;
    
    @Autowired
    private UttData uttData;
    
    @Transactional
    public void saveOrUpdate(BorrowBO entity) {
        borrowDAO.save(entity);
    }


    public void delete(BorrowBO entity) {
        borrowDAO.delete(entity);
    }
    
    public BorrowBO findById(Long id) {
        return borrowDAO.findById(id).orElse(null);
    }
    
    public  DataTableResults<BorrowBean> searchHistory(BorrowForm formData) {
        return borrowDAO.searchHistory(uttData, formData);
    }
    
    public  List<MemberBean> searchMemberAutoComplete( String search) {
        return borrowDAO.searchMemberAutoComplete(uttData, search);
    }
    public  DataTableResults<BorrowBean> searchBorrow( BorrowForm formData) {
        return borrowDAO.searchBorrow(uttData, formData);
    }
    
    public void deleteAfterSave(Long memberId, List<Long> ids) {
        borrowDAO.deleteAfterSave(memberId, ids);
    }
    
    public  DataTableResults<BorrowBean> search( BorrowForm formData) {
        return borrowDAO.search(uttData, formData);
    }
}
