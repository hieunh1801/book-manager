package com.example.book.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.book.entity.BookBO;
import com.example.book.entity.BookBean;
import com.example.book.entity.BookForm;
import com.example.common.CommonUtil;
import com.example.common.DataTableResults;
import com.example.common.UttData;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.query.Param;

@Transactional
@Repository
public interface BookDAO extends CrudRepository<BookBO, Long> {

	@Query(value = "select * from book b", nativeQuery = true)
    public List<BookBO> getALl();
	
	@Query(value = "select * from book b where b.id = :id", nativeQuery = true)
	public BookBO getById(@Param("id") Long id);

	// For search
    public default DataTableResults<BookBean> search(UttData uttData, BookForm formData) {
        List<Object> paramList = new ArrayList<>();
        String sql = " SELECT ";
        sql += "  b.id as id ";
        sql += " ,b.code as code ";
        sql += " ,b.name as name";
        sql += " ,b.description as description ";
        sql += " ,b.author as author ";
        sql += " ,b.amount as amount ";
        sql += " ,b.category_id as category_id ";
        sql += " ,c.name as categoryName ";
        sql += " from book b inner join category c on b.category_id = c.id  ";

        StringBuilder strCondition = new StringBuilder(" WHERE 1 ");
        CommonUtil.filter(formData.getId(), strCondition, paramList, "b.id");
        CommonUtil.filter(formData.getCode(), strCondition, paramList, "b.code");
        CommonUtil.filter(formData.getName(), strCondition, paramList, "b.name");
        CommonUtil.filter(formData.getDescription(), strCondition, paramList, "b.description");
        CommonUtil.filter(formData.getAuthor(), strCondition, paramList, "b.author");
        CommonUtil.filter(formData.getAmount(), strCondition, paramList, "b.amount");
        CommonUtil.filter(formData.getCategoryId(), strCondition, paramList, "b.category_id");

        String selectFields = " order by id ";

        return uttData.findPaginationQuery(sql + strCondition.toString(), selectFields, paramList, BookBean.class);
    }

}
