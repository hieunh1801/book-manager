package com.example.user.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.common.CommonUtil;
import com.example.common.DataTableResults;
import com.example.common.UttData;
import com.example.user.entity.UserBO;
import com.example.user.entity.UserBean;
import com.example.user.entity.UserBean2;
import com.example.user.entity.UserForm;


/**
 * @author TanPTN
 * @since May 3, 2019
 * @version 1.0	
 */
@Transactional
@Repository
public interface UserDAO extends CrudRepository<UserBO, Long> {
    UserBO findByAccount(String account);
    
//    @Query("SELECT u FROM UserBO u WHERE positionId = :positionId AND role_id = 2")
//    public List<UserBO> findByPositionId(@Param("positionId")Long positionId);
    
    //Lấy ra UserBO bởi userCode
    @Query("SELECT u FROM UserBO u WHERE LOWER(u.code) = LOWER(:code)")
    public UserBO findByCode(@Param("code")String userCode);

//    @Autowired
//    private CommonData commonData;
    /**
     * Find by name.
     */
//    public UserBO findByUserName(String userName);
    
//    public UserBO findUserAccount(String userName, EntityManager entityManager) {
//        try {
//            String sql = "SELECT e FROM " + UserBO.class.getName() + " e " 
//                    + " WHERE e.userName = :userName ";
// 
//            Query query = entityManager.createQuery(sql, UserBO.class);
//            query.setParameter("userName", userName);
// 
//            return (UserBO) query.getSingleResult();
//        } catch (NoResultException e) {
//            return null;
//        }
//    }

    public default UserBean getUserWithRole(UttData uttData, String account) {
        String hql = "SELECT " 
                + "     usr.id AS userId " 
                + "     , usr.account as account " 
                + "     , usr.password as password "
                + "     , rls.name as role"
                + " FROM user usr "
                + " INNER JOIN role rls ON usr.role_id = rls.id "
                + " WHERE 1 = 1 AND LOWER(usr.account) = :account";
        SQLQuery query = uttData.createSQLQuery(hql);
        query.setParameter("account", account.toLowerCase());
        uttData.setResultTransformer(query, UserBean.class);
        return (UserBean) query.uniqueResult();
    }
    
    public default UserBean getUserByName(UttData uttData, String userName) {
        String hql = "SELECT " 
                + "     usr.id AS userId " 
                + "     , usr.account as account " 
                + "     , usr.password as password "
                + "     ,usr.full_name as fullName "
                + "     ,usr.gender as gender "
                + "     ,usr.date_of_birth AS dateOfBirth "
                + "     ,usr.email AS email "
                + "     ,usr.phone_number AS phoneNumber "
                + "     ,usr.avatar_url AS avatarUrl "
                + "     ,usr.code AS userCode "
                + "     ,usr.roles AS roles "
                + " FROM user usr "
                + " WHERE 1 = 1 AND LOWER(usr.account) = :account";
        SQLQuery query = uttData.createSQLQuery(hql);
        query.setParameter("account", userName.toLowerCase());
        uttData.setResultTransformer(query, UserBean.class);
        return (UserBean) query.uniqueResult();
    }
    /**
     * get data by datatable
     * @param uttData
     * @return
     */
    
    public default DataTableResults<UserBean> getStudentList(UttData uttData, UserForm userForm, HttpServletRequest req) {
        List<Object> paramList = new ArrayList<>();
        String nativeSQL = "SELECT "
                + "     usr.id AS id " 
                + "     , usr.account as account " 
                + "     , usr.password as password "
                + "     ,usr.full_name as fullName "
                + "     ,usr.gender as gender "
                + "     ,usr.date_of_birth AS dateOfBirth "
                + "     ,usr.email AS email "
                + "     ,usr.phone_number AS phoneNumber "
                + "     ,usr.code AS code "
                + " FROM user usr ";

        StringBuilder strCondition = new StringBuilder(" WHERE 1 = 1 ");
        
        CommonUtil.filter(userForm.getUserCode(), strCondition, paramList, "usr.code");
        CommonUtil.filter(userForm.getFullName(), strCondition, paramList, "usr.full_name");

        String orderBy = " ORDER BY id DESC ";
        return uttData.findPaginationQuery(nativeSQL + strCondition.toString(), orderBy, paramList, UserBean.class);
    }
    

    
    /**
     * get data by datatable
     * @param uttData
     * @return
     */
    
    public default DataTableResults<UserBean2> getDatatable(UttData uttData, UserForm userForm, HttpServletRequest req) {
        List<Object> paramList = new ArrayList<>();
        String nativeSQL = "SELECT "
                + "     usr.id AS id " 
                + "     , usr.account as userName " 
//                + "     , usr.password as password "
                + "     ,usr.full_name as fullName "
                + "     ,usr.gender as gender "
                + "     ,usr.date_of_birth AS dateOfBirth "
                + "     ,usr.email AS email "
                + "     ,usr.phone_number AS phoneNumber "
                + "     ,usr.code AS code "
                + " FROM user usr ";

        StringBuilder strCondition = new StringBuilder(" WHERE 1 = 1");
        
        CommonUtil.filter(userForm.getUserCode(), strCondition, paramList, "usr.code");
        CommonUtil.filter(userForm.getFullName(), strCondition, paramList, "usr.full_name");
//        CommonUtil.filter(userForm.getCourse(), strCondition, paramList, "pst.course");
//        CommonUtil.filter(userForm.getPositionId(), strCondition, paramList, "pst.position_id");

        String orderBy = " ORDER BY id DESC ";
        return uttData.findPaginationQuery(nativeSQL + strCondition.toString(), orderBy, paramList, UserBean2.class);
    }


    public default UserBean getUserInfoById(UttData uttData, Long userId) {
        String hql = "SELECT " 
                + "     usr.user_id AS userId " 
                + "     , usr.user_name as userName " 
                + "     , usr.password as password "
                + "     ,usr.full_name as fullName "
                + "     ,usr.gender as gender "
                + "     ,usr.date_of_birth AS dateOfBirth "
                + "     ,usr.email AS email "
                + "     ,usr.mobile_number AS mobileNumber "
                + "     ,usr.user_code AS userCode "
                + "     , rls.role as role"
                + "     , rls.role_name as roleName"
                + " FROM users usr "
                + " INNER JOIN roles rls ON usr.role_id = rls.role_id "
                + " WHERE 1 = 1 AND usr.user_id = :userId";
        SQLQuery query = uttData.createSQLQuery(hql);
        query.setParameter("userId", userId);
        uttData.setResultTransformer(query, UserBean.class);
        return (UserBean) query.uniqueResult();
    }
}
