package com.example.book.controller;

import java.util.Date;

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

import com.example.book.dao.BookDAO;
import com.example.book.entity.BookBO;
import com.example.book.entity.BookBean;
import com.example.book.entity.BookForm;
import com.example.book.service.BookService;
import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.DataTableResults;
import com.example.common.Response;
import com.example.exception.SysException;
import com.example.user.entity.UserForm;

import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {

	@Autowired
	private BookService bookService;

	@GetMapping(path = "")
	public @ResponseBody List<BookBO> apiGetAllBook(HttpServletRequest req, UserForm user) {
		List<BookBO> listBooks = bookService.getAll();
		return listBooks;
	}

	@PostMapping(path = "")
	@ResponseStatus(HttpStatus.CREATED)
	public @ResponseBody Response saveOrUpdate(HttpServletRequest req, @RequestBody BookForm form) throws Exception {
		Long id = CommonUtil.NVL(form.getId());
		BookBO bookBO;
		if (id > 0L) {
			bookBO = bookService.getById(id);
			if (bookBO == null) {
				return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
			}
		} else {
			bookBO = new BookBO();
		}
		bookBO.setAmount(form.getAmount());
		bookBO.setAuthor(form.getAuthor());
		bookBO.setCategoryId(form.getCategoryId());
		bookBO.setCode(form.getCode());
		bookBO.setDescription(form.getDescription());
		bookBO.setImageUrl(form.getImageUrl());
		bookBO.setName(form.getName());
		bookBO.setPublisher(form.getPublisher());
		bookService.saveOrUpdate(bookBO);
		return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(bookBO);
	}

	@GetMapping(path = "/{id}")
	public @ResponseBody Response apiGetById(HttpServletRequest req, @PathVariable Long id) {
		String book = "You get book_id + " + id.toString();
		return Response.success().withData(book);
	}

    @DeleteMapping(path = "/{id}")
    public @ResponseBody Response delete(HttpServletRequest req, @PathVariable Long id){
        BookBO bookBO = bookService.getById(id);
        if (bookBO == null) {
            return Response.warning(Constants.RESPONSE_CODE.RECORD_NOT_EXISTED);
        }
        bookService.deleteById(bookBO.getId());
        return Response.success().withData(bookBO);
    }


	@GetMapping(path = "/search")
	public @ResponseBody DataTableResults<BookBean> apiSearch(HttpServletRequest req, BookForm form) {
		DataTableResults<BookBean> listBooks = bookService.search(form);
		return listBooks;
	}
}
