package com.example.borrow.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.borrow.bo.BorrowBO;
import com.example.borrow.dao.BorrowDAO;
import com.example.common.UttData;

@Service
public class BorrowService {

    @Autowired
    private BorrowDAO borrowDAO;
    
    @Autowired
    private UttData vfData;
    
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
}
