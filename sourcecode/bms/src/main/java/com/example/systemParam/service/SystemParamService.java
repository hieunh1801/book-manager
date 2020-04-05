package com.example.systemParam.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.example.common.UttData;
import com.example.systemParam.bo.SystemParamBO;
import com.example.systemParam.dao.SystemParamDAO;

@Service
public class SystemParamService {
    @Autowired
    private SystemParamDAO systemParamDAO;
    
    @Autowired
    private UttData uttData;
    
    @Transactional
    public void saveOrUpdate(SystemParamBO entity) {
        systemParamDAO.save(entity);
    }


    public void delete(SystemParamBO entity) {
        systemParamDAO.delete(entity);
    }
    
    public SystemParamBO findById(Long id) {
        return systemParamDAO.findById(id).orElse(null);
    }
    
    public void deleteAfterSave( List<Long> ids) {
        systemParamDAO.deleteAfterSave(uttData, ids);
    }
    
    public SystemParamBO getByCode(String code) {
        return systemParamDAO.getByCode(uttData, code);
    }
    
    public List<SystemParamBO> findAll(){
        return systemParamDAO.findAll();
    }
    public void deleteAll() {
        systemParamDAO.deleteAll();
    }
}
