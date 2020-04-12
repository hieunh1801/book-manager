package com.example.user.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.common.UttData;
import com.example.user.entity.RoleBO;


/**
 * @author TanPTN
 * @since May 3, 2019
 * @version 1.0	
 */
@Transactional
@Repository
public interface RoleDAO extends CrudRepository<RoleBO, Long> {

//    public List<String> getRole(Long userId, EntityManager entityManager) {
//        String sql = "SELECT rl.role FROM " + RoleBO.class.getName() + " rl "
//                + " INNER JOIN " + UserRoleBO.class.getName() + " url ON rl.roleId = url.roleId"
//                + " WHERE url.userId = :userId ";
// 
//        Query query = entityManager.createQuery(sql, String.class);
//        query.setParameter("userId", userId);
//        return query.getResultList();
//    }
    

    public List<RoleBO> findAll();

    public default int deleteAfterSave(UttData uttData, List<Long> ids) {
        String sql = "delete from role where id not in :ids ";
        SQLQuery query = uttData.createSQLQuery(sql);
        query.setParameter("ids", ids);
        return query.executeUpdate();
    }
    
}
