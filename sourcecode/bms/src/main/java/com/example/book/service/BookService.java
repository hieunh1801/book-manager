package com.example.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.book.dao.BookDAO;
import com.example.book.entity.BookBO;
import com.example.book.entity.BookBean;
import com.example.book.entity.BookForm;
import com.example.common.DataTableResults;
import com.example.common.UttData;

@Service
public class BookService {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
    private UttData uttData;

	public List<BookBO> getAll() {
		return bookDAO.getALl();
	}
	
	public BookBO getById(Long id) {
		return bookDAO.getById(id);
	}
	
	public DataTableResults<BookBean> search(BookForm form) {
        return bookDAO.search(uttData, form);
    }
	
	public void saveOrUpdate(BookBO bookBO) {
		bookDAO.save(bookBO);
	}
	
	public void deleteById(Long id) {
		bookDAO.deleteById(id);
	}
	
}
