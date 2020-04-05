package com.example.systemParam.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.book.entity.CategoryBean;
import com.example.common.UttData;
import com.example.systemParam.bo.SystemParamBO;

@Transactional
@Repository
public interface SystemParamDAO   extends JpaRepository<SystemParamBO, Long> {
    
    public default int deleteAfterSave( UttData uttData,List<Long> ids) {
        String hql = "DELETE FROM system_param c "
                + " WHERE 1 = 1 AND c.id not in :ids ";
        SQLQuery query = uttData.createSQLQuery(hql);
        query.setParameter("ids", ids);
        uttData.setResultTransformer(query, SystemParamBO.class);
        return query.executeUpdate();
    }
    
    public default SystemParamBO getByCode(UttData uttData, String code) {
        String hql = "SELECT " 
                + "    c.id as id "
                + "    ,c.name as name "
                + "    ,c.code as code "
                + "    ,c.svalue as svalue "
                + " FROM system_param c "
                + " WHERE 1 = 1 AND LOWER(c.code) = LOWER(:code) ";
        SQLQuery query = uttData.createSQLQuery(hql);
        query.setParameter("code", code);
        uttData.setResultTransformer(query, SystemParamBO.class);
        return (SystemParamBO) query.uniqueResult();
    }
}
