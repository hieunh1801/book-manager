package com.example.book.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.book.entity.CategoryBO;
import com.example.book.entity.CategoryBean;
import com.example.book.entity.CategoryForm;
import com.example.common.CommonUtil;
import com.example.common.DataTableResults;
import com.example.common.UttData;

@Transactional
@Repository
public interface CategoryDAO  extends CrudRepository<CategoryBO, Long>{
	
	@Query(value = "select * from category c", nativeQuery = true)
    public List<CategoryBO> getALl();
	
	@Query(value = "select * from category c where c.id = :id", nativeQuery = true)
	public CategoryBO getById(@Param("id") Long id);

	// For search
    public default DataTableResults<CategoryBean> search(UttData uttData, CategoryForm formData) {
        List<Object> paramList = new ArrayList<>();
        String sql = " SELECT ";
        sql += "  c.id as id ";
        sql += " ,c.code as code ";
        sql += " ,c.name as name";
        sql += " ,c.note as note ";
        sql += " from category c ";

        StringBuilder strCondition = new StringBuilder(" WHERE 1 ");
        CommonUtil.filter(formData.getId(), strCondition, paramList, "id");
        CommonUtil.filter(formData.getCode(), strCondition, paramList, "code");
        CommonUtil.filter(formData.getName(), strCondition, paramList, "name");
        CommonUtil.filter(formData.getNote(), strCondition, paramList, "note");

        
        String selectFields = " order by id ";
        
        return uttData.findPaginationQuery(sql + strCondition.toString(), selectFields, paramList, CategoryBean.class);
    }
}
