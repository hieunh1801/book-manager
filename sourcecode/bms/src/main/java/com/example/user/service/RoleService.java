package com.example.user.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.common.UttData;
import com.example.user.dao.RoleDAO;
import com.example.user.entity.RoleBO;



/**
 * @author TanPTN
 * @since May 3, 2019
 * @version 1.0
 */
@Service
public class RoleService {
    @Autowired
    private RoleDAO roleDAO;
    
    @Autowired
    private EntityManager entityManager;
    

    @Autowired
    private UttData uttData;
    
    public List<RoleBO> findAll() {
        return roleDAO.findAll();
    }
//    public List<String> findUserAccount(Long userId) {
//        return roleDAO.getRole(userId, entityManager);
//    }
    
    
    @Transactional
    public void saveOrUpdate(RoleBO entity) {
        roleDAO.save(entity);
    }


    public void delete(RoleBO entity) {
        roleDAO.delete(entity);
    }
    
    public RoleBO findById(Long id) {
        return roleDAO.findById(id).orElse(null);
    }
    
    
    public void deleteAll() {
        roleDAO.deleteAll();
    }
    
    public int deleteAfterSave(List<Long> ids) {
        return roleDAO.deleteAfterSave(uttData, ids);
    }
}
