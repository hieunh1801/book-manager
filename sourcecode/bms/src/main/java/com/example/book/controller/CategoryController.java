package com.example.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.book.entity.CategoryBO;
import com.example.book.service.CategoryService;
import com.example.user.entity.UserForm;

@RestController
@RequestMapping("/categories")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

	@GetMapping(path = "")
	public @ResponseBody List<CategoryBO> apiGetAllBook(HttpServletRequest req, UserForm user) {
		List<CategoryBO> listCategory = categoryService.getALl();
		return listCategory;
	}
}
