package com.example.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


import com.example.common.CommonUtil;
import com.example.common.DataTableResults;
import com.example.common.UttData;
import com.example.member.bean.MemberBean;
import com.example.member.bo.MemberBO;
import com.example.member.form.MemberForm;

public interface MemberDAO extends CrudRepository<MemberBO, Long> {
	@Query(value = "select * from member c", nativeQuery = true)
    public List<MemberBO> getALl();
	
	@Query(value = "select * from member m where m.id = :id", nativeQuery = true)
	public MemberBO getById(@Param("id") Long id);

	// For search
    public default DataTableResults<MemberBean> search(UttData uttData, MemberForm formData) {
        List<Object> paramList = new ArrayList<>();
        String sql = " SELECT ";
        sql += "  id as id ";
        sql += " ,code as code ";
        sql += " ,full_name as fullName ";
        sql += " ,date_of_birth as dateOfBirth ";
        sql += " ,address as address ";
        sql += " ,phone_number as phoneNumber ";
        sql += " ,email as email ";
        sql += " ,gender as gender ";
        sql += " ,avatar_url as avatarUrl ";
        sql += " from member ";
        StringBuilder strCondition = new StringBuilder(" WHERE 1 ");
        CommonUtil.filter(formData.getId(), strCondition, paramList, "id");
        CommonUtil.filter(formData.getCode(), strCondition, paramList, "code");
        CommonUtil.filter(formData.getFullName(), strCondition, paramList, "full_name");
        CommonUtil.filter(formData.getDateOfBirth(), strCondition, paramList, "date_of_birth");
        CommonUtil.filter(formData.getAddress(), strCondition, paramList, "address");
        CommonUtil.filter(formData.getPhoneNumber(), strCondition, paramList, "phone_number");
        CommonUtil.filter(formData.getEmail(), strCondition, paramList, "email");
        CommonUtil.filter(formData.getGender(), strCondition, paramList, "gender");
        
        String selectFields = " order by id ";
        
        return uttData.findPaginationQuery(sql + strCondition.toString(), selectFields, paramList, MemberBean.class);
    }
}
