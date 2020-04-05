package com.example.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.book.dao.CategoryDAO;
import com.example.book.entity.CategoryBO;
import com.example.book.entity.CategoryBean;
import com.example.book.entity.CategoryForm;
import com.example.common.DataTableResults;
import com.example.common.UttData;

@Service
public class CategoryService {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
    private UttData uttData;
	public List<CategoryBO> getALl(){
		return categoryDAO.getALl();
	}
	
	public CategoryBO getById(Long id) {
		return categoryDAO.getById(id);
	}
	
	public DataTableResults<CategoryBean> search(CategoryForm form) {
        return categoryDAO.search(uttData, form);
    }
	
	public void saveOrUpdate(CategoryBO bo) {
		categoryDAO.save(bo);
	}
	
	public void deleteById(Long id) {
		categoryDAO.deleteById(id);
	}
}
