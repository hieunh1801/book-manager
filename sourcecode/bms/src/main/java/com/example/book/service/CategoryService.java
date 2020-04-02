package com.example.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.book.dao.CategoryDAO;
import com.example.book.entity.CategoryBO;

@Service
public class CategoryService {
	@Autowired
	CategoryDAO categoryDAO;
	
	public List<CategoryBO> getALl(){
		return categoryDAO.getALl();
	}
}
