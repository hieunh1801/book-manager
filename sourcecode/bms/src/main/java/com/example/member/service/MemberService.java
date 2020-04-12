package com.example.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.common.DataTableResults;
import com.example.common.UttData;
import com.example.member.bean.MemberBean;
import com.example.member.bo.MemberBO;
import com.example.member.dao.MemberDAO;
import com.example.member.form.MemberForm;

@Service
public class MemberService {
	@Autowired
	MemberDAO memberDAO;
	@Autowired
    private UttData uttData;
	public List<MemberBO> getALl(){
		return memberDAO.getALl();
	}
	
	public MemberBO getById(Long id) {
		return memberDAO.getById(id);
	}
	
	public DataTableResults<MemberBean> search(MemberForm form) {
        return memberDAO.search(uttData, form);
    }
	
	public void saveOrUpdate(MemberBO bo) {
		memberDAO.save(bo);
	}
	
	public void deleteById(Long id) {
		memberDAO.deleteById(id);
	}
	
	public DataTableResults<MemberBean> searchReport(MemberForm formData) {
	    return memberDAO.searchReport(uttData, formData);
	}
}
