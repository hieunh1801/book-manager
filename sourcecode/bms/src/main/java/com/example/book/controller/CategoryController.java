package com.example.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.book.entity.BookBO;
import com.example.book.entity.BookBean;
import com.example.book.entity.BookForm;
import com.example.book.entity.CategoryBO;
import com.example.book.entity.CategoryBean;
import com.example.book.entity.CategoryForm;
import com.example.book.service.CategoryService;
import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.DataTableResults;
import com.example.common.Response;
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

	@GetMapping(path = "/{id}")
	public @ResponseBody Response apiGetById(HttpServletRequest req, @PathVariable Long id) {
		CategoryBO categoryBO = categoryService.getById(id);
		return Response.success().withData(categoryBO);
	}

	@DeleteMapping(path = "/{id}")
	public @ResponseBody Response delete(HttpServletRequest req, @PathVariable Long id) {
		CategoryBO categoryBO = categoryService.getById(id);
		if (categoryBO == null) {
			return Response.warning(Constants.RESPONSE_CODE.RECORD_NOT_EXISTED);
		}
		categoryService.deleteById(categoryBO.getId());
		return Response.success().withData(categoryBO);
	}

	@GetMapping(path = "/search")
	public @ResponseBody DataTableResults<CategoryBean> apiSearch(HttpServletRequest req, CategoryForm form) {
		DataTableResults<CategoryBean> listCategory = categoryService.search(form);
		return listCategory;
	}
	
	@PostMapping(path = "")
	@ResponseStatus(HttpStatus.CREATED)
	public @ResponseBody Response saveOrUpdate(HttpServletRequest req, @RequestBody CategoryForm form) throws Exception {
		Long id = CommonUtil.NVL(form.getId());
		CategoryBO categoryBO;
		if (id > 0L) {
			categoryBO = categoryService.getById(id);
			if (categoryBO == null) {
				return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
			}
		} else {
			categoryBO = new CategoryBO();
		}
		categoryBO.setNote(form.getNote());
		categoryBO.setName(form.getName());
		categoryBO.setCode(form.getCode());
		
		categoryService.saveOrUpdate(categoryBO);
		return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(categoryBO);
	}
}
