package com.example.user.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

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

}
